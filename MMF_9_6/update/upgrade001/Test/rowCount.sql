set serveroutput on;

declare rowCount NUMBER;

begin
select count(*) into rowCount from ALBUMS;
DBMS_OUTPUT.PUT_LINE('ALBUMS - row count: '|| rowCount); 
select count(*) into rowCount from USERS;
DBMS_OUTPUT.PUT_LINE('USERS - row count: '|| rowCount); 
select count(*) into rowCount from STYLES;
DBMS_OUTPUT.PUT_LINE('STYLES - row count: '|| rowCount); 
select count(*) into rowCount from PLAYLISTS;
DBMS_OUTPUT.PUT_LINE('PLAYLISTS - row count: '|| rowCount); 
select count(*) into rowCount from COMPOSITIONS;
DBMS_OUTPUT.PUT_LINE('COMPOSITIONS - row count: '|| rowCount);
select count(*) into rowCount from USER_STATUSES; 
DBMS_OUTPUT.PUT_LINE('USER_STATUSES - row count: '|| rowCount);
select count(*) into rowCount from LISTENING_HISTORIES; 
DBMS_OUTPUT.PUT_LINE('LISTENING_HISTORIES - row count: '|| rowCount);
select count(*) into rowCount from COMPOSITION_REVIEWS; 
DBMS_OUTPUT.PUT_LINE('COMPOSITION_REVIEWS - row count: '|| rowCount); 
select count(*) into rowCount from PLAYLIST_CONTENTS;
DBMS_OUTPUT.PUT_LINE('PLAYLIST_CONTENTS - row count: '|| rowCount); 
select count(*) into rowCount from ALBUM_REVIEWS;
DBMS_OUTPUT.PUT_LINE('ALBUM_REVIEWS - row count: '|| rowCount); 
end;
/
