SELECT
 a.cod_exame AS codigo,
 b.descricao AS exame_perfil,
 'Exame' AS tipo
FROM cli_req_exame AS a
LEFT JOIN cli_tab_exames AS b ON( a.cod_exame = b.id )
WHERE a.cod_regamst = :cod_regamst

UNION

SELECT
 a.cod_perfil AS codigo,
 b.descricao AS exame_perfil,
 'Perfil' AS tipo
FROM cli_req_perfil AS a
LEFT JOIN cli_tab_perfis_bioquimico AS b ON( a.cod_perfil = b.id )
WHERE a.cod_regamst = :cod_regamst
