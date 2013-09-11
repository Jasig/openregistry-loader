package org.openregistry.loader

import groovy.json.JsonBuilder
import org.openregistry.core.domain.sor.SorPerson

class PersonAction {
    Action action
    String personId

    SorPerson sorPerson
    def rows = []

    @Override
    String toString() {
        new JsonBuilder(["action": this.action, "personId": this.personId, "rows": this.rows]).toString()
    }
}