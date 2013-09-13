package org.openregistry

import org.openregistry.core.domain.sor.ReconciliationCriteria
import org.openregistry.core.domain.sor.SorPerson
import org.openregistry.core.service.reconciliation.Reconciler
import org.openregistry.core.service.reconciliation.ReconciliationResult

class IdMatchReconciler implements Reconciler {
    @Override
    ReconciliationResult reconcile(ReconciliationCriteria reconciliationCriteria) {
        throw new UnsupportedOperationException("this hasn't been implemented yet")
    }

    @Override
    boolean reconcilesToSamePerson(SorPerson sorPerson) {
        throw new UnsupportedOperationException("this hasn't been implemented yet")
    }
}
