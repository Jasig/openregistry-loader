#!/bin/sh

if [ -z ${JAVA_HOME} ]
then
    echo "Please set JAVA_HOME"
    exit 1
fi

export LOADER_HOME=`cd $(dirname $0)/..;pwd`
JAVA_CMD=${JAVA_HOME}/bin/java
DEBUG_OPTS=" -agentlib:jdwp=transport=dt_socket,server=y,address=5000"

cd $LOADER_HOME

if [ $# -ne 1 ]
    then
    echo "usage: ./sor-data-loader.sh <sorId>"
    exit 1
fi
SOR_ID=$1

${JAVA_CMD} -cp "${LOADER_HOME}/etc:lib/*" -DLOADER_HOME=$LOADER_HOME org.springframework.batch.core.launch.support.CommandLineJobRunner jobs/sor-load-job.xml sorLoadJob -next sor=$SOR_ID
