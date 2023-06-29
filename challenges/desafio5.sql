SELECT
    m.music_title AS cancao,
    COUNT(p.user_id) AS reproducoes
FROM
    musics_details m
    JOIN playback_history p ON m.music_id = p.music_id
GROUP BY
    m.music_id
ORDER BY
    reproducoes DESC, cancao ASC
LIMIT 2;
