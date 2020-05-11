-- This file is main file to drop schema.
-- This file should be run under SYSTEM user.
--
-- Input: 1 - User name
-- Example of run: SQL> @main.sql MMF_120_0

SET TIME ON
SET TIMING ON
PROMPT Enter username
DEFINE USER_NAME = &&1

SPOOL DROP_SCHEMA.LOG

SET SERVEROUTPUT ON

PROMPT Script info:
select sys_context('USERENV', 'MODULE') from dual; 

PROMPT
PROMPT Username caling to drop_schema: &&USER_NAME
PROMPT

PROMPT
PROMPT Calling drop_tablespace.sql for data tablespace
PROMPT

@drop_tablespaces.sql &&USER_NAME DATA
PROMPT

PROMPT
PROMPT Calling drop_tablespace.sql for index tablespace
PROMPT

@drop_tablespaces.sql &&USER_NAME IDX
PROMPT

PROMPT Calling drop_schema.sql
PROMPT
@drop_schema.sql &&USER_NAME
PROMPT



SET SERVEROUTPUT OFF

UNDEFINE USER_NAME
UNDEFINE TABLESPACE_NAME

SPOOL OFF