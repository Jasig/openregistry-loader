package org.openregistry.loader

import groovy.sql.Sql
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.batch.core.StepContribution
import org.springframework.batch.core.scope.context.ChunkContext
import org.springframework.batch.core.step.tasklet.Tasklet
import org.springframework.batch.repeat.RepeatStatus

import javax.annotation.Resource
import javax.sql.DataSource

class LoadScratchData implements Tasklet {
    static final Logger logger = LoggerFactory.getLogger(LoadScratchData)

    DatabaseViewSorConfiguration sorConfiguration

    @Resource(name = "dataSource")
    DataSource openRegistryDataSource

    @Resource(name = "databaseConfig")
    ConfigObject databaseConfig

    @Override
    RepeatStatus execute(StepContribution contribution, ChunkContext chunkContext) throws Exception {
        logger.debug("checking for scratch table")

        def sql = new Sql(openRegistryDataSource)
        def metadata = (sql.connection ?: sql.dataSource.connection).metaData
        if (!metadata.getTables(null, null, (String)databaseConfig.auxTable.toString().toUpperCase(), null).next()) {
            logger.debug("did not find table, creating")
            sql.execute(databaseConfig.queries.createAuxTable.toString())
            sql.execute(databaseConfig.queries.createAuxIndex.toString())
        }

        sql.close()
        return RepeatStatus.FINISHED
    }
}
