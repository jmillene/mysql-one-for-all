SELECT us.usuario,COUNT(hi.cancao_id) AS qt_de_musicas_ouvidas,ROUND(SUM(ca.duracao_segundos/60),2) AS total_minutos
FROM SpotifyClone.user AS us
INNER JOIN SpotifyClone.historico_reproducao AS hi
ON us.usuario_id = hi.usuario_id
INNER JOIN SpotifyClone.cancao AS ca
ON hi.cancao_id = ca.cancao_id
GROUP BY us.usuario
ORDER BY us.usuario; 