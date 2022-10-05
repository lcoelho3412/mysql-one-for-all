SELECT
	sgs.song_name AS nome,
    COUNT(ph.play_history) AS reproducoes
    FROM SpotifyClone.play_history AS ph
INNER JOIN 
	SpotifyClone.user AS usr
ON usr.iduser = ph.iduser
INNER JOIN 
	SpotifyClone.songs AS sgs
ON sgs.idsongs = ph.idsongs
WHERE usr.idplan = 1 
	OR usr.idplan = 4
GROUP BY nome
ORDER BY nome;