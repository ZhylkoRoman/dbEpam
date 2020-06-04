DEFINE USER_NAME = &&1
DEFINE DATA_TBS = '&&USER_NAME._DATA'

CREATE TABLE STYLES (
	ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 START WITH 1 MINVALUE 1 NOT NULL,
	NAME VARCHAR2(100) NOT NULL,
	RATING NUMBER
)
TABLESPACE &&DATA_TBS;