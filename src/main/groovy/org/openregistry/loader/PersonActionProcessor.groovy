package org.openregistry.loader

import groovy.sql.Sql
import org.openregistry.core.domain.jpa.sor.JpaSorPersonImpl
import org.openregistry.core.domain.sor.SorPerson
import org.openregistry.core.repository.ReferenceRepository
import org.openregistry.core.service.PersonService
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.batch.item.ItemProcessor
import org.springframework.beans.factory.InitializingBean

import javax.annotation.Resource
import javax.persistence.EntityManager
import javax.persistence.PersistenceContext
import javax.sql.DataSource

/**
 * Spring Batch Processor component that is responsible for creating an object graph for SorPerson based on the passed it HR empl_id
 */
abstract class PersonActionProcessor implements ItemProcessor<PersonAction, PersonAction>, InitializingBean {

    static final Logger logger = LoggerFactory.getLogger(PersonActionProcessor)

    @Resource(name = "referenceRepository")
    ReferenceRepository referenceRepository

    @Resource(name = "dataSource")
    DataSource dataSource

    @Resource(name = "personService")
    PersonService personService

    @Resource(name = "databaseConfig")
    ConfigObject databaseConfig

    DatabaseViewSorConfiguration sorConfiguration

    @PersistenceContext(unitName = "OpenRegistryPersistence")
    private EntityManager entityManager;

    Sql sql

    @Override
    void afterPropertiesSet() throws Exception {
        this.sql = new Sql(dataSource)
    }

    SorPerson getSorPerson(PersonAction personAction) {
        def person
        if (personAction.action == Action.UPDATE) {
            person = entityManager.merge(personService.findBySorIdentifierAndSource(sorConfiguration.id, personAction.personId))
        } else {
            person = new JpaSorPersonImpl(
                    sorId: personAction.personId,
                    sourceSor: sorConfiguration.id
            )
        }
        return person
    }

    @Override
    abstract PersonAction process(PersonAction item) throws Exception
}
