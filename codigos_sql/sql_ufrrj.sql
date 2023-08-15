SELECT A.id, B.reagente,A.lote, A.validade, A.avaliacao
FROM controle_reagentes AS A
INNER JOIN reagentes AS B
ON A.cod_reagente = B.id;