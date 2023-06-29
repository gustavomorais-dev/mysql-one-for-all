SELECT
    ROUND(MIN(p.plan_value), 2) AS faturamento_minimo,
    ROUND(MAX(p.plan_value), 2) AS faturamento_maximo,
    ROUND(AVG(p.plan_value), 2) AS faturamento_medio,
    ROUND(SUM(p.plan_value), 2) AS faturamento_total
FROM
    users_details u
    JOIN plans_details p ON u.plan_id = p.plan_id;
