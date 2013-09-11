create table raw (
       id varchar(10) primary key,
       empl_id varchar(10),
       birthdate_mmdd char(4),
       last_name varchar(255),
       first_name varchar(255),
       middle_name varchar(255),
       home_dept_cd char(5),
       appt_begin_dt date,
       termination_dt date,
       supervisor_id varchar(10),
       ssn_last5_no char(5)
);
