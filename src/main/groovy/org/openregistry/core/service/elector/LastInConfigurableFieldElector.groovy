package org.openregistry.core.service.elector

import org.openregistry.core.domain.sor.SorPerson

/**
 * {@link org.openregistry.core.service.FieldElector} that returns the field from the latest {@link SorPerson}.
 * Configurable to find the first non-null value. See also {@link AbstractConfigurableFieldElector}
 */
class LastInConfigurableFieldElector extends AbstractConfigurableFieldElector {
    /**
     * Wheter to allow the return a null value. Effective this means it will search for the first non-null value, only
     * returning null if it exhausts the list.
     */
    boolean allowNull = true

    @Override
    def <returnType> returnType elect(SorPerson newestPerson, List<SorPerson> list, boolean deletion) {
        def effectiveList = deletion ? list : [newestPerson] + list
        for (SorPerson sorPerson: effectiveList) {
            def val = this.expression.getValue(sorPerson, this.returnType)
            if (val || allowNull) {
                return val
            }
        }
        return null
    }
}
