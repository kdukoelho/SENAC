USE `Demeter`;
DROP procedure IF EXISTS `VER_PEDIDO`;

DELIMITER $$
USE `Demeter`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `VER_PEDIDO`(id_pedido INT)
BEGIN
select p.*, phv.id_vegetal, v.nome, phv.qtd_kg from pedido as p join pedido_has_vegetais as phv join vegetais as v
on p.id_pedido = phv.id_pedido and phv.id_vegetal = v.id_vegetal
where p.id_pedido = id_pedido;
END$$

DELIMITER ;
