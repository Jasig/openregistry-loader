package org.openregistry.core.service.elector

import org.openregistry.core.domain.sor.SorPerson
import org.openregistry.core.service.FieldElector
import org.springframework.beans.factory.InitializingBean
import org.springframework.expression.Expression
import org.springframework.expression.spel.standard.SpelExpression
import org.springframework.expression.spel.standard.SpelExpressionParser

abstract class AbstractConfigurableFieldElector<returnType> implements FieldElector<returnType>, InitializingBean {
    Class returnType
    String spel

    protected Expression expression


    @Override
    void afterPropertiesSet() throws Exception {
        expression = new SpelExpressionParser().parseExpression(spel)
        assert returnType != null
    }

    @Override
    abstract <returnType> returnType elect(SorPerson newestPerson, List<SorPerson> list, boolean deletion);
}
