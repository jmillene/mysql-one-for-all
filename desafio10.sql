SELECT ca.cancao AS nome , COUNT(hi.cancao_id) AS reproducoes FROM  SpotifyClone.cancao AS ca
INNER JOIN SpotifyClone.historico_reproducao AS hi
ON  ca.cancao_id = hi.cancao_id
INNER JOIN SpotifyClone.user AS us
ON us.usuario_id = hi.usuario_id
INNER JOIN SpotifyClone.plano AS pl
ON us.plano_id = pl.plano_id
WHERE pl.planos IN( 'gratuito','pessoal')
GROUP BY ca.cancao
ORDER BY ca.cancao;
