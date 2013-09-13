package org.openregistry.identifier

import org.openregistry.core.domain.sor.SorPerson

class IdMatchService {
    IdMatchServiceResponse getIdMatchServiceResponse(SorPerson sorPerson) {
        throw new UnsupportedOperationException("this hasn't been implemented yet")
    }
}

class IdMatchServiceResponse {
    int status
    String referenceId
    Map fullResponse
}