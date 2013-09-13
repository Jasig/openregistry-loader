package org.openregistry.identifier

import org.openregistry.core.domain.Person
import org.openregistry.core.domain.sor.SorPerson
import org.openregistry.core.repository.ReferenceRepository
import org.openregistry.core.service.identifier.AbstractIdentifierAssigner
import org.slf4j.Logger
import org.slf4j.LoggerFactory

class IdMatchIdentifierAssigner extends AbstractIdentifierAssigner {
    private static final Logger logger = LoggerFactory.getLogger(IdMatchIdentifierAssigner)

    final String identifierType = "IDMATCH"

    IdMatchService idMatchService
    ReferenceRepository referenceRepository

    @Override
    void addIdentifierTo(SorPerson sorPerson, Person person) {
        def idMatchId = findPrimaryIdentifier(person, identifierType)
        if (idMatchId) {
            logger.debug("found idMatchId for personId ${sorPerson.personId}")
        } else {
            def idMatchIdResponse = idMatchService.getIdMatchServiceResponse(sorPerson)
            person.addIdentifier(referenceRepository.findIdentifierType(identifierType), idMatchIdResponse.referenceId).with {
                deleted = false
                primary = true
            }
        }
    }
}
