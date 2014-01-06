package org.openregistry.core.service.elector

import org.openregistry.core.domain.sor.SorPerson
import org.openregistry.core.service.FieldElector
import org.springframework.beans.factory.InitializingBean
import org.springframework.expression.Expression
import org.springframework.expression.spel.standard.SpelExpression
import org.springframework.expression.spel.standard.SpelExpressionParser

/**
 * Abstract {@link FieldElector} implementation for Spring configuration. See
 * <a href="http://docs.spring.io/spring/docs/3.0.x/spring-framework-reference/html/expressions.html">Spring Expression
 * Language</a> for a discussion on <code>spel</code>. Although all implementations can use their own selection,
 * the <code>spel</code> is usually evaluated against a {@link SorPerson}.
 */
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

    protected <T> T electFromList(List<SorPerson> list, Class T, boolean allowNull) {
        for (SorPerson sorPerson: list) {
            def val = this.expression.getValue(sorPerson, this.returnType)
            if (val || allowNull) {
                return (returnType)val
            }
        }
        if (!allowNull) {
            throw new IllegalStateException("no valid value found")
        }
        return null
    }
}
