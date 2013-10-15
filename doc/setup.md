# Open Registry Loader set up and deployment guide

## Checklist for setting up and running OR Loader SOR jobs

* Unzip the distribution archive into a filesystem directory of choice. Example: `/opt/openregistry-loader-0.1-SNAPSHOT`. This directory will be referred to as `$OR_LOADER_DIST_HOME`

* Place JDBC driver jar for your SORs in `$OR_LOADER_DIST_HOME/lib`. Note: This file might have to be extracted from an
archive file; Please follow instructions at the following sites.
    * Oracle: http://www.oracle.com/technetwork/database/features/jdbc/index-091264.html
    * PostgreSQL: http://jdbc.postgresql.org/download.html
    * Microsoft SQL Server: http://msdn.microsoft.com/en-us/sqlserver/aa937724.aspx
    * MySQL: http://dev.mysql.com/downloads/connector/j/

* Create loader configuration directory `/etc/openregistry`. This directory will be referred to as `$OR_LOADER_CONFIG_HOME`

* Run the `$OR_LOADER_DIST_HOME/etc/dml/wipe_and_load_oracle.sql` DML script (IMPORTANT! - only done once, initially.
Otherwise, ALL the DB objects with its data will be dropped and freshly re-created!) to create Spring Batch schema
objects, Open Registry schema objects (with its local reference data), OR Loader schema objects.

* Copy `$OR_LOADER_DIST_HOME/etc/openregistry/config` directory to `$OR_LOADER_CONFIG_HOME`

* Configure JDBC connection properties in `$OR_LOADER_CONFIG_HOME/config/openregistry.properties` with values of the local target Oracle RDBMS. Example config of local development instance of Oracle. For example:

    ```properties
    jdbc.driver.classname=oracle.jdbc.OracleDriver
    jdbc.url=jdbc:oracle:thin:@localhost:1521:orcl
    db.username=ORC
    db.password=ORC
    ```

* Configure mappings for each SOR in `$OR_LOADER_CONFIG_HOME/config/config.groovy`.

* Execute the batch job for each configured SOR by running the following script and passing an SOR name parameter. For example: `$OR_LOADER_DIST_HOME/bin/sor-data-loader.sh HR` or `$OR_LOADER_DIST_HOME/bin/sor-data-loader.sh SIS` 

* Verify the correctness of the entire inbound data from SORs processing by examining Open Registry `PRS_*` and `PRC_*` tables.

## Adding additional SORs

Once the initial set up is completed, adding the additional SORs to the batch job configuration will require the following steps:

* Add `configuration` mapping block for each new SOR with an unique string `id` of that SOR to `$OR_LOADER_CONFIG_HOME/config/config.groovy`

* Insert a row of data for each new SOR into `prd_system_of_record` table with `sor_id` value matching the value of the `id` in the `$OR_LOADER_CONFIG_HOME/config/config.groovy`'s `configuration` block. For example:

`INSERT INTO prd_system_of_record (id, sor_id) VALUES (prd_system_of_record_seq.nextval, 'NEW_SOR');`





