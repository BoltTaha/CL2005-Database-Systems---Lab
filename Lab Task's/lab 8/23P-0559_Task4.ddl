-- Generated by Oracle SQL Developer Data Modeler 18.1.0.082.1041
--   at:        2025-04-28 10:45:14 PKT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE attendance (
    attendanceid          NUMBER NOT NULL,
    "Date"                DATE NOT NULL,
    status                VARCHAR2(10) NOT NULL,
    employee_employeeid   NUMBER NOT NULL
);

ALTER TABLE attendance ADD CONSTRAINT attendance_pk PRIMARY KEY ( attendanceid );

CREATE TABLE department (
    departmentid          NUMBER NOT NULL,
    name                  VARCHAR2(25) NOT NULL,
    location              VARCHAR2(40) NOT NULL,
    employee_employeeid   NUMBER NOT NULL
);

CREATE UNIQUE INDEX department__idx ON
    department (
        employee_employeeid
    ASC );

ALTER TABLE department ADD CONSTRAINT department_pk PRIMARY KEY ( departmentid );

CREATE TABLE employee (
    employeeid                NUMBER NOT NULL,
    name                      VARCHAR2(25) NOT NULL,
    dob                       DATE NOT NULL,
    contact                   NUMBER NOT NULL,
    email                     VARCHAR2(25) NOT NULL,
    hiredate                  DATE NOT NULL,
    department_departmentid   NUMBER NOT NULL
);

ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( employeeid );

ALTER TABLE employee ADD CONSTRAINT employee_email_un UNIQUE ( email );

CREATE TABLE employee_project (
    empprojectid          NUMBER NOT NULL,
    role                  VARCHAR2(10) NOT NULL,
    employee_employeeid   NUMBER NOT NULL,
    project_projectid     NUMBER NOT NULL
);

ALTER TABLE employee_project
    ADD CONSTRAINT employee_project_pk PRIMARY KEY ( empprojectid,
                                                     employee_employeeid,
                                                     project_projectid );

CREATE TABLE payroll (
    payrollid             NUMBER NOT NULL,
    salary                NUMBER(7,2) NOT NULL,
    bonus                 NUMBER(7,2),
    deductions            NUMBER(7,2),
    netsalary             NUMBER(7,2) NOT NULL,
    employee_employeeid   NUMBER NOT NULL
);

CREATE UNIQUE INDEX payroll__idx ON
    payroll (
        employee_employeeid
    ASC );

ALTER TABLE payroll ADD CONSTRAINT payroll_pk PRIMARY KEY ( payrollid );

CREATE TABLE project (
    projectid   NUMBER NOT NULL,
    name        VARCHAR2(25) NOT NULL,
    startdate   DATE NOT NULL,
    enddate     DATE,
    status      VARCHAR2(20) NOT NULL
);

ALTER TABLE project ADD CONSTRAINT project_pk PRIMARY KEY ( projectid );

ALTER TABLE attendance
    ADD CONSTRAINT attendance_employee_fk FOREIGN KEY ( employee_employeeid )
        REFERENCES employee ( employeeid );

ALTER TABLE department
    ADD CONSTRAINT department_employee_fk FOREIGN KEY ( employee_employeeid )
        REFERENCES employee ( employeeid );

ALTER TABLE employee
    ADD CONSTRAINT employee_department_fk FOREIGN KEY ( department_departmentid )
        REFERENCES department ( departmentid );

ALTER TABLE employee_project
    ADD CONSTRAINT employee_project_employee_fk FOREIGN KEY ( employee_employeeid )
        REFERENCES employee ( employeeid );

ALTER TABLE employee_project
    ADD CONSTRAINT employee_project_project_fk FOREIGN KEY ( project_projectid )
        REFERENCES project ( projectid );

ALTER TABLE payroll
    ADD CONSTRAINT payroll_employee_fk FOREIGN KEY ( employee_employeeid )
        REFERENCES employee ( employeeid );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             2
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
