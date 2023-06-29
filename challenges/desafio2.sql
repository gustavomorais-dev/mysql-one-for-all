SELECT
    (SELECT COUNT(*) FROM musics_details) AS cancoes,
    (SELECT COUNT(DISTINCT artist_id) FROM artists_details) AS artistas,
    (SELECT COUNT(DISTINCT album_id) FROM albums_details) AS albuns;
