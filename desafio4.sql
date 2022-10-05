SELECT
	u.user_name AS usuario,
  IF(MAX(YEAR(h.play_history)) >= '2021', 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.play_history AS h
	ON u.iduser = h.iduser
GROUP BY u.user_name
ORDER BY u.user_name; 