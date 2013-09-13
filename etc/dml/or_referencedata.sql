-- Campuses
INSERT INTO prd_campuses (id, code, name)
  VALUES (NEXTVAL('prd_campuses_seq'), '01', 'BERKELEY');


-- Identifiers
INSERT INTO prd_identifier_types (identifier_t, deleted, modifiable, notifiable, private, name, format, description)
  VALUES (NEXTVAL('prd_identifier_types_seq'), false, true, true, true, 'SSNLAST5', 'n/a', 'US Social Security Number: last 5 digits');

INSERT INTO prd_identifier_types (identifier_t, deleted, modifiable, notifiable, private, name, format, description)
  VALUES (NEXTVAL('prd_identifier_types_seq'), false, true, true, true, 'CALNETID', 'n/a', 'CAL NetId');

INSERT INTO prd_identifier_types (identifier_t, deleted, modifiable, notifiable, private, name, format, description)
  VALUES (NEXTVAL('prd_identifier_types_seq'), false, true, true, true, 'IDMATCH', 'n/a', 'ID Match Reference');

-- SORs
INSERT INTO prd_system_of_record (id, sor_id)
  VALUES (NEXTVAL('prd_system_of_record_seq'), 'HR');
INSERT INTO prd_system_of_record (id, sor_id)
  VALUES (NEXTVAL('prd_system_of_record_seq'), 'SIS');


-- Data Types
INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (NEXTVAL('ctx_data_types_seq'), 'AFFILIATION', 'Staff');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (NEXTVAL('ctx_data_types_seq'), 'AFFILIATION', 'Student');  

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (NEXTVAL('ctx_data_types_seq'), 'ORGANIZATIONAL_UNIT', 'Department 1');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (NEXTVAL('ctx_data_types_seq'), 'STATUS', 'Active');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (NEXTVAL('ctx_data_types_seq'), 'STATUS', 'Inactive');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (NEXTVAL('ctx_data_types_seq'), 'PHONE', 'Cell');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (NEXTVAL('ctx_data_types_seq'), 'PHONE', 'Land');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (NEXTVAL('ctx_data_types_seq'), 'ADDRESS', 'Home');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (NEXTVAL('ctx_data_types_seq'), 'ADDRESS', 'Campus');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (NEXTVAL('ctx_data_types_seq'), 'EMAIL', 'Personal');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (NEXTVAL('ctx_data_types_seq'), 'EMAIL', 'Campus');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (NEXTVAL('ctx_data_types_seq'), 'URL', 'Personal');
  
INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (NEXTVAL('ctx_data_types_seq'), 'URL', 'Campus');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (NEXTVAL('ctx_data_types_seq'), 'NAME', 'Formal');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (NEXTVAL('ctx_data_types_seq'), 'NAME', 'Nickname');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (NEXTVAL('ctx_data_types_seq'), 'SPONSOR', 'Person');
  
INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (NEXTVAL('ctx_data_types_seq'), 'TERMINATION', 'UNSPECIFIED');


-- Organizational Units
INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT NEXTVAL('drd_organizational_units_seq'), 'DEPT1', 'Department 1',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');
    
INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT NEXTVAL('drd_organizational_units_seq'), 'LMOIH', 'Department 2',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT NEXTVAL('drd_organizational_units_seq'), 'KPADM', 'Department 3',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT NEXTVAL('drd_organizational_units_seq'), 'CEEEG', 'Department 4',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT NEXTVAL('drd_organizational_units_seq'), 'HENGL', 'Department 5',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT NEXTVAL('drd_organizational_units_seq'), 'ABCFI', 'Department 6',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT NEXTVAL('drd_organizational_units_seq'), 'UYOLI', 'Department 7',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT NEXTVAL('drd_organizational_units_seq'), 'DCCRP', 'Department 8',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT NEXTVAL('drd_organizational_units_seq'), 'CQADM', 'Department 9',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT NEXTVAL('drd_organizational_units_seq'), 'EAEDU', 'Department 10',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT NEXTVAL('drd_organizational_units_seq'), 'FJPPS', 'Department 11',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

