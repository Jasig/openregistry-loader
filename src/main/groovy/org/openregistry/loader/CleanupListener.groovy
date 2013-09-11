package org.openregistry.loader

import org.springframework.batch.core.JobExecution
import org.springframework.batch.core.annotation.AfterJob

class CleanupListener {
    @AfterJob
    void cleanup(JobExecution jobExecution) {
        // do stuff
    }
}