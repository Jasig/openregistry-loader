package org.openregistry.loader

import groovy.sql.Sql
import org.openregistry.core.domain.Type
import org.openregistry.core.domain.jpa.sor.JpaSorAddressImpl
import org.openregistry.core.domain.jpa.sor.JpaSorLeaveImpl
import org.openregistry.core.domain.jpa.sor.JpaSorPhoneImpl
import org.openregistry.core.domain.jpa.sor.JpaSorUrlImpl
import org.openregistry.core.domain.sor.SorRole
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.InitializingBean

class DatabaseViewSorPersonActionProcessor extends PersonActionProcessor implements InitializingBean {
    Logger logger = LoggerFactory.getLogger(DatabaseViewSorPersonActionProcessor)

    Sql sql

    @Override
    void afterPropertiesSet() throws Exception {
        this.sql = new Sql(dataSource)
    }

    @Override
    PersonAction process(PersonAction item) throws Exception {
        logger.debug("processing item: ${item}")

        def getFieldValue = { fieldConfig, row ->
            if (!fieldConfig) {
                return null
            }
            if (fieldConfig instanceof String) {
                return row."${fieldConfig}"
            }
            if (fieldConfig.staticValue) {
                return fieldConfig.staticValue
            }
            def value = row."${fieldConfig.value}"
            if (fieldConfig.normalizer) {
                value = fieldConfig.normalizer(value)
            }
            return value
        }

        if (item.action in [Action.UPDATE, Action.ADD]) {
            item.rows = sql.rows(databaseConfig.queries.getFromRaw, item.personId)
            item.sorPerson = getSorPerson(item)

            // do the fields that aren't row based (single value per user)
            ["dateOfBirth", "gender", "ssn"].each {
                if (sorConfiguration.personConfiguration."${it}") {
                    item.sorPerson."${it}" = getFieldValue(sorConfiguration.personConfiguration."${it}", item.rows[0])
                }
            }

            // do disclosure settings
            if (sorConfiguration.personConfiguration.disclosureSettingsConfiguration) {
                DisclosureSettingsConfiguration settings = sorConfiguration.personConfiguration.disclosureSettingsConfiguration
                def row = personRows[0]
                item.sorPerson.setDisclosureSettingInfo(getFieldValue(settings.disclosureCode, row), getFieldValue(settings.withinGracePeriod, row) ?: false, getFieldValue(settings.lastUpdateDate, row) ?: new Date())
            }

            // do the row based fields
            def doneNames = [:]
            def doneLocalAttributes = [] as Set
            def doneRoles = [:]
            def doneEmailAddresses = [] as Set
            def doneUrls = [] as Set
            def doneAddresses = [] as Set
            def doneLeaves = [] as Set
            def donePhones = [] as Set
            item.rows.each { row ->
                // do names
                def doName = {key, type, configuration ->
                    if (!doneNames.containsKey(key)) {
                        doneNames[key] = item.sorPerson.addName(referenceRepository.findType(Type.DataTypes.NAME, type)).with { name ->
                            ['given', 'middle', 'family', 'prefix', 'suffix'].each {
                                if (configuration."${it}") {
                                    name."${it}" = getFieldValue(configuration."${it}", row)
                                }
                            }
                            return name
                        }
                    }
                }
                if (sorConfiguration.personConfiguration.namesConfiguration.nameConfigurations) {
                    // we are horizontal
                    sorConfiguration.personConfiguration.namesConfiguration.nameConfigurations.each { NameDatabaseViewSorConfiguration nameConfiguration ->
                        def type = getFieldValue(nameConfiguration.type, row)
                        doName type, type, nameConfiguration
                    }
                } else {
                    def type = getFieldValue(sorConfiguration.personConfiguration.namesConfiguration.type, row)
                    def key = getFieldValue(sorConfiguration.personConfiguration.namesConfiguration.keyField, row)
                    doName key, type, sorConfiguration.personConfiguration.namesConfiguration
                }

                // do localAttributes
                if (sorConfiguration.personConfiguration.localAttributeConfigurations) {
                    sorConfiguration.personConfiguration.localAttributeConfigurations.each { LocalAttributeDatabaseViewSorConfiguration localAttributeDatabaseViewSorConfiguration ->
                        def type = getFieldValue(localAttributeDatabaseViewSorConfiguration.type, row)
                        if (!doneLocalAttributes.contains(type)) {
                            item.sorPerson.sorLocalAttributes[type] = getFieldValue(localAttributeDatabaseViewSorConfiguration.value, row)
                            doneLocalAttributes << type
                        }
                    }
                }

                // do roles
                if (sorConfiguration.personConfiguration.rolesConfiguration) {
                    def rolesConfiguration = sorConfiguration.personConfiguration.rolesConfiguration
                    def key = getFieldValue(rolesConfiguration.keyField, row)
                    if (!doneRoles.containsKey(key)) {
                        doneRoles[key] = item.sorPerson.createRole(referenceRepository.findType(Type.DataTypes.AFFILIATION, getFieldValue(rolesConfiguration.affiliation, row))).with {
                            end = getFieldValue(rolesConfiguration.end, row)
                            organizationalUnit = referenceRepository.getOrganizationalUnitByCode(getFieldValue(rolesConfiguration.organizationalUnit, row))
                            percentage = getFieldValue(rolesConfiguration.percentage, row) ?: 0
                            personStatus = referenceRepository.findType(Type.DataTypes.STATUS, getFieldValue(rolesConfiguration.personStatus, row))
                            sorId = getFieldValue(rolesConfiguration.sorId, row)
                            sponsorId = getFieldValue(rolesConfiguration.sponsorId, row)
                            sponsorType = referenceRepository.findType(Type.DataTypes.SPONSOR, getFieldValue(rolesConfiguration.sponsorType, row))
                            start = getFieldValue(rolesConfiguration.start, row)
                            getFieldValue(rolesConfiguration.terminationReason, row).with { t ->
                                if (t) {
                                    terminationReason = referenceRepository.findType(Type.DataTypes.TERMINATION, t)
                                }
                            }
                            title = getFieldValue(rolesConfiguration.title, row)

                            return it
                        }
                        item.sorPerson.addRole(doneRoles[key])
                    }
                }

                // do addresses
                if (sorConfiguration.personConfiguration.rolesConfiguration?.addressesConfiguration) {
                    def rolesConfiguration = sorConfiguration.personConfiguration.rolesConfiguration
                    def addressesConfiguration = sorConfiguration.personConfiguration.rolesConfiguration.addressesConfiguration
                    def key = [getFieldValue(rolesConfiguration.keyField, row), getFieldValue(addressesConfiguration.keyField, row)]
                    if (!doneAddresses.contains(key)) {
                        SorRole role = doneRoles[key[0]]
                        def address = new JpaSorAddressImpl(role).with {
                            type = referenceRepository.findType(Type.DataTypes.ADDRESS, getFieldValue(addressesConfiguration.type, row))

                            def cc = getFieldValue(addressesConfiguration.country, row)
                            if (cc) {
                                country = referenceRepository.getCountryByCode(cc)
                                region = referenceRepository.getRegionByCodeAndCountryId(getFieldValue(addressesConfiguration.region, row), cc) ?: referenceRepository.getRegionByCodeOrName(getFieldValue(addressesConfiguration.region, row))
                            } else {
                                region = referenceRepository.getRegionByCodeOrName(getFieldValue(addressesConfiguration.region, row))
                            }

                            ['bldgNo', 'city', 'line1', 'line2', 'line3', 'postalCode', 'roomNo', 'updateDate'].each { field ->
                                it."${field}" = getFieldValue(addressesConfiguration."${field}", row)
                            }

                            return it
                        }
                        role.addAddress(address)
                        doneAddresses << key
                    }
                }

                // do email addresses
                if (sorConfiguration.personConfiguration.rolesConfiguration?.emailAddressesConfiguration) {
                    def rolesConfiguration = sorConfiguration.personConfiguration.rolesConfiguration
                    def emailAddressesConfiguration = sorConfiguration.personConfiguration.rolesConfiguration.emailAddressesConfiguration
                    def key = [getFieldValue(rolesConfiguration.keyField, row), getFieldValue(emailAddressesConfiguration.keyField, row)] as Set
                    if (!doneEmailAddresses.contains(key)) {
                        SorRole role = doneRoles[key[0]]
                        // TODO: there are no types for email address defined, need to fix OR core for this
                        role.addOrUpdateEmail(getFieldValue(emailAddressesConfiguration.address, row), referenceRepository.findType(Type.DataTypes.ADDRESS, getFieldValue(emailAddressesConfiguration.type, row)))
                        doneEmailAddresses << key
                    }
                }

                // do leaves
                // TODO: check this
                if (sorConfiguration.personConfiguration.rolesConfiguration?.leavesConfiguration) {
                    def rolesConfiguration = sorConfiguration.personConfiguration.rolesConfiguration
                    def leavesConfiguration = rolesConfiguration.leavesConfiguration
                    def key = [getFieldValue(rolesConfiguration.keyField, row), getFieldValue(leavesConfiguration.keyField, row)]
                    if (!doneLeaves.contains(key)) {
                        SorRole role = doneRoles[key[0]]
                        role.leaves.add(new JpaSorLeaveImpl(role).with {
                            reason = referenceRepository.findType(Type.DataTypes.LEAVE, getFieldValue(leavesConfiguration.reason, row))
                            start = getFieldValue(leavesConfiguration.start, row)
                            end = getFieldValue(leavesConfiguration.end, row)
                            return it
                        })
                        doneLeaves << key
                    }
                }

                // do phones
                if (sorConfiguration.personConfiguration.rolesConfiguration?.phonesConfiguration) {
                    def rolesConfiguration = sorConfiguration.personConfiguration.rolesConfiguration
                    PhonesDatabaseViewSorConfiguration phonesConfiguration = rolesConfiguration.phonesConfiguration
                    def key = [getFieldValue(rolesConfiguration.keyField, row), getFieldValue(phonesConfiguration.keyField, row)]
                    if (!donePhones.contains(key)) {
                        SorRole role = doneRoles[key[0]]
                        role.addPhone(new JpaSorPhoneImpl(role).with {
                            addressType = referenceRepository.findType(Type.DataTypes.ADDRESS, getFieldValue(phonesConfiguration.addressType, row))
                            phoneType = referenceRepository.findType(Type.DataTypes.PHONE, getFieldValue(phonesConfiguration.phoneType, row))
                            ['areaCode', 'countryCode', 'extension', 'number', 'phoneLineOrder', 'updateDate'].each { field ->
                                it."${field}" = getFieldValue(phonesConfiguration."${field}", row)
                            }
                            return it
                        })
                        donePhones << key
                    }
                }

                // do urls
                if (sorConfiguration.personConfiguration.rolesConfiguration?.urlsConfiguration) {
                    def rolesConfiguration = sorConfiguration.personConfiguration.rolesConfiguration
                    def urlsConfiguration = sorConfiguration.personConfiguration.rolesConfiguration.urlsConfiguration
                    def key = [getFieldValue(rolesConfiguration.keyField, row), getFieldValue(urlsConfiguration.keyField, row)]
                    if (!doneUrls.contains(key)) {
                        SorRole role = doneRoles[key[0]]
                        def value = getFieldValue(urlsConfiguration.url, row)
                        role.addUrl(new JpaSorUrlImpl(role).with {
                            type = referenceRepository.findType(Type.DataTypes.URL, getFieldValue(urlsConfiguration.type, row))

                            url = new URL(value)
                            return it
                        })
                    }
                }
            }
            item.sorPerson.names.retainAll(doneNames.values())
            item.sorPerson.sorLocalAttributes.keySet().retainAll(doneLocalAttributes)
            item.sorPerson.roles.addAll(doneRoles.values())
            item.sorPerson.roles.retainAll(doneRoles.values())
        }

        return item
    }
}
