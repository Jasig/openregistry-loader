idField = "${idField}"
rawTable = "${rawTable}"
auxTable = "${auxTable}"
type = ${type}
queries {
    changeQuery = """
select distinct(${idField}) as ${idField}, 'ADD' as action from ${rawTable} except select distinct(${idField}) as ${idField}, 'ADD' as action from ${auxTable}
UNION
select distinct(${idField}) as ${idField}, 'DELETE' as action from ${auxTable} except select distinct(${idField}) as ${idField}, 'DELETE' as action from ${rawTable}
UNION
select distinct(${idField}) as ${idField}, 'UPDATE' as action from (select * from ${rawTable} where ${idField} in (select distinct(${idField}) from ${auxTable}) except select * from ${auxTable}) as t

"""
    deleteFromAux = "delete from ${auxTable} where empl_id = ?"
    getFromRaw = "select * from ${rawTable} where ${idField} = ?"
    createAuxTable = "create table ${auxTable} (like ${rawTable})"
    createAuxIndex = "create index ai_${auxTable} on ${auxTable}(${idField})"
}
environments {
    postgresql {
        hibernate.dialect = "org.hibernate.dialect.PostgreSQLDialect"
    }
    oracle {
        hibernate.dialect = "org.hibernate.dialect.Oracle10gDialect"
        queries {
            changeQuery = """
select distinct(${idField}) as ${idField}, 'ADD' as action from ${rawTable} minus select distinct(${idField}) as ${idField}, 'ADD' as action from ${auxTable}
UNION
select distinct(${idField}) as ${idField}, 'DELETE' as action from ${auxTable} minus select distinct(${idField}) as ${idField}, 'DELETE' as action from ${rawTable}
UNION
select distinct(${idField}) as ${idField}, 'UPDATE' as action from (select * from ${rawTable} where ${idField} in (select distinct(${idField}) from ${auxTable}) minus select * from ${auxTable}) t

"""
            createAuxTable = "create table ${auxTable} as (select * from ${rawTable} where 1=2)"
        }
    }
}