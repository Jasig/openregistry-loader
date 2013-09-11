-- Regions/States:

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'AK', 'Alaska', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'AL', 'Alabama', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'AR', 'Arkansas', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'AS', 'American Samoa', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'AZ', 'Arizona', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'CA', 'California', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'CO', 'Colorado', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'CT', 'Connecticut', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'DC', 'District of Columbia', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'DE', 'Delaware', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'FL', 'Florida', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'FM', 'Federated States of Micronesia', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'GA', 'Georgia', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'GU', 'Guam', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'HI', 'Hawaii', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'IA', 'Iowa', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'ID', 'Idaho', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'IL', 'Illinois', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'IN', 'Indiana', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'KS', 'Kansas', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'KY', 'Kentucky', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'LA', 'Louisiana', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'MA', 'Massachusetts', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'MD', 'Maryland', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'ME', 'Maine', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'MH', 'Marshall Islands', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'MI', 'Michigan', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'MN', 'Minnesota', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'MO', 'Missouri', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'MP', 'Northern Mariana Islands', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'MS', 'Mississippi', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'MT', 'Montana', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'NC', 'North Carolina', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'ND', 'North Dakota', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'NE', 'Nebraska', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'NH', 'New Hampshire', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'NJ', 'New Jersey', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'NM', 'New Mexico', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'NV', 'Nevada', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'NY', 'New York', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'OH', 'Ohio', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'OK', 'Oklahoma', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'OR', 'Oregon', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'PA', 'Pennsylvania', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'PR', 'Puerto Rico', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'PW', 'Palau', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'RI', 'Rhode Island', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'SC', 'South Carolina', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'SD', 'South Dakota', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'TN', 'Tennessee', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'TX', 'Texas', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'UT', 'Utah', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'VA', 'Virginia', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'VI', 'Virgin Islands', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'VT', 'Vermont', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'WA', 'Washington', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'WI', 'Wisconsin', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'WV', 'West Virginia', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'WY', 'Wyoming', c.id
   FROM ctd_countries c
    WHERE c.code = 'US');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'AB', 'Alberta', c.id
   FROM ctd_countries c
    WHERE c.code = 'CA');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'BC', 'British Columbia', c.id
   FROM ctd_countries c
    WHERE c.code = 'CA');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'MB', 'Manitoba', c.id
   FROM ctd_countries c
    WHERE c.code = 'CA');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'NB', 'New Brunswick', c.id
   FROM ctd_countries c
    WHERE c.code = 'CA');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'NF', 'Newfoundland', c.id
   FROM ctd_countries c
    WHERE c.code = 'CA');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'NL', 'Newfoundland and Labrador', c.id
   FROM ctd_countries c
    WHERE c.code = 'CA');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'NS', 'Nova Scotia', c.id
   FROM ctd_countries c
    WHERE c.code = 'CA');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'NT', 'Northwest Territories', c.id
   FROM ctd_countries c
    WHERE c.code = 'CA');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'NU', 'Nunavut', c.id
   FROM ctd_countries c
    WHERE c.code = 'CA');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'ON', 'Ontario', c.id
   FROM ctd_countries c
    WHERE c.code = 'CA');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'PE', 'Prince Edward Island', c.id
   FROM ctd_countries c
    WHERE c.code = 'CA');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'QC', 'Quebec', c.id
   FROM ctd_countries c
    WHERE c.code = 'CA');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'SK', 'Saskatchewan', c.id
   FROM ctd_countries c
    WHERE c.code = 'CA');

INSERT INTO ctd_regions (id, code, name, country_id)
 (SELECT NEXTVAL('ctd_regions_seq'), 'YT', 'Yukon Territory', c.id
   FROM ctd_countries c
    WHERE c.code = 'CA');