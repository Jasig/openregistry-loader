package org.openregistry.loader

import org.codehaus.groovy.control.CompilerConfiguration
import org.springframework.beans.factory.FactoryBean
import org.springframework.core.io.Resource

class DatabaseViewSorConfigurationFactoryBean implements FactoryBean<Map<String,DatabaseViewSorConfiguration>> {
    Resource file

    Map<String,DatabaseViewSorConfiguration> databaseViewSorConfigurations

    @Override
    @Newify([DatabaseViewSorConfiguration, SorPersonConfiguration])
    Map<String,DatabaseViewSorConfiguration> getObject() throws Exception {
        if (!databaseViewSorConfigurations) {
            // We'll put this here for now, but might want to move
            // TODO: move

            def field = { d, name, arg ->
                if (arg instanceof String) {
                    d."${name}" = arg
                } else if (arg instanceof Closure) {
                    d."${name}" = new FieldConfiguration()
                    arg.delegate = d."${name}"
                    arg.resolveStrategy = Closure.DELEGATE_ONLY
                    arg()
                }
            }

            def notSoSimpleMethodMissing = { Map<String, Class> cMap ->
                return { name, args ->
                    if (name != "class" && delegate.class.metaClass.getMetaProperty((String) name)) {
                        field(delegate, name, args[0])
                    } else if (cMap && name in cMap.keySet()) {
                        Closure arg = args[0]
                        def c = cMap[(String) name].newInstance()
                        arg.delegate = c
                        arg.resolveStrategy = Closure.DELEGATE_ONLY
                        arg()
                        if (name in ['localAttribute', 'name']) {
                            delegate."${name}Configurations" << c
                        } else {
                            delegate."${name}Configuration" = c
                        }
                    }
                }
            }

            DatabaseViewSorConfiguration.metaClass.methodMissing = notSoSimpleMethodMissing(
                    ["person": PersonDatabaseViewSorConfiguration]
            )
            PersonDatabaseViewSorConfiguration.metaClass.methodMissing = notSoSimpleMethodMissing(
                    [
                            "names": NamesDatabaseViewSorConfiguration,
                            "roles": RolesDatabaseViewSorConfiguration,
                            "disclosureSettings": DisclosureSettingsConfiguration,
                            'localAttribute': LocalAttributeDatabaseViewSorConfiguration
                    ]
            )
            RolesDatabaseViewSorConfiguration.metaClass.methodMissing = notSoSimpleMethodMissing(
                    [
                            'emailAddresses': EmailAddressesDatabaseViewSorConfiguration,
                            'urls': UrlsDatabaseViewSorConfiguration,
                            'addresses': AddressesDatabaseViewSorConfiguration,
                            'leaves': LeavesDatabaseViewSorConfiguration,
                            'phones': PhonesDatabaseViewSorConfiguration
                    ]
            )

            NamesDatabaseViewSorConfiguration.metaClass.methodMissing = notSoSimpleMethodMissing(
                    [
                            'name': NameDatabaseViewSorConfiguration
                    ]
            )
            EmailAddressesDatabaseViewSorConfiguration.metaClass.methodMissing = notSoSimpleMethodMissing(null)
            DisclosureSettingsConfiguration.metaClass.methodMissing = notSoSimpleMethodMissing(null)
            LocalAttributeDatabaseViewSorConfiguration.metaClass.methodMissing = notSoSimpleMethodMissing(null)
            UrlsDatabaseViewSorConfiguration.metaClass.methodMissing = notSoSimpleMethodMissing(null)
            AddressesDatabaseViewSorConfiguration.metaClass.methodMissing = notSoSimpleMethodMissing(null)
            LeavesDatabaseViewSorConfiguration.metaClass.methodMissing = notSoSimpleMethodMissing(null)
            PhonesDatabaseViewSorConfiguration.metaClass.methodMissing = notSoSimpleMethodMissing(null)
            NameDatabaseViewSorConfiguration.metaClass.methodMissing = notSoSimpleMethodMissing(null)

            FieldConfiguration.metaClass.methodMissing = { name, args ->
                if (name in ['value', 'staticValue', 'normalizer']) {
                    delegate."${name}" = args[0]
                }
            }

            def cleanMetaClasses = {
                [
                        DatabaseViewSorConfiguration,
                        PersonDatabaseViewSorConfiguration,
                        RolesDatabaseViewSorConfiguration,
                        NamesDatabaseViewSorConfiguration,
                        EmailAddressesDatabaseViewSorConfiguration,
                        DisclosureSettingsConfiguration,
                        LocalAttributeDatabaseViewSorConfiguration,
                        UrlsDatabaseViewSorConfiguration,
                        AddressesDatabaseViewSorConfiguration,
                        LeavesDatabaseViewSorConfiguration,
                        PhonesDatabaseViewSorConfiguration,
                        FieldConfiguration
                ].each {
                    it.metaClass.methodMissing = {}
                }
            }

            def config = new CompilerConfiguration()
            config.scriptBaseClass = DatabaseViewSorConfigurationHelper.name
            databaseViewSorConfigurations = new GroovyShell(new Binding(), config).evaluate(file.inputStream.newReader())
            cleanMetaClasses()
        }
        return databaseViewSorConfigurations
    }

    @Override
    Class<?> getObjectType() {
        return Map
    }

    @Override
    boolean isSingleton() {
        return true
    }
}

class DatabaseViewSorConfigurationHelper extends Script {
    def configurations = [:]

    def configuration(Closure x) {
        def config = new DatabaseViewSorConfiguration()
        x.delegate = config
        x.resolveStrategy = Closure.DELEGATE_ONLY
        x()
        configurations[config.id] = config
        return configurations
    }

    @Override
    Object run() {
        return null
    }
}
