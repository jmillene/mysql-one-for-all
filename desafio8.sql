SELECT artista AS artista, al.album AS album FROM SpotifyClone.artista AS ar
INNER JOIN SpotifyClone.album as al
ON ar.artista_id = al.artista_id
WHERE ar.artista = 'Elis Regina'
ORDER BY al.album ASC
LIMIT 2;