import groovy.sql.Sql

def depts = ['LMOIH', 'CEEEG', 'HENGL', 'ABCFI', 'DCCRP', 'CQADM', 'EAEDU', 'FJPPS']

class Line {
    String id
    String emplId
    String birthday = "0101"
    String lastName
    String firstName
    String middleName
    String dept
    Date apptDate = new java.sql.Date(new Date().time)
    Date terminationDate = null
    String supervisorId = "1"
    String ssnLast5

    def toArray() {
        [id, emplId, birthday, lastName, firstName, middleName, dept, apptDate, terminationDate, supervisorId, ssnLast5]
    }
}

def sql = Sql.newInstance('jdbc:oracle:thin:@localhost:1521:XE', 'orc', 'orc', 'oracle.jdbc.driver.OracleDriver')
sql.eachRow("select 1 from dual") {
    println "row: ${it}"
}

def random = new Random()

(1..99999).each {
    println "count: ${it}"
    def chance = random.nextInt(10)
    def line = new Line(id: String.format("%010d", it * 10), emplId: String.format("%09d", it), lastName: "last${it}", firstName: "first${it}", dept: depts[random.nextInt(depts.size())], ssnLast5: String.format("%05d", it))
    if (chance < 1) {
        sql.execute("insert into slx_src_hr(id, empl_id, birthdate_mmdd, last_name, first_name, middle_name, home_dept_cd, appt_begin_dt, supervisor_id, ssn_last5_no) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [line.id, line.emplId, line.birthday, line.lastName, line.firstName, line.middleName, line.dept, line.apptDate, line.supervisorId, line.ssnLast5])
    } else {
        sql.execute("insert into prr_src_hr(id, empl_id, birthdate_mmdd, last_name, first_name, middle_name, home_dept_cd, appt_begin_dt, supervisor_id, ssn_last5_no) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [line.id, line.emplId, line.birthday, line.lastName, line.firstName, line.middleName, line.dept, line.apptDate, line.supervisorId, line.ssnLast5])
        if (chance < 8) {
            sql.execute("insert into slx_src_hr(id, empl_id, birthdate_mmdd, last_name, first_name, middle_name, home_dept_cd, appt_begin_dt, supervisor_id, ssn_last5_no) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [line.id, line.emplId, line.birthday, (chance < 2) ? "${line.lastName}c".toString() : line.lastName, line.firstName, line.middleName, line.dept, line.apptDate, line.supervisorId, line.ssnLast5])
        }
    }
}