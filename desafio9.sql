SELECT COUNT(his.iduser) AS quantidade_musicas_no_historico
FROM SpotifyClone.play_history AS his
INNER JOIN SpotifyClone.user AS usr
	ON his.iduser = usr.iduser
WHERE usr.user_name = 'Barbara Liskov';