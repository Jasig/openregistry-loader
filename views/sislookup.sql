create table dsc_termrec_vw (
TERM_YR CHAR(2),
TERM_CD CHAR(1),
SUB_TERM_CD CHAR(1),
TERM_STATUS CHAR(2),
TERM_STATUS_DESC CHAR(15),
AID_YR CHAR(3),
TERM_ABBR CHAR(3),
TERM_NAME CHAR(6),
TERM_CENTURY CHAR(2));

create table sistmo_tlevel_tb (
EDUC_LEVEL CHAR(1),
LEVEL_DESC_S CHAR(9),
LEVEL_DESC_L CHAR(19),
UG_GRAD_FLAG CHAR(1),
LOAD_DATE timestamp);

create table sistmo_tcollege_tb (
COLL_CD CHAR(2),
COLL_ABBR CHAR(8),
COLL_NAME CHAR(20),
UNGRAD_FLAG CHAR(1),
GRAD_FLAG CHAR(1),
CHNG_DATE timestamp,
STUDY_LIST_MAX_UNIT numeric(3,1),
STUDY_LIST_MIN_UNIT numeric(3,1),
DNLD_DATE timestamp,
LOAD_DATE timestamp);

create table sistmo_tmajor_tb (
MAJ_CD CHAR(3),
UNGRAD_FLAG CHAR(1),
GRAD_FLAG CHAR(1),
MAJ_NAME CHAR(20),
MAJ_TITLE CHAR(62),
MAJ_DESC CHAR(40),
CHNG_DATE timestamp,
DNLD_DATE timestamp,
LOAD_DATE timestamp);

create table sistmo_tregstat_tb (
REG_STATUS_CD CHAR(1),
REG_STATUS_DESC_S CHAR(12),
REG_STATUS_DESC_L CHAR(25),
REG_STATUS_REG CHAR(14),
LOAD_DATE timestamp);

create table sistmo_trole_tb (
ROLE_CD varchar(1),
ROLE_DESC varchar(22),
LOAD_DATE timestamp,
ROLE_DESC_ALT varchar(22));
