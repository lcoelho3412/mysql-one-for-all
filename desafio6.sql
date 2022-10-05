SELECT
	FORMAT(MIN(p.plan_price), 2) AS faturamento_minimo,
    FORMAT(MAX(p.plan_price), 2) AS faturamento_maximo,
    FORMAT(SUM(p.plan_price)/COUNT(p.plan_price), 2) AS faturamento_medio,
    FORMAT(SUM(p.plan_price), 2) AS faturamento_total
    FROM SpotifyClone.user AS u
INNER JOIN 
	SpotifyClone.plan AS p
ON u.idplan = p.idplan;