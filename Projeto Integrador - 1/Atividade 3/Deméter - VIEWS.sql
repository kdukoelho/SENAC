-- Criação de views
use Demeter;
create view VIEW_VEGETAIS as 
select v.id_vegetal, v.nome, tv.nome_tipo, qtd_estoque, valor_p_kg 
from vegetais as v join tipos_vegetais as tv
on v.id_tipo_vegetal = tv.id_tipo;

create view VIEW_CLIENTES as
select c.id, c.nome, p.id_pedido, c.endereco, c.email, c.num_contato 
from clientes as c join pedido as p
on c.id = p.id_cliente;

create view VIEW_PEDIDOS_ENTREGUES as
select p.id_pedido, p.id_cliente, p.data_pedido, p.data_agendada_entrega, p.data_efetiva_entrega from pedido as p
where year(data_efetiva_entrega) > 0;

