package org.openregistry

import org.openregistry.core.domain.sor.ReconciliationCriteria
import org.openregistry.core.domain.sor.SorPerson
import org.openregistry.core.repository.PersonRepository
import org.openregistry.core.repository.ReferenceRepository
import org.openregistry.core.service.reconciliation.Reconciler
import org.openregistry.core.service.reconciliation.ReconciliationResult
import org.openregistry.core.service.reconciliation.ReconciliationResultImpl
import org.openregistry.identifier.IdMatchService
import org.openregistry.identifier.IdMatchServiceResponse

class IdMatchReconciler implements Reconciler {
    IdMatchService idMatchService
    PersonRepository personRepository
    ReferenceRepository referenceRepository

    @Override
    ReconciliationResult reconcile(ReconciliationCriteria reconciliationCriteria) {
        def idMatchServiceResponse = idMatchService.getIdMatchServiceResponse(reconciliationCriteria.sorPerson)
        switch (idMatchServiceResponse.status) {
            case IdMatchServiceResponse.Status.OK:
                return new ReconciliationResultImpl(ReconciliationResult.ReconciliationType.EXACT, [personRepository.findByIdentifier("IDMATCH", idMatchServiceResponse.referenceId)])
            case IdMatchServiceResponse.Status.MULTIPLE_CHOICES:
                return new ReconciliationResultImpl(
                        ReconciliationResult.ReconciliationType.MAYBE,
                        idMatchServiceResponse.fullResponse.candidates.referenceId.collect {String it -> personRepository.findByIdentifier("IDMATCH", it)}
                )
            default:
                return new ReconciliationResultImpl(ReconciliationResult.ReconciliationType.NONE, [])
        }
    }

    @Override
    boolean reconcilesToSamePerson(SorPerson sorPerson) {
        //TODO: implement this
        return true
    }
}
