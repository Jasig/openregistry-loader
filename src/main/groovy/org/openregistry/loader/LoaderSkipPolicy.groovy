package org.openregistry.loader

import org.openregistry.core.domain.sor.SorPersonAlreadyExistsException
import org.springframework.batch.core.step.skip.SkipLimitExceededException
import org.springframework.batch.core.step.skip.SkipPolicy

class LoaderSkipPolicy implements SkipPolicy{
    @Override
    boolean shouldSkip(Throwable t, int skipCount) throws SkipLimitExceededException {
        SorPersonAlreadyExistsException.isAssignableFrom(t.class)
    }
}
