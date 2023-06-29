SELECT
    u.username AS pessoa_usuaria,
    CASE
        WHEN MAX(p.play_date) >= '2021-01-01' THEN 'Ativa'
        ELSE 'Inativa'
    END AS status_pessoa_usuaria
FROM
    users_details u
    JOIN playback_history p ON u.user_id = p.user_id
GROUP BY
    u.user_id, u.username
ORDER BY
    u.username ASC;
