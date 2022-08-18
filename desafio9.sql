SELECT COUNT(hi.datehorario_reproducao) AS quantidade_musicas_no_historico
FROM SpotifyClone.historico_reproducao AS hi
INNER JOIN SpotifyClone.user AS us
ON hi.usuario_id = us.usuario_id
WHERE us.usuario = 'Barbara Liskov';