SELECT 
	cancao AS nome_musica,
    CASE 
		WHEN  cancao LIKE '%Amar%' THEN REPLACE(cancao,'Amar','Code Review') 
        WHEN cancao LIKE '%SUPERSTAR%' THEN REPLACE(cancao,'SUPERSTAR', 'SUPERDEV')
        WHEN cancao LIKE '%Bard%' THEN REPLACE(cancao, 'Bard', 'QA')
        WHEN cancao LIKE '%SOUL%' THEN REPLACE(cancao, 'SOUL', 'CODE')
        WHEN cancao LIKE '%Pais%' THEN REPLACE(cancao, 'Pais', 'Pull Requests')
	END AS novo_nome
  FROM SpotifyClone.cancao as ca
  ORDER BY novo_nome DESC
  LIMIT 5;