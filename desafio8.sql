SELECT
	art.artist_name AS artista,
    alb.album_name AS album
FROM SpotifyClone.album AS alb
INNER JOIN SpotifyClone.artists AS art
	ON art.idartists = alb.idartists
WHERE art.artist_name LIKE 'Elis Regina'
ORDER BY album; 