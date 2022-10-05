SELECT
	art.artist_name AS artista,
    al.album_name AS album,
    COUNT(fav.idartists) AS seguidores
    FROM SpotifyClone.artists AS art
INNER JOIN 
	SpotifyClone.album AS al
ON art.idartists = al.idartists
INNER JOIN 
	SpotifyClone.favorites AS fav
ON fav.idartists = art.idartists
GROUP BY album, artista
ORDER BY seguidores DESC,
		artista,
        album;