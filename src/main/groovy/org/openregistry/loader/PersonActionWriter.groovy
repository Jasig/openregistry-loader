package org.openregistry.loader

import groovy.sql.Sql
import org.openregistry.core.domain.jpa.sor.JpaReconciliationCriteriaImpl
import org.openregistry.core.service.PersonService
import org.openregistry.core.service.reconciliation.ReconciliationException
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.batch.item.ItemWriter

import javax.annotation.Resource
import javax.sql.DataSource

class PersonActionWriter implements ItemWriter<PersonAction> {
    static final Logger logger = LoggerFactory.getLogger(PersonActionWriter)

    @Resource(name = "personService")
    PersonService personService

    @Resource(name = "dataSource")
    DataSource openRegistryDataSource

    @Resource(name = "databaseConfig")
    ConfigObject databaseConfig

    @Override
    void write(List<? extends PersonAction> items) throws Exception {
        def sql = new Sql(openRegistryDataSource)
        def synchronizeRaw = { PersonAction personAction ->
            sql.execute(databaseConfig.queries.deleteFromAux.toString(), personAction.personId)

            personAction.rows.each { Map<String, Object> rowMap ->
                // this is generated sql that can't be (easily) externalized
                def query = "insert into ${databaseConfig.auxTable} (${rowMap.keySet().sort().join(', ')}) values (${rowMap.keySet().sort().collect { ":${it}" }.join(", ")})"
                sql.execute(rowMap, query)
            }
        }

        items.each { personAction ->
            try {
                switch (personAction.action) {
                    case Action.ADD:
                        logger.debug("adding ${personAction}")
                        personService.addPerson(new JpaReconciliationCriteriaImpl().with {
                            sorPerson = personAction.sorPerson
                            return it
                        })
                        synchronizeRaw personAction
                        break
                    case Action.UPDATE:
                        try {
                            logger.debug("updating ${personAction}")
                            personService.updateSorPerson(personAction.sorPerson)
                            synchronizeRaw personAction
                        } catch (IllegalStateException e) {
                            logger.warn("could not reconcile user ${personAction.personId}", e)
                        }
                        break
                    case Action.DELETE:
                        logger.debug("deleting ${personAction}")
                        personService.deleteSystemOfRecordPerson('HR', personAction.personId, false, null)
                        sql.execute(databaseConfig.queries.deleteFromAux.toString(), personAction.personId)
                        break
                }
            } catch (ReconciliationException e) {
                logger.warn("error processing ${personAction.personId}", e)
            }
        }
        sql.close()
    }
}
