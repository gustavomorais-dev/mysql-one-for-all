SELECT 
    a.album_name AS album,
    COUNT(f.music_id) AS favoritadas
FROM 
    albums_details a
    JOIN musics_details m ON a.album_id = m.album_id
    JOIN fav_musics f ON m.music_id = f.music_id
GROUP BY 
    a.album_name
ORDER BY 
    favoritadas DESC, a.album_name ASC
LIMIT 3;
