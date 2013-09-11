package org.openregistry.loader

import groovy.sql.Sql
import org.springframework.beans.factory.FactoryBean
import DBConfig

import javax.sql.DataSource

class DatabaseConfigObjectFactoryBean implements FactoryBean<ConfigObject> {
    ConfigObject configObject
    DataSource dataSource
    String auxTable
    String rawTable
    String idField

    @Override
    ConfigObject getObject() throws Exception {
        assert dataSource != null
        if (!configObject) {
            def sql = new Sql(dataSource)
            def type = (sql.connection ?: sql.dataSource.connection).metaData.databaseProductName.toLowerCase()
            def slurper = new ConfigSlurper(type)
            slurper.binding = ["idField": idField, "rawTable": rawTable, "auxTable": auxTable, "type": type]
            configObject = slurper.parse(DBConfig)
        }
        return configObject
    }

    @Override
    Class<?> getObjectType() {
        return ConfigObject
    }

    @Override
    boolean isSingleton() {
        return true
    }
}
