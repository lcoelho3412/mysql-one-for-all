SELECT
	s.song_name AS cancao,
  COUNT(h.iduser) AS reproducoes
FROM SpotifyClone.play_history AS h
INNER JOIN SpotifyClone.songs AS s
	ON s.idsongs = h.idsongs
GROUP BY h.idsongs
ORDER BY COUNT(h.idsongs) DESC, s.song_name
LIMIT 2;