package org.openregistry.core.service.elector

import org.openregistry.core.domain.sor.SorPerson
import org.openregistry.core.service.FieldElector

class NullFieldElector implements FieldElector {
    @Override
    Object elect(SorPerson newestPerson, List list, boolean deletion) {
        return null
    }
}
