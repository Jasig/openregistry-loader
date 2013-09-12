openregistry-loader
=============================

Spring Batch based Open Registry loader

Jasig OpenRegistry
https://wiki.jasig.org/display/OR/Home

Spring Batch
http://static.springsource.org/spring-batch/

## Prerequisites

* JDK 1.7+

* `Raw` tables (`PRR_SRC_*`) preloaded with data to be processed by the loader (loading raw tables is outside of the scope of `openregistry-loader`)

## Building

To build `openregistry-loader` simply execute `./gradlew` (or `gradlew.bat` if on Windows) command from the root of the project directory. The successful build will produce a zip self-containing archive in `build/distributions` directory with a `doc` directory inside containing the detailed instructions on how to set up and configure and run the loader.