SELECT
	u.user_name AS usuario,
  COUNT(ph.idsongs) AS qt_de_musicas_ouvidas,
  ROUND((SUM(s.song_duration))/60, 2) AS total_minutos
FROM SpotifyClone.play_history AS ph
LEFT JOIN SpotifyClone.user AS u
	ON ph.iduser = u.iduser
INNER JOIN SpotifyClone.songs as s
	ON ph.idsongs = s.idsongs
GROUP BY u.user_name
ORDER BY u.user_name;