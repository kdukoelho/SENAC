use hospital;

update internacao
set data_alta = (date_add(data_alta, interval 3 day)) 
where id_quarto_ocupado = (select id_quarto from quartos where id_tipo_quarto = 3);