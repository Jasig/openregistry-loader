package org.openregistry.loader

class SorConfiguration {
    String id
    String name
    String description

    def personConfiguration
    def notificationConfiguration
}

class NotificationConfiguration {
    def emailConfiguration
}

class EmailNotificationConfiguration {
    def host
    def port
    def username
    def password
    def from
    def to
}

class SorPersonConfiguration {
    def namesConfiguration
    def rolesConfiguration
    def localAttributeConfigurations = [] as Set
    def disclosureSettingsConfiguration
    def dateOfBirth
    def gender
    def ssn
}

class SorNamesConfiguration {
    def type
    def given
    def middle
    def family
    def prefix
    def suffix
}

class SorRolesConfiguration {
    def affiliation

    def sorId
    def start
    def end
    def title
    def organizationalUnit
    def sponsorId
    def sponsorType
    def personStatus
    def percentage
    def terminationReason

    def addressesConfiguration
    def emailAddressesConfiguration
    def leavesConfiguration
    def phonesConfiguration
    def urlsConfiguration
}

class SorLocalAttributeConfiguration {
    def type
    def value
}

class DisclosureSettingsConfiguration {
    def disclosureCode
    def withinGracePeriod
    def lastUpdateDate
}

class EmailAddressesConfiguration {
    def type
    def address
}

class UrlsConfiguration {
    def type
    def url
}

class AddressesConfiguration {
    def type
    def bldgNo
    def city
    def country
    def line1
    def line2
    def line3
    def postalCode
    def region
    def roomNo
    def updateDate
}

class LeavesConfiguration {
    def end
    def reason
    def start
}

class PhonesConfiguration {
    def addressType
    def areaCode
    def countryCode
    def extension
    def number
    def phoneLineOrder
    def phoneType
    def updateDate
}

class FieldConfiguration {
    def value
    def staticValue
    def normalizer
}