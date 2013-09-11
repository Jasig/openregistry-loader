-- Campuses
INSERT INTO prd_campuses (id, code, name)
  VALUES (prd_campuses_seq.nextval, '01', 'BERKELEY');


-- Identifiers
INSERT INTO prd_identifier_types (identifier_t, deleted, modifiable, notifiable, private, name, format, description)
  VALUES (prd_identifier_types_seq.nextval, 0, 1, 1, 1, 'SSNLAST5', 'n/a', 'US Social Security Number: last 5 digits');

INSERT INTO prd_identifier_types (identifier_t, deleted, modifiable, notifiable, private, name, format, description)
  VALUES (prd_identifier_types_seq.nextval, 0, 1, 1, 1, 'CALNETID', 'n/a', 'CAL NetId');


-- SORs
INSERT INTO prd_system_of_record (id, sor_id)
  VALUES (prd_system_of_record_seq.nextval, 'HR');
INSERT INTO prd_system_of_record (id, sor_id)
  VALUES (prd_system_of_record_seq.nextval, 'SIS');


-- Data Types
INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (ctx_data_types_seq.nextval, 'AFFILIATION', 'Staff');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (ctx_data_types_seq.nextval, 'AFFILIATION', 'Student');  

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (ctx_data_types_seq.nextval, 'ORGANIZATIONAL_UNIT', 'Department 1');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (ctx_data_types_seq.nextval, 'STATUS', 'Active');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (ctx_data_types_seq.nextval, 'STATUS', 'Inactive');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (ctx_data_types_seq.nextval, 'PHONE', 'Cell');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (ctx_data_types_seq.nextval, 'PHONE', 'Land');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (ctx_data_types_seq.nextval, 'ADDRESS', 'Home');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (ctx_data_types_seq.nextval, 'ADDRESS', 'Campus');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (ctx_data_types_seq.nextval, 'EMAIL', 'Personal');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (ctx_data_types_seq.nextval, 'EMAIL', 'Campus');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (ctx_data_types_seq.nextval, 'URL', 'Personal');
  
INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (ctx_data_types_seq.nextval, 'URL', 'Campus');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (ctx_data_types_seq.nextval, 'NAME', 'Formal');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (ctx_data_types_seq.nextval, 'NAME', 'Nickname');

INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (ctx_data_types_seq.nextval, 'SPONSOR', 'Person');
  
INSERT INTO CTX_DATA_TYPES (id, data_type, description)
  VALUES (ctx_data_types_seq.nextval, 'TERMINATION', 'UNSPECIFIED');


-- Organizational Units
INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT drd_organizational_units_seq.nextval, 'DEPT1', 'Department 1',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');
    
INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT drd_organizational_units_seq.nextval, 'LMOIH', 'Department 2',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT drd_organizational_units_seq.nextval, 'KPADM', 'Department 3',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT drd_organizational_units_seq.nextval, 'CEEEG', 'Department 4',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT drd_organizational_units_seq.nextval, 'HENGL', 'Department 5',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT drd_organizational_units_seq.nextval, 'ABCFI', 'Department 6',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT drd_organizational_units_seq.nextval, 'UYOLI', 'Department 7',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT drd_organizational_units_seq.nextval, 'DCCRP', 'Department 8',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT drd_organizational_units_seq.nextval, 'CQADM', 'Department 9',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT drd_organizational_units_seq.nextval, 'EAEDU', 'Department 10',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

INSERT INTO drd_organizational_units
 (id, code, name, campus_id, organizational_unit_t)
(SELECT drd_organizational_units_seq.nextval, 'FJPPS', 'Department 11',
  c.id, dt.id
  FROM prd_campuses c, ctx_data_types dt
   WHERE c.code = '01'
    AND dt.data_type = 'ORGANIZATIONAL_UNIT' AND dt.description = 'Department 1');

