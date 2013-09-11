package org.openregistry.loader.util

import groovy.sql.Sql
import org.springframework.context.support.ClassPathXmlApplicationContext
import org.springframework.core.io.ClassPathResource
import org.springframework.jdbc.datasource.init.DataSourceInitializer
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator

if (args.length != 1 || (!(args[0] in ['load', 'reload', 'ddl']))) {
    println "usage: loadschema.groovy <load|reload|ddl>"
    println "convenience for pulling the ddl out for Spring Batch. These files are stored in the org.springframework.batch.core package in the spring-batch-core-<VERSION>.jar"
    println "\tload: loads the batch schema"
    println "\treload: drops batch tables and loads the batch schema"
    println "\tddl: print the ddl for loading the batch schema"
    System.exit(1)
}

def cmd = args[0]

def applicationContext = new ClassPathXmlApplicationContext(["classpath:jobs/launcher/jobs-launcher-context.xml"] as String[])

def ds = applicationContext.getBean("dataSource")
def sql = new Sql(ds)
def type = (sql.connection ?: sql.dataSource.connection).metaData.databaseProductName.toLowerCase()

if (cmd in ['load', 'reload']) {
    new DataSourceInitializer().with {
        dataSource = ds
        def resources = [new ClassPathResource("/org/springframework/batch/core/schema-${type}.sql")]
        if (cmd == 'reload') {
            resources.add(0, new ClassPathResource("/org/springframework/batch/core/schema-drop-${type}.sql"))
        }
        databasePopulator = new ResourceDatabasePopulator(scripts: resources)
        afterPropertiesSet()
    }
} else if (cmd == "ddl") {
    def resource = new ClassPathResource("/org/springframework/batch/core/schema-${type}.sql")
    resource.inputStream.eachLine { println it }

}