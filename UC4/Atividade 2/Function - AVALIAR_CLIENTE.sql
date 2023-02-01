USE `uc4atividades`;
DROP function IF EXISTS `uc4atividades`.`AVALIAR_CLIENTES`;
;

DELIMITER $$
USE `uc4atividades`$$
create function AVALIAR_CLIENTES(id_cliente int)
returns char(7) deterministic
BEGIN
declare soma_compras float;
declare status_cliente char(7) default 'REGULAR';

select sum(v.valor_total) into soma_compras from venda v join cliente c
on v.cliente_id = c.id
where c.id = id_cliente;

if soma_compras >= '10000' then set status_cliente = 'PREMIUM'; end if;

return status_cliente;
END$$
DELIMITER ;;

select AVALIAR_CLIENTES('9');
