USE `uc4atividades`;
DROP procedure IF EXISTS `uc4atividades`.`VISUALIZAR_COMPRAS_ENTRE`;
;

DELIMITER $$
USE `uc4atividades`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `VISUALIZAR_COMPRAS_ENTRE`(id_cliente int, data_ini date, data_fim date)
BEGIN
select c.nome as 'nome cliente', v.id as 'id da venda', v.valor_total as 'valor total da venda', iv.nome_produto, iv.quantidade, date_format(v.data, '%Y-%m-%d') as 'data da compra' from cliente c join venda v join item_venda iv
on v.cliente_id = c.id and v.id = iv.venda_id
where c.id = id_cliente and (date_format(v.data, '%Y-%m-%d') >= data_ini) and (date_format(v.data, '%Y-%m-%d') <= data_fim);
END$$

DELIMITER ;
;

call VISUALIZAR_COMPRAS_ENTRE('9', '2019-01-01', '2020-05-01');
