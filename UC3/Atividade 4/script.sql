# Respectivas alterações no banco de dados para que as queries rodem sem interferencia

alter table consultas
change id_convenio id_convenio int;

insert into consultas values
(null, '15', '6', '4', null, '2020-08-04 15:00:00', '1000'),
(null, '7', '8', '3', null, '2019-05-12 14:30:00', '250');

insert into pacientes values
(null, '2', 'Diogo Caleb Samuel Duarte', '2003-12-15', 'Rodovia Presidente Dutra, 663, Cabral', '6227968654', 'dio.calebe@gmail.com', '43618513283', '407752870'),
(null, '3', 'Alana Isabella', '2006-07-15', 'Praça da Polônia, 995, Bairro das Garças',  '7727179446', 'isabella.alana@yahoo.com.br', '36717104708', '238175923'),
(null, '1', 'Isaac Gabriel Fernando Duarte', '2005-11-01', 'Rodovia Inácio Barbosa, 112, Zona de Expansão', '9639236473', 'dudu.isaac@hotmail.com', '49862490616', '120359534');

insert into consultas values
(null, '18' , '3', '5', '1', '2007-04-16 13:00:00', '450'),
(null, '17', '4', '2', '3', '2010-05-07 14:30:00', '600'),
(null, '16', '7', '7', '2', '2004-04-08 17:30:00', '400');

# 1. Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.

select *, avg(valor_consulta) from consultas
where year(datahorario_realizacao) = 2020
and id_convenio <> 0;

# 2. Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.

select * from internacao
where data_alta > data_prev_alta;

# 3. Receituário completo da primeira consulta registrada com receituário associado.

select * from receitas
where id_consulta = (select min(id_consulta) from receitas);

# 4. Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio).

select * from consultas
where valor_consulta = (select max from(select max(valor_consulta) as max from consultas) as a)
or valor_consulta = (select min from(select min(valor_consulta) as min from consultas) as b);

# 5. Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.

select i.*, (datediff(data_alta, data_entrada) * tq.valor_diaria) as 'valor total internacao' from internacao as i
join tipo_quarto as tq join quartos as q 
on i.id_quarto_ocupado = q.id_quarto and q.id_tipo_quarto = tq.id_tipo_quarto;

# 6. Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.

select data_entrada, procedimento, quartos.numero from internacao join quartos
where internacao.id_quarto_ocupado = quartos.id_quarto and quartos.id_tipo_quarto = (select id_tipo_quarto from tipo_quarto where descricao = 'apartamento');

# 7. Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.

select pacientes.nome, date(datahorario_realizacao), especialidades.nome_especialidade, pacientes.data_nascimento, date(now()) from consultas 
join pacientes join especialidades 
on pacientes.data_nascimento > date_sub(date(now()), interval 18 year)
and pacientes.id_paciente = consultas.id_paciente
and consultas.id_especialidade = especialidades.id_especialidade;

# 8. Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.

select pacientes.nome, medicos.nome, internacao.data_entrada, internacao.procedimento from pacientes join internacao join medicos join medico_has_especialidade as mhe
on mhe.id_especialidade = (select id_especialidade from especialidades where nome_especialidade = 'gastroenterologia')
and internacao.id_quarto_ocupado = (select id_quarto from quartos where id_tipo_quarto = (select id_tipo_quarto from tipo_quarto where descricao = 'enfermaria'))
and medicos.id_medico = mhe.id_medico
and internacao.id_paciente = pacientes.id_paciente;

# 9. Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.

select mdc.nome, mdc.crm, count(cst.id_medico) from medicos as mdc join consultas as cst
on mdc.id_medico = cst.id_medico
group by mdc.id_medico
order by mdc.nome;

# 10. Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.

select enf.nome, enf.cre, count(ihe.id_enfermeiro) from enfermeiros as enf join internacao_has_enfermeiros as ihe
on enf.id_enfermeiro = ihe.id_enfermeiro
group by enf.id_enfermeiro
having count(ihe.id_enfermeiro) > 1;