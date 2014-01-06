package org.openregistry.core.service.elector

import org.openregistry.core.domain.sor.SorPerson

/**
 * {@link AbstractConfigurableFieldElector} that returns based on a SOR list priority.
 */
class SorPriorityConfigurableFieldElector extends AbstractConfigurableFieldElector {
    List<String> sorList
    boolean allowNull

    @Override
    def <returnType> returnType elect(SorPerson newestPerson, List<SorPerson> list, boolean deletion) {
        def effectiveList = list.findAll { sorList.contains(it.sourceSor) }.sort { sorList.indexOf(it.sorId) }
        return this.electFromList(effectiveList, returnType, allowNull)
    }
}
