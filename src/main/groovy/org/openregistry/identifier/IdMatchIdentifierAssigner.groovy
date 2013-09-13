package org.openregistry.identifier

import org.openregistry.core.domain.Person
import org.openregistry.core.domain.sor.SorPerson
import org.openregistry.core.service.identifier.AbstractIdentifierAssigner

class IdMatchIdentifierAssigner extends AbstractIdentifierAssigner {
    final String identifierType = "IDMATCH"

    @Override
    void addIdentifierTo(SorPerson sorPerson, Person person) {
        throw new UnsupportedOperationException("this hasn't been implemented yet")
    }
}
