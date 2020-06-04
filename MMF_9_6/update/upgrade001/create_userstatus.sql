DEFINE USER_NAME = &&1
DEFINE DATA_TBS = '&&USER_NAME._DATA'

CREATE TABLE USER_STATUSES (
	ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 START WITH 1 MINVALUE 1 NOT NULL,
	PAUSED VARCHAR2(100),
	USER_ID NUMBER,
	CURRENT_ALBUM_ID NUMBER,
	CURRENT_COMPOSITION_ID NUMBER
)
TABLESPACE &&DATA_TBS;