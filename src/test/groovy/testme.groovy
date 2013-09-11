import com.jolbox.bonecp.BoneCPDataSource
import grails.spring.BeanBuilder
import org.openregistry.loader.DatabaseConfigObjectFactoryBean
import org.springframework.context.ApplicationContext

def bb = new BeanBuilder()
bb.beans {
    dataSource(BoneCPDataSource) {
        driverClass="org.postgresql.Driver"
        jdbcUrl="jdbc:postgresql:openregistry"
        username="jj"
        password="jj"
/*        driverClass="oracle.jdbc.driver.OracleDriver"
        jdbcUrl="jdbc:oracle:thin:@localhost:1521:XE"
        username="orc"
        password="orc"*/
    }
    databaseConfig(DatabaseConfigObjectFactoryBean) {
        dataSource = ref('dataSource')
        stagingTable = "stagingTable"
        rawTable = "rawTable"
        idField = "idField"
    }
}

ApplicationContext applicationContext = bb.createApplicationContext()
println applicationContext

def config = applicationContext.getBean("databaseConfig")
println config