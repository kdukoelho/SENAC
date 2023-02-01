USE `uc4atividades`;
DROP function IF EXISTS `uc4atividades`.`COMISSAO_FUNCIONARIOS`;
;

DELIMITER $$
USE `uc4atividades`$$
create function COMISSAO_FUNCIONARIOS(id_funcionario int, data_ini date, data_fim date)
returns float deterministic
BEGIN
declare comissao float;
declare contagem_venda int;
declare tot_comissao float;

select cg.comissao into comissao from cargo cg join funcionario f
on f.id = id_funcionario and cg.id = f.cargo_id;

select count(id) into contagem_venda from venda v 
where funcionario_id = id_funcionario and (date_format(v.data, '%Y-%m-%d') >= data_ini) and (date_format(v.data, '%Y-%m-%d') <= data_fim);

set tot_comissao = contagem_venda * comissao;

return tot_comissao;
END$$
DELIMITER ;
;
