DEFINE USER_NAME=&&1;

DROP USER &&USER_NAME CASCADE; 

UNDEFINE USER_NAME;