-- This file is main file to create schema.
-- This file should be run under SYSTEM user.
--
-- Input: 1 - User name
--        2 - File location
-- Example of run: SQL> @main.sql MMF_120_0 D:\Oracle\Base\oradata\ORCL\DATAFILE\

SET TIME ON
SET TIMING ON
SET APPINFO ON
PROMPT Enter username
DEFINE USER_NAME = &&1
PROMPT tbs_location
DEFINE TBS_LOCATION =  &&2

SPOOL INSTALL_SCHEMA.LOG
 
SET SERVEROUTPUT ON

PROMPT Script info:
select sys_context('USERENV', 'MODULE') from dual; 
PROMPT
PROMPT Username to create: &&USER_NAME
PROMPT Path of datafile location: &&TBS_LOCATION

PROMPT
PROMPT Calling create_tablespace.sql for data tablespace
PROMPT
@create_tablespace.sql &&USER_NAME &&TBS_LOCATION DATA 
PROMPT



PROMPT Calling create_tablespace.sql for index tablespace
PROMPT
@create_tablespace.sql &&USER_NAME &&TBS_LOCATION IDX
PROMPT

PROMPT

PROMPT Calling create_schema.sql for index tablespace
PROMPT

@create_schema.sql &&USER_NAME oracle &&USER_NAME._DATA &&USER_NAME._IDX

PROMPT

PROMPT Calling privilege_schema.sql for index tablespace
PROMPT

@privilege_schema.sql &&USER_NAME

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME
UNDEFINE TBS_LOCATION 


SPOOL OFF