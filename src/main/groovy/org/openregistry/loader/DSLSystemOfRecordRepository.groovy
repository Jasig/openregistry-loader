package org.openregistry.loader

import org.apache.commons.lang.NotImplementedException
import org.openregistry.core.domain.sor.SoRSpecification
import org.openregistry.core.repository.SystemOfRecordRepository

class DSLSystemOfRecordRepository implements SystemOfRecordRepository {
    Map<String,DatabaseViewSorConfiguration> databaseViewSorConfigurations

    @Override
    SoRSpecification findSoRSpecificationById(String sorSourceId) {
        if (!databaseViewSorConfigurations.containsKey(sorSourceId)) {
            throw new IllegalStateException("Requested SoR could not be found!")
        }
        def config = databaseViewSorConfigurations[sorSourceId]
        return new DSLSystemOfRecordSpecification(soR: config.id, name: config.name, description: config.description)
    }
}

class DSLSystemOfRecordSpecification implements SoRSpecification {
    String soR
    String name
    String description

    @Override
    boolean isInboundInterfaceAllowed(SoRSpecification.Interfaces interfaces) {
        return new NotImplementedException()
    }

    @Override
    Map<SoRSpecification.Interfaces, String> getNotificationSchemesByInterface() {
        return new NotImplementedException()
    }

    @Override
    boolean isAllowedValueForProperty(String property, String value) {
        // return new NotImplementedException()
        return true
    }

    @Override
    boolean isRequiredProperty(String property) {
        // return new NotImplementedException()
        return false
    }

    @Override
    boolean isDisallowedProperty(String property) {
        return new NotImplementedException()
    }

    @Override
    boolean isWithinRequiredSize(String property, Collection collection) {
        return new NotImplementedException()
    }

    @Override
    boolean isWithinRequiredSize(String property, Map map) {
        return new NotImplementedException()
    }
}

