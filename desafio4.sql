SELECT usuario, IF (YEAR(MAX(h.datehorario_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.historico_reproducao AS h
INNER JOIN SpotifyClone.user AS u
ON h.usuario_id = u.usuario_id
GROUP BY u.usuario
ORDER BY u.usuario;