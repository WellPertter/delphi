INSERT INTO gerencia_ocorrencia_plano_acao (
    id_ocorrencia, 
    tipo_acao, 
    acao, 
    resp, 
    data_prevista, 
    data_real, 
    local, 
    custo, 
    id_oc
) 
SELECT 
    'OC002',
    tipo_acao, 
    acao, 
    resp, 
    data_prevista, 
    data_real, 
    local, 
    custo, 
    id_oc
FROM
    gerencia_ocorrencia_plano_acao
WHERE 
    id_ocorrencia = 'OC001';