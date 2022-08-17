SELECT ca.cancao, COUNT(datehorario_reproducao) AS reproducoes FROM SpotifyClone.cancao AS ca
INNER JOIN SpotifyClone.historico_reproducao AS hi
ON ca.cancao_id = hi.cancao_id
GROUP BY ca.cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
