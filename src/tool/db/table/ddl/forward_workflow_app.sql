CREATE TABLE TRANS_EXPE_APPLICATION
(
    TRANS_EXPE_APPLI_ID             NCHAR(10) NOT NULL,
    WF_INSTANCE_ID                  NCHAR(10) NOT NULL,
    TRANS_EXPE_APPLI_STATUS_CD      NCHAR(2) NOT NULL,
    TRANS_DEVICE_CD                 NCHAR(1) NOT NULL,
    DEPARTURE                       NVARCHAR2(30) NOT NULL,
    DESTINATION                     NVARCHAR2(30) NOT NULL,
    TRANS_EXPENSE                   NUMBER(8,0) NOT NULL,
    CONFIRM_USER_ID                 NCHAR(10) NOT NULL,
    AUTHORIZE_USER_ID               NCHAR(10) NOT NULL,
    INSERT_USER_ID                  NCHAR(10) NOT NULL,
    INSERT_DATE_TIME                TIMESTAMP NOT NULL,
    TRANS_EXPE_APPLI_VERSION        NUMBER(8,0) DEFAULT 0 NOT NULL
)
;
ALTER TABLE TRANS_EXPE_APPLICATION
    ADD(CONSTRAINT PK_TRANS_EXPENSE_APPLICATION PRIMARY KEY (TRANS_EXPE_APPLI_ID) USING INDEX)
;
CREATE TABLE TRANS_EXPE_APPLI_HISTORY
(
    TRANS_EXPE_APPLI_HISTORY_ID     NCHAR(12) NOT NULL,
    TRANS_EXPE_APPLI_ID             NCHAR(10) NOT NULL,
    EXECUTIONER_ID                  NCHAR(10) NOT NULL,
    EXECUTION_DATE_TIME             TIMESTAMP NOT NULL,
    TRANS_EXPE_APPLI_ACTION_CD      NCHAR(1) NOT NULL,
    TRANS_EXPE_APPLI_RESULT_CD      NCHAR(1) NOT NULL,
    HISTORY_COMMENT                 NVARCHAR2(100)
)
;
ALTER TABLE TRANS_EXPE_APPLI_HISTORY
    ADD(CONSTRAINT PK_LOAN_APPLICATION_HISTORY1 PRIMARY KEY (TRANS_EXPE_APPLI_HISTORY_ID) USING INDEX)
;
CREATE TABLE LOAN_APPLICATION
(
    LOAN_APPLI_ID                   NCHAR(10) NOT NULL,
    WF_INSTANCE_ID                  NCHAR(10) NOT NULL,
    LOAN_APPLI_STATUS_CD            NCHAR(2) NOT NULL,
    COMPANY                         NVARCHAR2(100) NOT NULL,
    ANNUAL_SALARY                   NUMBER(7,0) NOT NULL,
    LOAN_AMOUNT                     NUMBER(5,0) NOT NULL,
    TRANSFER_DATE                   NCHAR(8) NOT NULL,
    SURVEY_CONTENT                  NVARCHAR2(100),
    INSERT_USER_ID                  NCHAR(10) NOT NULL,
    INSERT_DATE_TIME                TIMESTAMP NOT NULL,
    LOAN_APPLI_VERSION              NUMBER(8,0) DEFAULT 0 NOT NULL
)
;
ALTER TABLE LOAN_APPLICATION
    ADD(CONSTRAINT PK_LOAN_APPLICATION PRIMARY KEY (LOAN_APPLI_ID) USING INDEX)
;
CREATE TABLE LOAN_APPLICATION_HISTORY
(
    LOAN_APPLI_HISTORY_ID           NCHAR(12) NOT NULL,
    LOAN_APPLI_ID                   NCHAR(10) NOT NULL,
    EXECUTIONER_ID                  NCHAR(10) NOT NULL,
    EXECUTION_DATE_TIME             TIMESTAMP NOT NULL,
    LOAN_APPLI_ACTION_CD            NCHAR(1) NOT NULL,
    LOAN_APPLI_RESULT_CD            NCHAR(1) NOT NULL,
    HISTORY_COMMENT                 NVARCHAR2(100)
)
;
ALTER TABLE LOAN_APPLICATION_HISTORY
    ADD(CONSTRAINT PK_WF_HISTORY PRIMARY KEY (LOAN_APPLI_HISTORY_ID) USING INDEX)
;
CREATE SEQUENCE WF_INSTANCE_ID
    START WITH 0
    INCREMENT By 1
    MINVALUE 0
    MAXVALUE 9999999999
    CYCLE
    CACHE 20
    NOORDER;
CREATE SEQUENCE TRANS_EXPE_APPLI_ID
    START WITH 0
    INCREMENT By 1
    MINVALUE 0
    MAXVALUE 9999999999
    NOCYCLE
    CACHE 20
    NOORDER;
CREATE SEQUENCE LOAN_APPLI_ID
    START WITH 0
    INCREMENT By 1
    MINVALUE 0
    MAXVALUE 9999999999
    NOCYCLE
    CACHE 20
    NOORDER;
CREATE SEQUENCE TRANS_EXPE_APPLI_HISTORY_ID
    START WITH 0
    INCREMENT By 1
    MINVALUE 0
    MAXVALUE 999999999999
    NOCYCLE
    CACHE 20
    NOORDER;
CREATE SEQUENCE LOAN_APPLI_HISTORY_ID
    START WITH 0
    INCREMENT By 1
    MINVALUE 0
    MAXVALUE 999999999999
    NOCYCLE
    CACHE 20
    NOORDER;