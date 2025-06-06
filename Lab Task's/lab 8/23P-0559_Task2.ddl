-- Generated by Oracle SQL Developer Data Modeler 18.1.0.082.1041
--   at:        2025-04-28 10:45:14 PKT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE customers (
    customer_id             NUMBER NOT NULL,
    name                    VARCHAR2(25) NOT NULL,
    product_name            VARCHAR2(50) NOT NULL,
    quantity                NUMBER NOT NULL,
    address                 VARCHAR2(40) NOT NULL,
    employees_employee_id   NUMBER NOT NULL
);

ALTER TABLE customers ADD CONSTRAINT customers_pk PRIMARY KEY ( customer_id );

CREATE TABLE employees (
    employee_id   NUMBER NOT NULL,
    first_name    VARCHAR2(25) NOT NULL,
    last_name     VARCHAR2(25) NOT NULL,
    address       VARCHAR2(40) NOT NULL
);

ALTER TABLE employees ADD CONSTRAINT employees_pk PRIMARY KEY ( employee_id );

CREATE TABLE orders (
    order_na                NUMBER NOT NULL,
    quantity                NUMBER,
    shipped_date            DATE,
    recieved_date           DATE,
    customers_customer_id   NUMBER NOT NULL
);

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( order_na );

CREATE TABLE products (
    product_id              NUMBER NOT NULL,
    name                    VARCHAR2(25) NOT NULL,
    price                   NUMBER NOT NULL,
    stock                   NUMBER NOT NULL,
    employees_employee_id   NUMBER NOT NULL
);

ALTER TABLE products ADD CONSTRAINT products_pk PRIMARY KEY ( product_id );

ALTER TABLE customers
    ADD CONSTRAINT customers_employees_fk FOREIGN KEY ( employees_employee_id )
        REFERENCES employees ( employee_id );

ALTER TABLE orders
    ADD CONSTRAINT orders_customers_fk FOREIGN KEY ( customers_customer_id )
        REFERENCES customers ( customer_id );

ALTER TABLE products
    ADD CONSTRAINT products_employees_fk FOREIGN KEY ( employees_employee_id )
        REFERENCES employees ( employee_id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              7
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
