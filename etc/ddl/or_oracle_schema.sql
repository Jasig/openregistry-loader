
    create table AUTH_GROUP_AUTHORITY (
        GROUP_ID number(19,0) not null,
        AUTHORITY_ID number(19,0) not null
    );

    create table AUTH_USER_GROUP (
        USER_ID number(19,0) not null,
        GROUP_ID number(19,0) not null
    );

    create table AUX_IDENTIFIERS (
        id number(19,0) not null,
        CREATION_DATE timestamp not null,
        IS_DELETED number(1,0) not null,
        DELETED_DATE timestamp,
        NOTIFICATION_DATE timestamp,
        IS_PRIMARY number(1,0) not null,
        IDENTIFIER varchar2(100 char) not null,
        PROGRAM_ID number(19,0) not null,
        IDENTIFIER_T number(19,0) not null,
        primary key (id),
        unique (IDENTIFIER_T, IDENTIFIER)
    );

    create table AUX_PROGRAMS (
        id number(19,0) not null,
        AFFILIATION_DATE date not null,
        PROGRAM_NAME varchar2(255 char) not null,
        SPONSOR_ID number(19,0) not null,
        TERMINATION_DATE date,
        SPONSOR_T number(19,0) not null,
        primary key (id)
    );

    create table SpringSecurityRevisionEntity (
        id number(10,0) not null,
        timestamp number(19,0) not null,
        username varchar2(255 char),
        primary key (id)
    );

    create table aud_AUTH_GROUP_AUTHORITY (
        REV number(10,0) not null,
        GROUP_ID number(19,0) not null,
        AUTHORITY_ID number(19,0) not null,
        REVTYPE number(3,0),
        primary key (REV, GROUP_ID, AUTHORITY_ID)
    );

    create table aud_AUTH_USER_GROUP (
        REV number(10,0) not null,
        USER_ID number(19,0) not null,
        GROUP_ID number(19,0) not null,
        REVTYPE number(3,0),
        primary key (REV, USER_ID, GROUP_ID)
    );

    create table aud_AUX_IDENTIFIERS (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        CREATION_DATE timestamp,
        IS_DELETED number(1,0),
        DELETED_DATE timestamp,
        NOTIFICATION_DATE timestamp,
        IS_PRIMARY number(1,0),
        IDENTIFIER varchar2(100 char),
        PROGRAM_ID number(19,0),
        IDENTIFIER_T number(19,0),
        primary key (id, REV)
    );

    create table aud_AUX_PROGRAMS (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        AFFILIATION_DATE date,
        PROGRAM_NAME varchar2(255 char),
        SPONSOR_ID number(19,0),
        TERMINATION_DATE date,
        SPONSOR_T number(19,0),
        primary key (id, REV)
    );

    create table aud_auth_authorities (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        AUTHORITY_NAME varchar2(255 char),
        DESCRIPTION varchar2(255 char),
        primary key (id, REV)
    );

    create table aud_auth_groups (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        DESCRIPTION varchar2(255 char),
        IS_ENABLED number(1,0),
        GROUP_NAME varchar2(255 char),
        primary key (id, REV)
    );

    create table aud_auth_users (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        DESCRIPTION varchar2(255 char),
        IS_ENABLED number(1,0),
        PASSWORD varchar2(255 char),
        USER_NAME varchar2(255 char),
        primary key (id, REV)
    );

    create table aud_ctd_countries (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        code varchar2(3 char),
        name varchar2(100 char),
        primary key (id, REV)
    );

    create table aud_ctd_regions (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        code varchar2(3 char),
        name varchar2(100 char),
        country_id number(19,0),
        primary key (id, REV)
    );

    create table aud_ctx_data_types (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        data_type varchar2(100 char),
        description varchar2(100 char),
        primary key (id, REV)
    );

    create table aud_drd_organizational_units (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        code varchar2(100 char),
        name varchar2(100 char),
        campus_id number(19,0),
        parent_organizational_unit_id number(19,0),
        organizational_unit_t number(19,0),
        primary key (id, REV)
    );

    create table aud_prc_addresses (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        bldg_no varchar2(10 char),
        city varchar2(100 char),
        line1 varchar2(100 char),
        line2 varchar2(100 char),
        line3 varchar2(100 char),
        postal_code varchar2(9 char),
        room_no varchar2(11 char),
        update_date timestamp,
        country_id number(19,0),
        region_id number(19,0),
        role_record_id number(19,0),
        address_t number(19,0),
        primary key (id, REV)
    );

    create table aud_prc_contact_emails (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        address varchar2(100 char),
        email_address_t number(19,0),
        primary key (id, REV)
    );

    create table aud_prc_contact_phones (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        area_code varchar2(5 char),
        country_code varchar2(5 char),
        extension varchar2(5 char),
        phone_number varchar2(10 char),
        phone_line_order number(10,0),
        update_date timestamp,
        address_t number(19,0),
        phone_t number(19,0),
        primary key (id, REV)
    );

    create table aud_prc_disclosure (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        disclosure_code varchar2(10 char),
        updated_date timestamp,
        within_grace_period number(1,0),
        person_id number(19,0),
        primary key (id, REV)
    );

    create table aud_prc_disclosure_address (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        bldg_room_date timestamp,
        bldg_room_ind number(1,0),
        address_date timestamp,
        address_ind number(1,0),
        city_region_date timestamp,
        city_region_ind number(1,0),
        address_t number(19,0),
        affiliation_t number(19,0),
        disclosure_record_id number(19,0),
        primary key (id, REV)
    );

    create table aud_prc_disclosure_email (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        public_date timestamp,
        public_ind number(1,0),
        affiliation_t number(19,0),
        disclosure_record_id number(19,0),
        address_t number(19,0),
        primary key (id, REV)
    );

    create table aud_prc_disclosure_phone (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        public_date timestamp,
        public_ind number(1,0),
        address_t number(19,0),
        affiliation_t number(19,0),
        disclosure_record_id number(19,0),
        phone_t number(19,0),
        primary key (id, REV)
    );

    create table aud_prc_disclosure_url (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        public_date timestamp,
        public_ind number(1,0),
        affiliation_t number(19,0),
        disclosure_record_id number(19,0),
        address_t number(19,0),
        primary key (id, REV)
    );

    create table aud_prc_emails (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        address varchar2(100 char),
        role_record_id number(19,0),
        address_t number(19,0),
        primary key (id, REV)
    );

    create table aud_prc_identifiers (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        change_expiration_date timestamp,
        changeable number(1,0),
        creation_date timestamp,
        is_deleted number(1,0),
        deleted_date timestamp,
        notification_date timestamp,
        is_primary number(1,0),
        identifier varchar2(100 char),
        person_id number(19,0),
        identifier_t number(19,0),
        primary key (id, REV)
    );

    create table aud_prc_leaves_of_absence (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        end_date date,
        start_date date,
        leave_t number(19,0),
        role_record_id number(19,0),
        primary key (id, REV)
    );

    create table aud_prc_names (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        family_name varchar2(100 char),
        family_comparison_value varchar2(100 char),
        given_name varchar2(100 char),
        given_comparison_value varchar2(100 char),
        middle_name varchar2(100 char),
        is_official_name number(1,0),
        is_preferred_name number(1,0),
        prefix varchar2(5 char),
        name_source_id number(19,0),
        suffix varchar2(5 char),
        person_id number(19,0),
        name_t number(19,0),
        primary key (id, REV)
    );

    create table aud_prc_persons (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        act_key_end_date timestamp,
        act_key_lock varchar2(255 char),
        act_key_lock_expiration timestamp,
        act_key_start_date timestamp,
        activation_key varchar2(255 char),
        date_of_birth date,
        gender varchar2(1 char),
        contact_email_id number(19,0),
        contact_phone_id number(19,0),
        primary key (id, REV)
    );

    create table aud_prc_phones (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        area_code varchar2(5 char),
        country_code varchar2(5 char),
        extension varchar2(5 char),
        phone_number varchar2(10 char),
        phone_line_order number(10,0),
        update_date timestamp,
        address_t number(19,0),
        phone_t number(19,0),
        role_record_id number(19,0),
        primary key (id, REV)
    );

    create table aud_prc_role_records (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        termination_date date,
        percent_time number(10,0),
        prs_role_id number(19,0),
        sponsor_id number(19,0),
        affiliation_date date,
        title varchar2(100 char),
        affiliation_t number(19,0),
        organizational_unit_id number(19,0),
        person_id number(19,0),
        person_status_t number(19,0),
        sponsor_t number(19,0),
        termination_t number(19,0),
        primary key (id, REV)
    );

    create table aud_prc_urls (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        url varchar2(500 char),
        role_record_id number(19,0),
        address_t number(19,0),
        primary key (id, REV)
    );

    create table aud_prd_campuses (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        code varchar2(2 char),
        name varchar2(100 char),
        primary key (id, REV)
    );

    create table aud_prd_identifier_types (
        identifier_t number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        deleted number(1,0),
        description varchar2(200 char),
        format varchar2(100 char),
        modifiable number(1,0),
        name varchar2(100 char),
        notifiable number(1,0),
        private number(1,0),
        primary key (identifier_t, REV)
    );

    create table aud_prd_system_of_record (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        sor_id varchar2(100 char),
        primary key (id, REV)
    );

    create table aud_prs_addresses (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        bldg_no varchar2(10 char),
        city varchar2(100 char),
        line1 varchar2(100 char),
        line2 varchar2(100 char),
        line3 varchar2(100 char),
        postal_code varchar2(9 char),
        room_no varchar2(11 char),
        update_date timestamp,
        country_id number(19,0),
        region_id number(19,0),
        role_record_id number(19,0),
        address_t number(19,0),
        primary key (id, REV)
    );

    create table aud_prs_disclosure (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        disclosure_code varchar2(10 char),
        updated_date timestamp,
        within_grace_period number(1,0),
        sor_person_id number(19,0),
        primary key (id, REV)
    );

    create table aud_prs_emails (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        address varchar2(100 char),
        address_t number(19,0),
        role_record_id number(19,0),
        primary key (id, REV)
    );

    create table aud_prs_leaves_of_absence (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        end_date date,
        start_date date,
        leave_t number(19,0),
        role_record_id number(19,0),
        primary key (id, REV)
    );

    create table aud_prs_names (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        family_name varchar2(100 char),
        given_name varchar2(100 char),
        middle_name varchar2(100 char),
        prefix varchar2(5 char),
        suffix varchar2(5 char),
        sor_person_id number(19,0),
        name_t number(19,0),
        primary key (id, REV)
    );

    create table aud_prs_phones (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        area_code varchar2(5 char),
        country_code varchar2(5 char),
        extension varchar2(5 char),
        phone_number varchar2(10 char),
        phone_line_order number(10,0),
        update_date timestamp,
        address_t number(19,0),
        phone_t number(19,0),
        role_record_id number(19,0),
        primary key (id, REV)
    );

    create table aud_prs_role_records (
        record_id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        termination_date date,
        percent_time number(10,0),
        id varchar2(255 char),
        sponsor_id number(19,0),
        affiliation_date date,
        title varchar2(100 char),
        affiliation_t number(19,0),
        organizational_unit_id number(19,0),
        sor_person_id number(19,0),
        person_status_t number(19,0),
        sponsor_t number(19,0),
        system_of_record_id number(19,0),
        termination_t number(19,0),
        primary key (record_id, REV)
    );

    create table aud_prs_sor_persons (
        record_id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        date_of_birth date,
        gender varchar2(1 char),
        person_id number(19,0),
        id varchar2(255 char),
        source_sor_id varchar2(255 char),
        ssn varchar2(9 char),
        primary key (record_id, REV)
    );

    create table aud_prs_sor_persons_loc_attr (
        REV number(10,0) not null,
        sor_person_record_id number(19,0) not null,
        attribute_value varchar2(255 char) not null,
        attribute_type varchar2(255 char) not null,
        REVTYPE number(3,0),
        primary key (REV, sor_person_record_id, attribute_value, attribute_type)
    );

    create table aud_prs_urls (
        id number(19,0) not null,
        REV number(10,0) not null,
        REVTYPE number(3,0),
        url varchar2(500 char),
        role_record_id number(19,0),
        address_t number(19,0),
        primary key (id, REV)
    );

    create table auth_authorities (
        id number(19,0) not null,
        AUTHORITY_NAME varchar2(255 char) not null,
        DESCRIPTION varchar2(255 char),
        primary key (id)
    );

    create table auth_groups (
        id number(19,0) not null,
        DESCRIPTION varchar2(255 char),
        IS_ENABLED number(1,0) not null,
        GROUP_NAME varchar2(255 char) not null,
        primary key (id)
    );

    create table auth_users (
        id number(19,0) not null,
        DESCRIPTION varchar2(255 char),
        IS_ENABLED number(1,0) not null,
        PASSWORD varchar2(255 char),
        USER_NAME varchar2(255 char) not null,
        primary key (id)
    );

    create table ctd_countries (
        id number(19,0) not null,
        code varchar2(3 char) not null,
        name varchar2(100 char) not null,
        primary key (id)
    );

    create table ctd_regions (
        id number(19,0) not null,
        code varchar2(3 char) not null,
        name varchar2(100 char) not null,
        country_id number(19,0) not null,
        primary key (id),
        unique (country_id, code)
    );

    create table ctx_data_types (
        id number(19,0) not null,
        data_type varchar2(100 char) not null,
        description varchar2(100 char) not null,
        primary key (id),
        unique (data_type, description)
    );

    create table drd_organizational_units (
        id number(19,0) not null,
        code varchar2(100 char),
        name varchar2(100 char) not null,
        campus_id number(19,0),
        parent_organizational_unit_id number(19,0),
        organizational_unit_t number(19,0) not null,
        primary key (id)
    );

    create table prc_addresses (
        id number(19,0) not null,
        bldg_no varchar2(10 char),
        city varchar2(100 char) not null,
        line1 varchar2(100 char),
        line2 varchar2(100 char),
        line3 varchar2(100 char),
        postal_code varchar2(9 char),
        room_no varchar2(11 char),
        update_date timestamp not null,
        country_id number(19,0),
        region_id number(19,0),
        role_record_id number(19,0) not null,
        address_t number(19,0),
        primary key (id),
        unique (address_t, role_record_id)
    );

    create table prc_contact_emails (
        id number(19,0) not null,
        address varchar2(100 char),
        email_address_t number(19,0),
        primary key (id)
    );

    create table prc_contact_phones (
        id number(19,0) not null,
        area_code varchar2(5 char),
        country_code varchar2(5 char),
        extension varchar2(5 char),
        phone_number varchar2(10 char),
        phone_line_order number(10,0),
        update_date timestamp not null,
        address_t number(19,0),
        phone_t number(19,0),
        primary key (id)
    );

    create table prc_disclosure (
        id number(19,0) not null,
        disclosure_code varchar2(10 char),
        updated_date timestamp not null,
        within_grace_period number(1,0) not null,
        person_id number(19,0) not null,
        primary key (id),
        unique (person_id)
    );

    create table prc_disclosure_address (
        id number(19,0) not null,
        bldg_room_date timestamp not null,
        bldg_room_ind number(1,0) not null,
        address_date timestamp not null,
        address_ind number(1,0) not null,
        city_region_date timestamp not null,
        city_region_ind number(1,0) not null,
        address_t number(19,0) not null,
        affiliation_t number(19,0) not null,
        disclosure_record_id number(19,0) not null,
        primary key (id),
        unique (address_t, affiliation_t, disclosure_record_id)
    );

    create table prc_disclosure_email (
        id number(19,0) not null,
        public_date timestamp not null,
        public_ind number(1,0) not null,
        affiliation_t number(19,0) not null,
        disclosure_record_id number(19,0) not null,
        address_t number(19,0) not null,
        primary key (id),
        unique (address_t, affiliation_t, disclosure_record_id)
    );

    create table prc_disclosure_phone (
        id number(19,0) not null,
        public_date timestamp not null,
        public_ind number(1,0) not null,
        address_t number(19,0) not null,
        affiliation_t number(19,0) not null,
        disclosure_record_id number(19,0) not null,
        phone_t number(19,0) not null,
        primary key (id),
        unique (address_t, phone_t, affiliation_t, disclosure_record_id)
    );

    create table prc_disclosure_url (
        id number(19,0) not null,
        public_date timestamp not null,
        public_ind number(1,0) not null,
        affiliation_t number(19,0) not null,
        disclosure_record_id number(19,0) not null,
        address_t number(19,0) not null,
        primary key (id),
        unique (address_t, affiliation_t, disclosure_record_id)
    );

    create table prc_emails (
        id number(19,0) not null,
        address varchar2(100 char) not null,
        role_record_id number(19,0) not null,
        address_t number(19,0) not null,
        primary key (id),
        unique (address_t, role_record_id)
    );

    create table prc_identifiers (
        id number(19,0) not null,
        change_expiration_date timestamp,
        changeable number(1,0),
        creation_date timestamp not null,
        is_deleted number(1,0) not null,
        deleted_date timestamp,
        notification_date timestamp,
        is_primary number(1,0) not null,
        identifier varchar2(100 char) not null,
        person_id number(19,0) not null,
        identifier_t number(19,0) not null,
        primary key (id),
        unique (identifier_t, identifier)
    );

    create table prc_leaves_of_absence (
        id number(19,0) not null,
        end_date date,
        start_date date,
        leave_t number(19,0) not null,
        role_record_id number(19,0) not null,
        primary key (id)
    );

    create table prc_names (
        id number(19,0) not null,
        family_name varchar2(100 char),
        family_comparison_value varchar2(100 char),
        given_name varchar2(100 char) not null,
        given_comparison_value varchar2(100 char),
        middle_name varchar2(100 char),
        is_official_name number(1,0) not null,
        is_preferred_name number(1,0) not null,
        prefix varchar2(5 char),
        name_source_id number(19,0) not null,
        suffix varchar2(5 char),
        person_id number(19,0) not null,
        name_t number(19,0) not null,
        primary key (id)
    );

    create table prc_persons (
        id number(19,0) not null,
        act_key_end_date timestamp,
        act_key_lock varchar2(255 char),
        act_key_lock_expiration timestamp,
        act_key_start_date timestamp,
        activation_key varchar2(255 char),
        date_of_birth date,
        gender varchar2(1 char),
        contact_email_id number(19,0),
        contact_phone_id number(19,0),
        primary key (id)
    );

    create table prc_phones (
        id number(19,0) not null,
        area_code varchar2(5 char) not null,
        country_code varchar2(5 char) not null,
        extension varchar2(5 char),
        phone_number varchar2(10 char) not null,
        phone_line_order number(10,0) not null,
        update_date timestamp not null,
        address_t number(19,0) not null,
        phone_t number(19,0) not null,
        role_record_id number(19,0) not null,
        primary key (id),
        unique (phone_t, address_t, phone_line_order, role_record_id)
    );

    create table prc_role_records (
        id number(19,0) not null,
        termination_date date,
        percent_time number(10,0) not null,
        prs_role_id number(19,0),
        sponsor_id number(19,0) not null,
        affiliation_date date not null,
        title varchar2(100 char) not null,
        affiliation_t number(19,0) not null,
        organizational_unit_id number(19,0) not null,
        person_id number(19,0) not null,
        person_status_t number(19,0) not null,
        sponsor_t number(19,0) not null,
        termination_t number(19,0),
        primary key (id),
        unique (person_id, affiliation_t, organizational_unit_id)
    );

    create table prc_urls (
        id number(19,0) not null,
        url varchar2(500 char) not null,
        role_record_id number(19,0) not null,
        address_t number(19,0) not null,
        primary key (id)
    );

    create table prd_campuses (
        id number(19,0) not null,
        code varchar2(2 char) not null,
        name varchar2(100 char) not null,
        primary key (id),
        unique (code, name)
    );

    create table prd_identifier_types (
        identifier_t number(19,0) not null,
        deleted number(1,0) not null,
        description varchar2(200 char) not null,
        format varchar2(100 char) not null,
        modifiable number(1,0) not null,
        name varchar2(100 char) not null,
        notifiable number(1,0) not null,
        private number(1,0) not null,
        primary key (identifier_t),
        unique (name)
    );

    create table prd_system_of_record (
        id number(19,0) not null,
        sor_id varchar2(100 char) not null unique,
        primary key (id)
    );

    create table prs_addresses (
        id number(19,0) not null,
        bldg_no varchar2(10 char),
        city varchar2(100 char) not null,
        line1 varchar2(100 char) not null,
        line2 varchar2(100 char),
        line3 varchar2(100 char),
        postal_code varchar2(9 char),
        room_no varchar2(11 char),
        update_date timestamp not null,
        country_id number(19,0) not null,
        region_id number(19,0),
        role_record_id number(19,0) not null,
        address_t number(19,0) not null,
        primary key (id),
        unique (address_t, role_record_id)
    );

    create table prs_disclosure (
        id number(19,0) not null,
        disclosure_code varchar2(10 char) not null,
        updated_date timestamp not null,
        within_grace_period number(1,0) not null,
        sor_person_id number(19,0) not null,
        primary key (id),
        unique (sor_person_id)
    );

    create table prs_emails (
        id number(19,0) not null,
        address varchar2(100 char) not null,
        address_t number(19,0) not null,
        role_record_id number(19,0) not null,
        primary key (id),
        unique (address_t, role_record_id)
    );

    create table prs_leaves_of_absence (
        id number(19,0) not null,
        end_date date,
        start_date date not null,
        leave_t number(19,0) not null,
        role_record_id number(19,0) not null,
        primary key (id)
    );

    create table prs_names (
        id number(19,0) not null,
        family_name varchar2(100 char),
        given_name varchar2(100 char) not null,
        middle_name varchar2(100 char),
        prefix varchar2(5 char),
        suffix varchar2(5 char),
        sor_person_id number(19,0) not null,
        name_t number(19,0) not null,
        primary key (id)
    );

    create table prs_phones (
        id number(19,0) not null,
        area_code varchar2(5 char) not null,
        country_code varchar2(5 char) not null,
        extension varchar2(5 char),
        phone_number varchar2(10 char) not null,
        phone_line_order number(10,0) not null,
        update_date timestamp not null,
        address_t number(19,0) not null,
        phone_t number(19,0) not null,
        role_record_id number(19,0) not null,
        primary key (id),
        unique (phone_t, address_t, phone_line_order, role_record_id)
    );

    create table prs_role_records (
        record_id number(19,0) not null,
        termination_date date,
        percent_time number(10,0) not null,
        id varchar2(255 char) not null,
        sponsor_id number(19,0) not null,
        affiliation_date date not null,
        title varchar2(100 char) not null,
        affiliation_t number(19,0) not null,
        organizational_unit_id number(19,0) not null,
        sor_person_id number(19,0) not null,
        person_status_t number(19,0) not null,
        sponsor_t number(19,0) not null,
        system_of_record_id number(19,0) not null,
        termination_t number(19,0),
        primary key (record_id),
        unique (system_of_record_id, id, affiliation_t)
    );

    create table prs_sor_persons (
        record_id number(19,0) not null,
        date_of_birth date,
        gender varchar2(1 char),
        person_id number(19,0),
        id varchar2(255 char),
        source_sor_id varchar2(255 char) not null,
        ssn varchar2(9 char),
        primary key (record_id)
    );

    create table prs_sor_persons_loc_attr (
        sor_person_record_id number(19,0) not null,
        attribute_value varchar2(255 char),
        attribute_type varchar2(255 char) not null,
        primary key (sor_person_record_id, attribute_type)
    );

    create table prs_urls (
        id number(19,0) not null,
        url varchar2(500 char) not null,
        role_record_id number(19,0) not null,
        address_t number(19,0) not null,
        primary key (id)
    );

    alter table AUTH_GROUP_AUTHORITY 
        add constraint FK9884C0AC417C4AB9 
        foreign key (AUTHORITY_ID) 
        references auth_authorities;

    alter table AUTH_GROUP_AUTHORITY 
        add constraint FK9884C0ACAD419AB9 
        foreign key (GROUP_ID) 
        references auth_groups;

    alter table AUTH_USER_GROUP 
        add constraint FK435AE7E2DE47541B 
        foreign key (USER_ID) 
        references auth_users;

    alter table AUTH_USER_GROUP 
        add constraint FK435AE7E2AD419AB9 
        foreign key (GROUP_ID) 
        references auth_groups;

    create index AUX_PROGRAM_IDX on AUX_IDENTIFIERS (PROGRAM_ID);

    create index AUX_IDENTIFIER_IDX on AUX_IDENTIFIERS (IDENTIFIER);

    create index AUX_ID_ID_TYPE_IDX on AUX_IDENTIFIERS (IDENTIFIER, IDENTIFIER_T);

    alter table AUX_IDENTIFIERS 
        add constraint FK793103AF4CBB02D1 
        foreign key (IDENTIFIER_T) 
        references prd_identifier_types;

    alter table AUX_IDENTIFIERS 
        add constraint FK793103AF25BEDB04 
        foreign key (PROGRAM_ID) 
        references AUX_PROGRAMS;

    create index AUTH_PROGRAM_NAME_IDX on AUX_PROGRAMS (PROGRAM_NAME);

    alter table AUX_PROGRAMS 
        add constraint FK55A90DAA27B2F539 
        foreign key (SPONSOR_T) 
        references ctx_data_types;

    alter table aud_AUTH_GROUP_AUTHORITY 
        add constraint FK36C6EEDB3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_AUTH_USER_GROUP 
        add constraint FK3F1258533C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_AUX_IDENTIFIERS 
        add constraint FK74E874203C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_AUX_PROGRAMS 
        add constraint FK9C77DAD93C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_auth_authorities 
        add constraint FK4878B0B93C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_auth_groups 
        add constraint FK16FE1D3C3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_auth_users 
        add constraint FK649C3DA03C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_ctd_countries 
        add constraint FK6D6BB4393C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_ctd_regions 
        add constraint FK4A5B6EC43C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_ctx_data_types 
        add constraint FK7732C62B3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_drd_organizational_units 
        add constraint FKE8A152463C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prc_addresses 
        add constraint FKC94BEC353C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prc_contact_emails 
        add constraint FKDD2810A33C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prc_contact_phones 
        add constraint FKEFAD59113C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prc_disclosure 
        add constraint FK2AD20BBA3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prc_disclosure_address 
        add constraint FK2B76F46F3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prc_disclosure_email 
        add constraint FK410386D73C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prc_disclosure_phone 
        add constraint FK419C78A93C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prc_disclosure_url 
        add constraint FK173E936A3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prc_emails 
        add constraint FK3FD4B8A43C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prc_identifiers 
        add constraint FK499E80BD3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prc_leaves_of_absence 
        add constraint FK90A030EB3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prc_names 
        add constraint FKF204895B3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prc_persons 
        add constraint FKF3F449113C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prc_phones 
        add constraint FK525A01123C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prc_role_records 
        add constraint FK6178D2063C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prc_urls 
        add constraint FK185628713C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prd_campuses 
        add constraint FK5C265FF93C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prd_identifier_types 
        add constraint FK6101BB8F3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prd_system_of_record 
        add constraint FKC7035FD53C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prs_addresses 
        add constraint FK179718453C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prs_disclosure 
        add constraint FKA5EC61AA3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prs_emails 
        add constraint FKBDE786943C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prs_leaves_of_absence 
        add constraint FK6B464CFB3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prs_names 
        add constraint FK40683D6B3C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prs_phones 
        add constraint FKD06CCF023C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prs_role_records 
        add constraint FK7F556BF63C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prs_sor_persons 
        add constraint FK196F3DF83C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prs_sor_persons_loc_attr 
        add constraint FKB11B21F73C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    alter table aud_prs_urls 
        add constraint FK33A3B2613C81FA73 
        foreign key (REV) 
        references SpringSecurityRevisionEntity;

    create index AUTH_AUTHORITY_NAME_IDX on auth_authorities (AUTHORITY_NAME);

    create index AUTH_GROUP_NAME_IDX on auth_groups (GROUP_NAME);

    create index AUTH_USERS_NAME_IDX on auth_users (USER_NAME);

    create index COUNTRY_CODE_INDEX on ctd_countries (code);

    create index COUNTRY_NAME_INDEX on ctd_countries (name);

    create index REGION_COUNTRY_CODE_INDEX on ctd_regions (code, country_id);

    alter table ctd_regions 
        add constraint FKFDC01DD33AAF30A 
        foreign key (country_id) 
        references ctd_countries;

    create index TYPE_INDEX on ctx_data_types (data_type);

    alter table drd_organizational_units 
        add constraint FKB08FD397919104A 
        foreign key (campus_id) 
        references prd_campuses;

    alter table drd_organizational_units 
        add constraint FKB08FD39773ABFE4 
        foreign key (organizational_unit_t) 
        references ctx_data_types;

    alter table drd_organizational_units 
        add constraint FKB08FD39749A1A6FC 
        foreign key (parent_organizational_unit_id) 
        references drd_organizational_units;

    create index PRC_ADDRESSES_COUNTRY_ID_IDX on prc_addresses (country_id);

    create index PRC_ADDRESSES_REGION_ID_IDX on prc_addresses (region_id);

    create index ADDRESS_INDEX on prc_addresses (line1, city, postal_code);

    alter table prc_addresses 
        add constraint FK3641138460051F26 
        foreign key (role_record_id) 
        references prc_role_records;

    alter table prc_addresses 
        add constraint FK364113843AAF30A 
        foreign key (country_id) 
        references ctd_countries;

    alter table prc_addresses 
        add constraint FK36411384C43B49AA 
        foreign key (region_id) 
        references ctd_regions;

    alter table prc_addresses 
        add constraint FK364113849C806F93 
        foreign key (address_t) 
        references ctx_data_types;

    create index CONTACT_EMAIL_ADDRESS_INDEX on prc_contact_emails (address);

    create index PRC_CONTACT_EMAILS_EM_ADD_IDX on prc_contact_emails (email_address_t);

    alter table prc_contact_emails 
        add constraint FK552222B43ABEE2B0 
        foreign key (email_address_t) 
        references ctx_data_types;

    create index CONTACT_PHONE_INDEX on prc_contact_phones (country_code, area_code, phone_number);

    create index PRC_CONTACT_PHONES_PHONE_T_IDX on prc_contact_phones (phone_t);

    create index PRC_CONTACT_PHONES_ADDR_T_IDX on prc_contact_phones (address_t);

    alter table prc_contact_phones 
        add constraint FK67A76B2244E19A8D 
        foreign key (phone_t) 
        references ctx_data_types;

    alter table prc_contact_phones 
        add constraint FK67A76B229C806F93 
        foreign key (address_t) 
        references ctx_data_types;

    alter table prc_disclosure 
        add constraint FK5C81CE4B91BFC98A 
        foreign key (person_id) 
        references prc_persons;

    alter table prc_disclosure_address 
        add constraint FK15079600AED9AB97 
        foreign key (disclosure_record_id) 
        references prc_disclosure;

    alter table prc_disclosure_address 
        add constraint FK150796005D70878F 
        foreign key (affiliation_t) 
        references ctx_data_types;

    alter table prc_disclosure_address 
        add constraint FK150796009C806F93 
        foreign key (address_t) 
        references ctx_data_types;

    alter table prc_disclosure_email 
        add constraint FKA2C158A8AED9AB97 
        foreign key (disclosure_record_id) 
        references prc_disclosure;

    alter table prc_disclosure_email 
        add constraint FKA2C158A85D70878F 
        foreign key (affiliation_t) 
        references ctx_data_types;

    alter table prc_disclosure_email 
        add constraint FKA2C158A89C806F93 
        foreign key (address_t) 
        references ctx_data_types;

    alter table prc_disclosure_phone 
        add constraint FKA35A4A7AAED9AB97 
        foreign key (disclosure_record_id) 
        references prc_disclosure;

    alter table prc_disclosure_phone 
        add constraint FKA35A4A7A5D70878F 
        foreign key (affiliation_t) 
        references ctx_data_types;

    alter table prc_disclosure_phone 
        add constraint FKA35A4A7A44E19A8D 
        foreign key (phone_t) 
        references ctx_data_types;

    alter table prc_disclosure_phone 
        add constraint FKA35A4A7A9C806F93 
        foreign key (address_t) 
        references ctx_data_types;

    alter table prc_disclosure_url 
        add constraint FK8F38A57BAED9AB97 
        foreign key (disclosure_record_id) 
        references prc_disclosure;

    alter table prc_disclosure_url 
        add constraint FK8F38A57B5D70878F 
        foreign key (affiliation_t) 
        references ctx_data_types;

    alter table prc_disclosure_url 
        add constraint FK8F38A57B9C806F93 
        foreign key (address_t) 
        references ctx_data_types;

    create index EMAIL_ADDRESS_INDEX on prc_emails (address);

    alter table prc_emails 
        add constraint FK66A66BB560051F26 
        foreign key (role_record_id) 
        references prc_role_records;

    alter table prc_emails 
        add constraint FK66A66BB59C806F93 
        foreign key (address_t) 
        references ctx_data_types;

    create index ID_ID_TYPE_INDEX on prc_identifiers (identifier, identifier_t);

    create index PRC_IDENTIF_PERSON_IDX on prc_identifiers (person_id);

    create index ID_IDENTIFIER_INDEX on prc_identifiers (identifier);

    alter table prc_identifiers 
        add constraint FK4DE7104C4CBB02D1 
        foreign key (identifier_t) 
        references prd_identifier_types;

    alter table prc_identifiers 
        add constraint FK4DE7104C91BFC98A 
        foreign key (person_id) 
        references prc_persons;

    create index PRC_LEAVE_OF_ABS_ROLE_REC_IDX on prc_leaves_of_absence (role_record_id);

    create index PRC_LEAVE_OF_ABSENCE_LEAVE_IDX on prc_leaves_of_absence (leave_t);

    alter table prc_leaves_of_absence 
        add constraint FK669C993A60051F26 
        foreign key (role_record_id) 
        references prc_role_records;

    alter table prc_leaves_of_absence 
        add constraint FK669C993A6B687D96 
        foreign key (leave_t) 
        references ctx_data_types;

    create index PRC_NAMES_NAME_T_IDX on prc_names (name_t);

    create index PRC_NAMES_PERSON_ID_IDX on prc_names (person_id);

    create index NAME_GIVEN_FAMILY_INDEX on prc_names (given_name, family_name);

    create index PRC_NAMES_OFF_NAME_IDX on prc_names (is_official_name);

    create index PRC_NAMES_PREF_NAME_IDX on prc_names (is_preferred_name);

    create index NAME_FAMILY_INDEX on prc_names (family_name);

    create index NAME_GIVEN_INDEX on prc_names (given_name);

    alter table prc_names 
        add constraint FK3D97B02A299F046A 
        foreign key (name_t) 
        references ctx_data_types;

    alter table prc_names 
        add constraint FK3D97B02A91BFC98A 
        foreign key (person_id) 
        references prc_persons;

    create index PRC_PERSONS_CONTACT_PHONE_IDX on prc_persons (contact_phone_id);

    create index PRC_PERSONS_CONTACT_EMAIL_IDX on prc_persons (contact_email_id);

    alter table prc_persons 
        add constraint FKA758F820A2BC9F69 
        foreign key (contact_phone_id) 
        references prc_contact_phones;

    alter table prc_persons 
        add constraint FKA758F8203B0602E5 
        foreign key (contact_email_id) 
        references prc_contact_emails;

    create index PHONE_INDEX on prc_phones (country_code, area_code, phone_number);

    alter table prc_phones 
        add constraint FK792BB42360051F26 
        foreign key (role_record_id) 
        references prc_role_records;

    alter table prc_phones 
        add constraint FK792BB42344E19A8D 
        foreign key (phone_t) 
        references ctx_data_types;

    alter table prc_phones 
        add constraint FK792BB4239C806F93 
        foreign key (address_t) 
        references ctx_data_types;

    create index PRC_ROLE_RECORDS_PRS_STAT_IDX on prc_role_records (person_status_t);

    create index PRC_ROLE_RECORDS_SPONSOR_IDX on prc_role_records (sponsor_t);

    create index PRC_ROLE_REC_PRS_ROLE_REC_IDX on prc_role_records (prs_role_id);

    create index PRC_ROLE_RECORDS_TERM_IDX on prc_role_records (termination_t);

    alter table prc_role_records 
        add constraint FKE642345727B2F539 
        foreign key (sponsor_t) 
        references ctx_data_types;

    alter table prc_role_records 
        add constraint FKE64234575D70878F 
        foreign key (affiliation_t) 
        references ctx_data_types;

    alter table prc_role_records 
        add constraint FKE64234575ABC21BB 
        foreign key (person_status_t) 
        references ctx_data_types;

    alter table prc_role_records 
        add constraint FKE642345730C4EFC7 
        foreign key (organizational_unit_id) 
        references drd_organizational_units;

    alter table prc_role_records 
        add constraint FKE642345791BFC98A 
        foreign key (person_id) 
        references prc_persons;

    alter table prc_role_records 
        add constraint FKE64234571FEF16A3 
        foreign key (termination_t) 
        references ctx_data_types;

    create index PRC_URLS_ADDRESS_T_IDX on prc_urls (address_t);

    create index PRC_URLS_ROLE_RECORD_ID_IDX on prc_urls (role_record_id);

    alter table prc_urls 
        add constraint FKAF6B6BC260051F26 
        foreign key (role_record_id) 
        references prc_role_records;

    alter table prc_urls 
        add constraint FKAF6B6BC29C806F93 
        foreign key (address_t) 
        references ctx_data_types;

    create index PRS_ADDRESSES_REGION_ID_IDX on prs_addresses (region_id);

    create index PRS_ADDRESS_ROLE_INDEX on prs_addresses (role_record_id);

    create index PRS_ADDRESSES_COUNTRY_ID_IDX on prs_addresses (country_id);

    alter table prs_addresses 
        add constraint FK848C3F94F396A254 
        foreign key (role_record_id) 
        references prs_role_records;

    alter table prs_addresses 
        add constraint FK848C3F943AAF30A 
        foreign key (country_id) 
        references ctd_countries;

    alter table prs_addresses 
        add constraint FK848C3F94C43B49AA 
        foreign key (region_id) 
        references ctd_regions;

    alter table prs_addresses 
        add constraint FK848C3F949C806F93 
        foreign key (address_t) 
        references ctx_data_types;

    alter table prs_disclosure 
        add constraint FKD79C243BF6F86DCF 
        foreign key (sor_person_id) 
        references prs_sor_persons;

    create index PRS_EMAIL_ROLE_INDEX on prs_emails (role_record_id);

    alter table prs_emails 
        add constraint FKE4B939A5F396A254 
        foreign key (role_record_id) 
        references prs_role_records;

    alter table prs_emails 
        add constraint FKE4B939A59C806F93 
        foreign key (address_t) 
        references ctx_data_types;

    create index PRS_LEAV_ABSENCE_LEAVE_T_IDX on prs_leaves_of_absence (leave_t);

    create index PRS_LOA_ROLE_INDEX on prs_leaves_of_absence (role_record_id);

    alter table prs_leaves_of_absence 
        add constraint FK4142B54AF396A254 
        foreign key (role_record_id) 
        references prs_role_records;

    alter table prs_leaves_of_absence 
        add constraint FK4142B54A6B687D96 
        foreign key (leave_t) 
        references ctx_data_types;

    create index PRS_NAMES_NAME_T_IDX on prs_names (name_t);

    create index PRS_NAME_PERSON_INDEX on prs_names (sor_person_id);

    alter table prs_names 
        add constraint FK8BFB643A299F046A 
        foreign key (name_t) 
        references ctx_data_types;

    alter table prs_names 
        add constraint FK8BFB643AF6F86DCF 
        foreign key (sor_person_id) 
        references prs_sor_persons;

    create index PRS_PHONE_ROLE_INDEX on prs_phones (role_record_id);

    alter table prs_phones 
        add constraint FKF73E8213F396A254 
        foreign key (role_record_id) 
        references prs_role_records;

    alter table prs_phones 
        add constraint FKF73E821344E19A8D 
        foreign key (phone_t) 
        references ctx_data_types;

    alter table prs_phones 
        add constraint FKF73E82139C806F93 
        foreign key (address_t) 
        references ctx_data_types;

    create index PRS_ROLE_REC_PERS_STAT_T_IDX on prs_role_records (person_status_t);

    create index PRS_ROLE_RECORDS_SPONSOR_T_IDX on prs_role_records (sponsor_t);

    create index PRS_ROLE_REC_ORG_UNIT_ID_IDX on prs_role_records (organizational_unit_id);

    create index PRS_ROLE_SOR_PERSON_INDEX on prs_role_records (sor_person_id);

    create index PRS_ROLE_REC_TERM_T_IDX on prs_role_records (termination_t);

    alter table prs_role_records 
        add constraint FK41ECE4727B2F539 
        foreign key (sponsor_t) 
        references ctx_data_types;

    alter table prs_role_records 
        add constraint FK41ECE475D70878F 
        foreign key (affiliation_t) 
        references ctx_data_types;

    alter table prs_role_records 
        add constraint FK41ECE475ABC21BB 
        foreign key (person_status_t) 
        references ctx_data_types;

    alter table prs_role_records 
        add constraint FK41ECE4730C4EFC7 
        foreign key (organizational_unit_id) 
        references drd_organizational_units;

    alter table prs_role_records 
        add constraint FK41ECE47F6F86DCF 
        foreign key (sor_person_id) 
        references prs_sor_persons;

    alter table prs_role_records 
        add constraint FK41ECE471FEF16A3 
        foreign key (termination_t) 
        references ctx_data_types;

    alter table prs_role_records 
        add constraint FK41ECE4796BAEDE0 
        foreign key (system_of_record_id) 
        references prd_system_of_record;

    create index SOR_PERSON_SOURCE_AND_ID_INDEX on prs_sor_persons (source_sor_id, id);

    alter table prs_sor_persons_loc_attr 
        add constraint FK7909A348167CE9DB 
        foreign key (sor_person_record_id) 
        references prs_sor_persons;

    create index PRS_URL_ROLE_INDEX on prs_urls (role_record_id);

    create index PRS_URLS_ADDRESS_T_IDX on prs_urls (address_t);

    alter table prs_urls 
        add constraint FKCAB8F5B2F396A254 
        foreign key (role_record_id) 
        references prs_role_records;

    alter table prs_urls 
        add constraint FKCAB8F5B29C806F93 
        foreign key (address_t) 
        references ctx_data_types;

    create sequence AUX_IDENTIFIERS_SEQ;

    create sequence AUX_PROGRAMS_SEQ;

    create sequence auth_authority_seq;

    create sequence auth_groups_seq;

    create sequence auth_users_seq;

    create sequence ctd_countries_seq;

    create sequence ctd_regions_seq;

    create sequence ctx_data_types_seq;

    create sequence drd_organizational_units_seq;

    create sequence hibernate_sequence;

    create sequence prc_addresses_seq;

    create sequence prc_contact_emails_seq;

    create sequence prc_contact_phones_seq;

    create sequence prc_disclosure_address_seq;

    create sequence prc_disclosure_email_seq;

    create sequence prc_disclosure_phone_seq;

    create sequence prc_disclosure_records_seq;

    create sequence prc_disclosure_url_seq;

    create sequence prc_emails_seq;

    create sequence prc_identifiers_seq;

    create sequence prc_leaves_of_absence_seq;

    create sequence prc_names_seq;

    create sequence prc_persons_seq;

    create sequence prc_phones_seq;

    create sequence prc_role_records_seq;

    create sequence prc_urls_seq;

    create sequence prd_campuses_seq;

    create sequence prd_identifier_types_seq;

    create sequence prd_system_of_record_seq;

    create sequence prs_addresses_seq;

    create sequence prs_disclosure_records_seq;

    create sequence prs_emails_seq;

    create sequence prs_leaves_of_absence_seq;

    create sequence prs_names_seq;

    create sequence prs_phones_seq;

    create sequence prs_role_records_seq;

    create sequence prs_sor_persons_seq;

    create sequence prs_urls_seq;
