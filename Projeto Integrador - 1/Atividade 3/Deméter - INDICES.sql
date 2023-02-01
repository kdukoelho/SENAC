use Demeter;
create index idx_NomeVegetal on vegetais(nome);
create index idx_NomeCliente on clientes(nome);
create index idx_DataPedido on pedido(data_pedido);
create index idx_DataAgendada on pedido(data_agendada_entrega);
create index idx_TipoVegetal on vegetais(id_tipo_vegetal);
