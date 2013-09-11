create table cadsexch_v_ldap_person (
CADS_ID varchar(10),
FIRST_NAME varchar(75),
MIDDLE_NAME varchar(75),
LAST_NAME varchar(75),
STUDENT_ID numeric(10),
BIRTH_DATE timestamp,
SSN_LAST5 varchar(5),
EMPLOYEE_ID varchar(15),
DECEASED_FLAG_YN varchar(1),
DECEASED_FLAG_DATE timestamp,
DELETED_FLAG_YN varchar(1),
DELETED_FLAG_DATE timestamp,
NO_CONTACT_FLAG varchar(2),
NO_CONTACT_FLAG_DATE timestamp,
REMOVE_ACCESS_FLAG varchar(1),
REMOVE_ACCESS_FLAG_DATE timestamp,
REINSTATE_ACCESS_DATE timestamp,
BATCH_LOAD_numeric numeric(10),
ORA_UPD_DATE timestamp );

create table cadsexch_v_ldap_person (
LDAP_SOURCE_AFFIL_ID numeric(20),
CADS_ID varchar(10),
SOURCE_AFFIL_CODE varchar(25),
ORA_UPD_DATE timestamp);
