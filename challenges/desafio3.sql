SELECT
    u.username AS pessoa_usuaria,
    COUNT(p.music_id) AS musicas_ouvidas,
    ROUND(SUM(m.duration_seconds) / 60, 2) AS total_minutos
FROM
    users_details u
    JOIN playback_history p ON u.user_id = p.user_id
    JOIN musics_details m ON p.music_id = m.music_id
GROUP BY
    u.username
ORDER BY
    u.username ASC;
