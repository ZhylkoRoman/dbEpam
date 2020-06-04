DEFINE USER_NAME = &&1
DEFINE DATA_TBS = '&&USER_NAME._DATA'

CREATE TABLE COMPOSITION_REVIEWS (
	ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 START WITH 1 MINVALUE 1 NOT NULL,
	REVIEW VARCHAR2(100) NOT NULL,
	USER_ID NUMBER,
	COMPOSITION_ID NUMBER
)
TABLESPACE &&DATA_TBS;