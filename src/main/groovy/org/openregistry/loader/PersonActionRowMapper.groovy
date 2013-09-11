package org.openregistry.loader

import org.springframework.jdbc.core.RowMapper

import java.sql.ResultSet
import java.sql.SQLException

class PersonActionRowMapper implements RowMapper<PersonAction> {
    DatabaseViewSorConfiguration sorConfiguration

    @Override
    PersonAction mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new PersonAction(personId: rs.getString(sorConfiguration.personConfiguration.keyField), action: Action."${rs.getString('action')}")
    }
}
