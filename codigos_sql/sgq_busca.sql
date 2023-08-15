SELECT A.id, A.data_abertura, A.data_encerramento, B.descricao
FROM gerenciar_ocorrencia AS A
JOIN natureza_ocorrencia AS B ON A.cod_natureza = B.id;
