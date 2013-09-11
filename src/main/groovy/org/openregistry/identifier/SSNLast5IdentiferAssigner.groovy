package org.openregistry.identifier

import org.openregistry.core.domain.Person
import org.openregistry.core.domain.sor.SorPerson
import org.openregistry.core.repository.ReferenceRepository
import org.openregistry.core.service.identifier.AbstractIdentifierAssigner
import org.slf4j.Logger
import org.slf4j.LoggerFactory

class SSNLast5IdentiferAssigner extends AbstractIdentifierAssigner {
    private static final Logger logger = LoggerFactory.getLogger(SSNLast5IdentiferAssigner)

    private final String identifierType = "SSNLAST5"

    ReferenceRepository referenceRepository

    @Override
    void addIdentifierTo(SorPerson sorPerson, Person person) {
        if (sorPerson.sorLocalAttributes.containsKey(identifierType)) {
            def ssn = findPrimaryIdentifier(person, identifierType)
            if (!ssn) {
                def identifier = person.addIdentifier(referenceRepository.findIdentifierType(identifierType), sorPerson.sorLocalAttributes[identifierType]).with {
                    deleted = false
                    primary = true
                    return it
                }
            } else {
                if (!ssn.value.equals(sorPerson.sorLocalAttributes[identifierType])) {
                    logger.debug("updating ${identifierType} for personId ${sorPerson.personId}")
                    ssn.value = sorPerson.sorLocalAttributes[identifierType]
                }
            }
        }
    }

    @Override
    String getIdentifierType() {
        return identifierType;
    }
}
