SELECT
    COUNT(*) AS musicas_no_historico
FROM
    playback_history ph
    JOIN users_details ud ON ph.user_id = ud.user_id
WHERE
    ud.username = 'Barbara Liskov';
