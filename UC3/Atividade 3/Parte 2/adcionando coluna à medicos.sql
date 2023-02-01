use hospital;
alter table medicos
add column isAtivo_bool tinyint after id_medico;

update medicos
set isAtivo_bool = 1  where id_medico > 0;

update medicos
set isAtivo_bool = 0 where id_medico < 9 and id_medico > 2;