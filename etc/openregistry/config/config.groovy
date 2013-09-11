configuration {
    id "HR"
    person {
        keyField "empl_id"
        names {
            keyField {
                staticValue "Formal"
            }
            given "first_name"
            middle "middle_name"
            family "last_name"
        }
        localAttribute {
            keyField {
                staticValue "SSNLAST5"
            }
            value "ssn_last5_no"
        }
        roles {
            keyField "home_dept_cd"
            affiliation {
                staticValue "Staff"
            }
            start "appt_begin_dt"
            end "termination_dt"
            title {
                staticValue "king"
            }
            organizationalUnit "home_dept_cd"
            sponsorId {
                staticValue 1l
            }
            sponsorType {
                staticValue "Person"
            }
            personStatus {
                value "termination_dt"
                converter { value -> value ? 'Inactive' : 'Active' }
            }
            sorId {
                value "home_dept_cd"
                converter { value -> UUID.randomUUID().toString() }
            }
        }
    }
}

configuration {
    id "SIS"
    person {
        keyField "empl_id"
        names {
            keyField {
                staticValue "Formal"
            }
            given "first_name"
            middle "middle_name"
            family "last_name"
        }
        localAttribute {
            keyField {
                staticValue "SSNLAST5"
            }
            value "ssn_last5_no"
        }
        roles {
            keyField "home_dept_cd"
            affiliation {
                staticValue "Student"
            }
            start "appt_begin_dt"
            end "termination_dt"
            title {
                staticValue "subject"
            }
            organizationalUnit "home_dept_cd"
            sponsorId {
                staticValue 1l
            }
            sponsorType {
                staticValue "Person"
            }
            personStatus {
                value "termination_dt"
                converter { value -> value ? 'Inactive' : 'Active' }
            }
            sorId {
                value "home_dept_cd"
                converter { value -> UUID.randomUUID().toString() }
            }
        }
    }
}