use hospital;

set foreign_key_checks = 0;

delete from consultas
where id_convenio = (select max(id_convenio) from convenios);

delete from convenios
where id_convenio = (select idc from (select max(id_convenio) as idc from convenios) as c);

set foreign_key_checks = 1;