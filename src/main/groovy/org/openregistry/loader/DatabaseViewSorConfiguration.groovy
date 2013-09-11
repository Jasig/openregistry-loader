package org.openregistry.loader

class DatabaseViewSorConfiguration extends SorConfiguration {
    def getRawTable() {
        return "prr_src_${id.toLowerCase()}".toString()
    }

    def getAuxTable() {
        return "slx_src_${id.toLowerCase()}".toString()
    }
}

class PersonDatabaseViewSorConfiguration extends SorPersonConfiguration {
    def keyField
}

class NamesDatabaseViewSorConfiguration extends SorNamesConfiguration {
    def keyField

    def getType() {
        super.@type ?: this.keyField
    }
}

class RolesDatabaseViewSorConfiguration extends SorRolesConfiguration {
    def keyField

    def getAffiliation() {
        super.@affiliation ?: this.keyField
    }
}

class LocalAttributeDatabaseViewSorConfiguration extends SorLocalAttributeConfiguration {
    def keyField

    def getType() {
        super.@type ?: this.keyField
    }
}

class EmailAddressesDatabaseViewSorConfiguration extends EmailAddressesConfiguration {
    def keyField

    def getType() {
        super.@type ?: this.keyField
    }
}

class UrlsDatabaseViewSorConfiguration extends UrlsConfiguration {
    def keyField

    def getType() {
        super.@type ?: this.keyField
    }
}

class AddressesDatabaseViewSorConfiguration extends AddressesConfiguration {
    def keyField

    def getType() {
        super.@type ?: this.keyField
    }
}

class LeavesDatabaseViewSorConfiguration extends LeavesConfiguration {
    def keyField

    def getType() {
        super.@type ?: this.keyField
    }
}

class PhonesDatabaseViewSorConfiguration extends PhonesConfiguration {
    def keyField

    def getType() {
        super.@type ?: this.keyField
    }
}