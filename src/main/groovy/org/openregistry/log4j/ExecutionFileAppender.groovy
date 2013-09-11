package org.openregistry.log4j

import org.apache.log4j.FileAppender

class ExecutionFileAppender extends FileAppender {
    @Override
    void setFile(String file) {
        super.setFile("${file}-${new Date().format("yyyy-MM-dd__HH_mm_ss_SS")}")
    }
}
