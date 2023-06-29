SELECT
    a.artist_name AS artista,
    alb.album_name AS album,
    COUNT(f.follow_id) AS pessoas_seguidoras
FROM
    artists_details a
    JOIN albums_details alb ON a.artist_id = alb.artist_id
    JOIN following_artists f ON a.artist_id = f.artist_id
GROUP BY
    a.artist_id,
    alb.album_id
ORDER BY
    pessoas_seguidoras DESC,
    artista ASC,
    album ASC;
