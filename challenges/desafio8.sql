SELECT
    a.artist_name AS artista,
    alb.album_name AS album
FROM
    artists_details a
    JOIN albums_details alb ON a.artist_id = alb.artist_id
WHERE
    a.artist_name = "Elis Regina"
ORDER BY
    album ASC;
