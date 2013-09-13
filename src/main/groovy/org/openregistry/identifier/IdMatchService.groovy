package org.openregistry.identifier

import org.openregistry.core.domain.sor.SorPerson

class IdMatchService {
    IdMatchServiceResponse getIdMatchServiceResponse(SorPerson sorPerson) {
        //TODO: really implement this
        return new IdMatchServiceResponse(status: IdMatchServiceResponse.Status.OK, referenceId: sorPerson.sorId, fullResponse: [:])
    }

    IdMatchServiceResponse putIdMatchServiceResponse(SorPerson sorPerson) {
        // TODO: really implement this
        return new IdMatchServiceResponse(status: IdMatchServiceResponse.Status.OK, referenceId: sorPerson.sorId, fullResponse: [:])
    }
}

class IdMatchServiceResponse {
    Status status
    String referenceId
    def fullResponse

    enum Status {OK, NOT_FOUND, CREATED, MULTIPLE_CHOICES, ACCEPTED}
}