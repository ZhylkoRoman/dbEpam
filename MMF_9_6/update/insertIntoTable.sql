INSERT INTO STYLES(NAME)
SELECT DISTINCT dt.Music_Type
FROM DATA_TABLE dt;



merge into USERS
    using (
        select distinct
        dt.first_name fn,
        dt.last_name ln,
        dt.nickname nick,
        dt.email email
        from data_table dt
    ) tmp
    on (
    tmp.nick = USERS.nickname 
    )
when not matched then 
    insert (
    nickname, 
    firstname, 
    lastname, 
    email
    ) values (
    tmp.nick, 
    tmp.fn, 
    tmp.ln, 
    tmp.email
    );

merge into USERS
    using (
        select distinct
        dt.owner_first_name fn,
        dt.owner_last_name ln,
        dt.owner_nickname nick
        from data_table dt
    ) tmp
    on (
    tmp.nick = USERS.nickname 
    )
when not matched then 
    insert (
    nickname,
    firstname, 
    lastname
    ) values (
    tmp.nick,
    tmp.fn, 
    tmp.ln
	);

merge into PLAYLISTS
    using (
        select distinct
        dt.playlist_name name,
        USERS.id id
        from data_table dt
        left join USERS 
        on dt.owner_nickname = USERS.nickname
    ) tmp
    on (
    PLAYLISTS.PLAYLIST_name = tmp.name and
    PLAYLISTS.owner_id = tmp.id
    )
when not matched then
    insert (
    PLAYLISTS.owner_id,
    PLAYLISTS.PLAYLIST_name
    ) values (
    tmp.id,
    tmp.name
    );

merge into COMPOSITIONS
    using (
        select distinct
        dt.composition_name name,
        dt."Length" len,
        STYLES.id style,
        dt.composition_likes likes,
        dt.listen plays,
        USERS.id id
        from data_table dt
        left join STYLES
        on STYLES.NAME = dt.music_type
        left join USERS
        on dt.owner_nickname = USERS.nickname
    ) tmp
    on (
    COMPOSITIONS.composition_name = tmp.name and
    COMPOSITIONS.duration = tmp.len and
    COMPOSITIONS.style_id = tmp.style and
    COMPOSITIONS.plays = tmp.plays and
    COMPOSITIONS.likes = tmp.likes and
    COMPOSITIONS.owner_id = tmp.id
    )
when not matched then
    insert (
    COMPOSITIONS.composition_name,
    COMPOSITIONS.duration,
    COMPOSITIONS.likes,
    COMPOSITIONS.plays,
    COMPOSITIONS.owner_id,
    COMPOSITIONS.style_id
    ) values (
    tmp.name,
    tmp.len,
    tmp.likes,
    tmp.plays,
    tmp.id,
    tmp.style
    );


merge into playlist_contents
    using (
        select distinct
        dt.composition_name,
        c.id c_id,
        p.id p_id
        from data_table dt
        left join users
        on users.nickname = dt.owner_nickname
        left join playlists p
        on p.playlist_name = dt.playlist_name and users.id = p.owner_id
        right join compositions c
        on c.composition_name = dt.composition_name
    ) tmp 
    on (
    playlist_contents.playlist_id = tmp.p_id and
    playlist_contents.COMPOSITION_ID = tmp.c_id
    ) 
when not matched then
    insert (
    playlist_contents.playlist_id,
    playlist_contents.COMPOSITION_ID
    ) values (
    tmp.p_id,
    tmp.c_id
    );

merge into composition_reviews
    using (
        select distinct
        dt.comments_track review,
        c.id c_id,
        users.id u_id
        from data_table dt
        left join compositions c
        on dt.composition_name = c.composition_name
        left join users
        on users.nickname = dt.nickname
        where not dt.comments_track is null
    ) tmp
    on (
    composition_reviews.user_id = tmp.u_id and
    composition_reviews.composition_id = tmp.c_id and
    composition_reviews.review = tmp.review
    )
when not matched then
    insert (
    composition_reviews.review,
    composition_reviews.user_id,
    composition_reviews.composition_id
    ) values (
    tmp.review,
    tmp.u_id,
    tmp.c_id
    );

INSERT INTO USER_STATUSES(PAUSED)
SELECT dt.Stopped_Time
FROM DATA_TABLE dt
WHERE dt.Current_listening = 'Y';

merge into listening_histories
    using (
        select distinct
        users.id u_id,
        c.id c_id
        from data_table dt
        left join compositions c
        on c.composition_name = dt.composition_name
        left join users
        on dt.nickname = users.nickname
    ) tmp
    on (
        listening_histories.composition_id = tmp.c_id
    )
when not matched then
    insert (
    listening_histories.composition_id,
    listening_histories.listen_date
    ) values (
    tmp.c_id,
    to_char(current_date)
    );

commit;