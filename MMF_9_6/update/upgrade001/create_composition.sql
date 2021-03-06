DEFINE USER_NAME = &&1
DEFINE DATA_TBS = '&&USER_NAME._DATA'

CREATE TABLE COMPOSITIONS (
	ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 START WITH 1 MINVALUE 1 NOT NULL,
	COMPOSITION_NAME VARCHAR2(100) NOT NULL,
	DURATION NUMBER NOT NULL,
	LIKES NUMBER NOT NULL,
	PLAYS NUMBER NOT NULL,
	OWNER_ID NUMBER,
	STYLE_ID NUMBER,
	ALBUM_ID NUMBER,
	RATING NUMBER
)
TABLESPACE &&DATA_TBS;