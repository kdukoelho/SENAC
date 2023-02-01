/* Consulta para um relatório de todas as vendas pagas em dinheiro. 
Necessários para o relatório data da venda, valor total; produtos vendidos, quantidade e valor unitário; nome do cliente, cpf e telefone.
Ordena-se pela data de venda, as mais recentes primeiro.
*/
-- Antes:
explain SELECT * FROM venda v join item_venda iv join produto p join cliente c join funcionario f
where v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';

-- Depois:
create index idx_tipoPagamento on venda(tipo_pagamento);

create view VENDAS_DIN as
SELECT v.data, iv.subtotal, iv.nome_produto, iv.quantidade, iv.valor_unitario, c.nome, c.cpf, c.telefone 
FROM venda v join item_venda iv join produto p join cliente c join funcionario f
on v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id
where tipo_pagamento = 'D'
order by v.data desc;

explain select vd.* from VENDAS_DIN vd;

/* Consulta para encontrar todas as vendas de produtos de um dado fabricante.
Mostrar dados do produto, quantidade vendida, data da venda.
Ordena-se pelo nome do produto.
*/
-- Antes:
explain SELECT * 
FROM produto p, item_venda iv, venda v
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND p.fabricante like '%lar%';
 
 -- Depois:
create index idx_fabricante on produto(fabricante);
 
create view VENDAS_FABR_ULTRALAR as
SELECT p.*, iv.quantidade, v.data 
FROM produto p join item_venda iv join venda v
on p.id = iv.produto_id AND v.id = iv.venda_id 
where p.fabricante = 'Ultralar'
order by p.nome;

explain select vfb.* from VENDAS_FABR_ULTRALAR vfb;

/* Relatório de vendas de produto por cliente.
Mostrar dados do cliente, dados do produto e valor e quantidade totais de venda ao cliente de cada produto.
*/
-- Antes:
explain SELECT SUM(iv.subtotal), SUM(iv.quantidade)
FROM produto p, item_venda iv, venda v, cliente c
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id /*f.id = v.funcionario_id*/
GROUP BY c.nome, p.nome;

-- Depois:
create view VENDAS_PROD_POR_CLIENTE as
SELECT c.nome as 'nome cliente', p.nome as 'nome produto', SUM(iv.subtotal) as 'valor total', SUM(iv.quantidade) as 'qtd produto'
FROM produto p join item_venda iv join venda v join cliente c
on p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id
GROUP BY c.nome, p.nome;

explain select vppc.* from VENDAS_PROD_POR_CLIENTE vppc;

