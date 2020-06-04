DEFINE USER_NAME = &&1
SPOOL INSTALL_SCHEMA.LOG

connect &&USER_NAME/oracle 

@create_album.sql &&USER_NAME
@create_user.sql &&USER_NAME
@create_style.sql &&USER_NAME
@create_playlist.sql &&USER_NAME
@create_composition.sql &&USER_NAME
@create_userstatus.sql &&USER_NAME
@create_listeninghistory.sql &&USER_NAME
@create_compositionreview.sql &&USER_NAME
@create_playlistcontent.sql &&USER_NAME
@create_albumreview.sql &&USER_NAME

@create_constraints.sql &&USER_NAME

SPOOL OFF