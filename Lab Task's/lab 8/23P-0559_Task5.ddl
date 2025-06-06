-- Generated by Oracle SQL Developer Data Modeler 18.1.0.082.1041
--   at:        2025-04-28 10:45:14 PKT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE author (
    email       VARCHAR2(25) NOT NULL,
    firstname   VARCHAR2(25) NOT NULL,
    lastname    VARCHAR2(25) NOT NULL
);

ALTER TABLE author ADD CONSTRAINT author_pk PRIMARY KEY ( email );

CREATE TABLE author_paper (
    author_email      VARCHAR2(25) NOT NULL,
    paper_paperid     NUMBER NOT NULL,
    iscontactauthor   CHAR(1) DEFAULT 'False' NOT NULL
);

ALTER TABLE author_paper ADD CONSTRAINT author_paper_pk PRIMARY KEY ( author_email,
                                                                      paper_paperid );

CREATE TABLE paper (
    paperid    NUMBER NOT NULL,
    title      VARCHAR2(50) NOT NULL,
    abstract   VARCHAR2(50) NOT NULL,
    filename   VARCHAR2(50) NOT NULL
);

ALTER TABLE paper ADD CONSTRAINT paper_pk PRIMARY KEY ( paperid );

CREATE TABLE review (
    reviewid            NUMBER NOT NULL,
    technicalmerit      INTEGER NOT NULL,
    readability         INTEGER NOT NULL,
    originality         INTEGER NOT NULL,
    relevance           INTEGER NOT NULL,
    recommendation      VARCHAR2(20) NOT NULL,
    committeecomments   CLOB,
    authorcomments      CLOB,
    reviewer_email      VARCHAR2(50)
);

ALTER TABLE review
    ADD CONSTRAINT chk_technicalmerit CHECK ( technicalmerit BETWEEN 1 AND 10 );

ALTER TABLE review
    ADD CONSTRAINT chk_readability CHECK ( readability BETWEEN 1 AND 10 );

ALTER TABLE review
    ADD CONSTRAINT chk_originality CHECK ( originality BETWEEN 1 AND 10 );

ALTER TABLE review
    ADD CONSTRAINT chk_relevance CHECK ( relevance BETWEEN 1 AND 10 );

ALTER TABLE review ADD CONSTRAINT review_pk PRIMARY KEY ( reviewid );

CREATE TABLE reviewer (
    email              VARCHAR2(50) NOT NULL,
    firstname          VARCHAR2(25) NOT NULL,
    lastname           VARCHAR2(25) NOT NULL,
    phone              VARCHAR2(11) NOT NULL,
    affiliation        VARCHAR2(15) NOT NULL,
    topicsofinterest   VARCHAR2(50) NOT NULL,
    paper_paperid      NUMBER
);

ALTER TABLE reviewer ADD CONSTRAINT reviewer_pk PRIMARY KEY ( email );

ALTER TABLE author_paper
    ADD CONSTRAINT author_paper_author_fk FOREIGN KEY ( author_email )
        REFERENCES author ( email );

ALTER TABLE author_paper
    ADD CONSTRAINT author_paper_paper_fk FOREIGN KEY ( paper_paperid )
        REFERENCES paper ( paperid );

ALTER TABLE review
    ADD CONSTRAINT review_reviewer_fk FOREIGN KEY ( reviewer_email )
        REFERENCES reviewer ( email );

ALTER TABLE reviewer
    ADD CONSTRAINT reviewer_paper_fk FOREIGN KEY ( paper_paperid )
        REFERENCES paper ( paperid );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
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
