SELECT
    ad.artist_name AS artista,
    CASE
        WHEN COUNT(f.music_id) >= 5 THEN 'A'
        WHEN COUNT(f.music_id) BETWEEN 3 AND 4 THEN 'B'
        WHEN COUNT(f.music_id) BETWEEN 1 AND 2 THEN 'C'
        ELSE '-'
    END AS ranking
FROM
    artists_details ad
    LEFT JOIN albums_details albd ON ad.artist_id = albd.artist_id
    LEFT JOIN musics_details md ON albd.album_id = md.album_id
    LEFT JOIN fav_musics f ON md.music_id = f.music_id
GROUP BY
    ad.artist_name
ORDER BY
    COUNT(f.music_id) DESC,
    ad.artist_name ASC;
