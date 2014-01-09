# Configuration File Syntax
The overall syntax consists of key-value pairs:

    key "value"
    key2 "value2"

When a key needs a group of values, `{...}` is used:

    key {
        key2 "value2"
        key3 "value3"
    }
    key4 "value4"

The grouping notation (`{...}`) can also denote a function (written in [groovy](http://groovy.codehaus.org/)) where
appropriate:

    key {
        normalizer { value -> value.toUpperCase() }
    }

# Database View System of Record Configuration
Configuration of the loader is made from the perspective of Open Registry (OR) and the Loader rather than the source
system, roughly following the object model in OR for `org.openregistry.core.domain.sor.SorPerson`. The configuration is
structurally hierarchical. Each System of Record will have a `configuration` section. Each configuration section will
have either an `id` field (in the instance of `configuration`) or a `keyField` that denotes each distinct property.
Because of the hierarchy, the keys are cumulative (e.g. for a name, the `keyField`s for both the `names` element and
`person` element identify a name.

## field
Fields (leaves in configuration) can either be configured with a string denoting the column or a `fieldConfiguration`
group. A `fieldConfiguration` can have two fields (from three possible):

* value: String: name of the column from which to get the value
* staticValue: String: a static value
* normalizer: function: if not using a staticValue, the final value is the value returned from the function. The value
from the table cell is passed as an argument to the function. ex: `{ value -> value.toUpperCase() }`

Only one of `value` and `staticValue` can be used. `normalizer` is only used if `value` is used.

## Database View System of Record Configuration Items
* configuration: group:
    * id (required): String: id for the SOR
    * person (required): group: person configuration
        * keyField (required): field: key field distinguishing each distinct person.
        * dateOfBirth: field: Date: date of birth
        * gender: field: String: gender. Valid values are M, F and `null`
        * ssn: field: String: social security number
        * names (required): group: names configuration
            * name: group: A horizontal/pivotted name configuration. If any of these exist, then the row based
              configuration will not be used.
                * type (required): field: name type
                * given (required): field: given name
                * middle: field: middle name or initial
                * family: field: family name
                * prefix: field: name prefix
                * suffix: field: name suffix
            * keyField: field: key field distinguishing each distinct name. Should be the type of the name.
            * given (required): field: given name
            * middle: field: middle name or initial
            * family: field: family name
            * prefix: field: name prefix
            * suffix: field: name suffix
        * roles: group: roles configuration
            * keyField (required): field: key field to distinguish each distinct role
            * affiliation (required): field: String: affiliation type
            * sorId (required): field: String: ID of the role in the SOR
            * start (required): field: Date: start date of the role
            * end: field: Date: end date of the role
            * title (required): field: String: role title
            * organizationalUnit (required): field: String: organizational unit for the role
            * sponsorId (required): field: Long: the id of the person responsible for this users role (supervisor)
            * sponsorType (required): field: String: type of sponsor
            * personStatus (required): field: String: status of the role (eg 'Active', 'Inactive')
            * percentage: field: Long:
            * terminationReson: field: String:
            * addresses: group:
                * keyField: field:
                * type: field: String:
                * bldgNo: field: String:
                * city: field: String:
                * country: field: String:
                * line1: field: String:
                * line2: field: String:
                * line3: field: String:
                * postalCode: field: String:
                * region: field: String:
                * roomNo: field: String:
                * updateDate: field: Date:
            * emailAddresses: group:
                * keyField: field:
                * type: field: String:
                * url: field: String:
            * leaves: group:
                * keyField: field:
                * end: field: Date:
                * reason: field: String:
                * start: field: Date:
            * phones: group:
                * keyField: field:
                * addressType: field: String:
                * areaCode: field: String:
                * countryCode: field: String:
                * extension: field: String:
                * number: field: String:
                * phoneLineOrder: field: Integer:
                * phoneType: field: String:
                * updateDate: field: Date:
            * urls: group:
                * keyField: field:
                * type: field: String:
                * url: field: String:
        * localAttribute: group: configuration for a localAttribute. There may be multiple of these in a person
            * keyField (required): field: key field distinguishing the attribute. Should be the key of the `localAttribute` set on
            the person.
            * value (required): field: value for the local attribute
        * disclosureSettings: group: disclosure settings configuration
            * disclosureCode: field: String:
            * withinGracePeriod: field: boolean:
            * lastUpdateDate: field: Date:

# Sample
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
                    normalizer { value -> value ? 'Inactive' : 'Active' }
                }
                sorId {
                    value "home_dept_cd"
                    normalizer { value -> UUID.randomUUID().toString() }
                }
            }
        }
    }