create database if not exists hospital
default character set utf8
default collate utf8_general_ci;

create table if not exists convenios(
id_convenio int auto_increment,
nome varchar(45),
cnpj char(14),
tempo_carencia int,
primary key (id_convenio)
)Engine=InnoDb default charset utf8;

create table if not exists pacientes(
id_paciente int auto_increment,
id_convenio int not null,
nome varchar(45),
data_nascimento date,
endereco varchar(45),
telefone varchar(15),
email varchar(45),
cpf char(11),
rg varchar(9),
primary key (id_paciente),
foreign key (id_convenio) references convenios(id_convenio)
)Engine = InnoDb default charset utf8;

create table if not exists medicos(
id_medico int auto_increment,
nome varchar(45),
crm varchar(6),
estado char(2),
tipo varchar(25),
nascimento date,
telefone varchar(15),
endereco varchar(30),
primary key (id_medico)
)Engine = InnoDb default charset utf8;

create table if not exists especialidades(
id_especialidade int auto_increment,
nome_especialide varchar(45),
primary key(id_especialidade)
)Engine = InnoDb default charset utf8;

create table if not exists medico_has_especialidade(
id_medico int not null,
id_especialidade int not null,
foreign key (id_medico) references medicos(id_medico),
foreign key (id_especialidade) references especialidades(id_especialidade)
)Engine = InnoDb default charset utf8;

create table if not exists consultas(
id_consulta int auto_increment,
id_paciente int not null,
id_medico int not null,
id_especialidade int not null,
id_convenio int not null,
datahorario_realizacao datetime,
valor_consulta decimal,
primary key (id_consulta),
foreign key (id_paciente) references pacientes(id_paciente),
foreign key (id_medico) references medicos(id_medico),
foreign key (id_especialidade) references especialidades(id_especialidade),
foreign key (id_convenio) references convenios(id_convenio)
)Engine = InnoDb default charset utf8;

create table if not exists receitas(
id_receita int auto_increment,
id_consulta int not null,
medicamentos varchar(30),
quatidade varchar(30),
instrucoes varchar(45),
primary key (id_receita),
foreign key (id_consulta) references consultas(id_consulta)
)Engine = InnoDb default charset utf8;

create table if not exists tipo_quarto(
id_tipo_quarto int auto_increment,
descricao varchar(45),
valor_diaria decimal,
primary key (id_tipo_quarto)
)Engine = InnoDb default charset utf8;

create table if not exists quartos(
id_quarto int auto_increment,
id_tipo_quarto int not null,
numero int,
primary key (id_quarto),
foreign key (id_tipo_quarto) references tipo_quarto(id_tipo_quarto)
)Engine = InnoDb default charset utf8;

create table if not exists enfermeiros(
id_enfermeiro int auto_increment,
nome varchar(45),
cpf char(11),
cre varchar(6),
primary key (id_enfermeiro)
)Engine = InnoDB default charset utf8;

create table if not exists internacao(
id_internacao int auto_increment,
id_medico int not null,
id_quarto_ocupado int not null,
id_paciente int not null,
data_entrada datetime,
data_prev_alta datetime,
data_alta datetime,
procedimento varchar(45),
primary key (id_internacao),
foreign key (id_medico) references medicos(id_medico),
foreign key (id_quarto_ocupado) references quartos(id_quarto),
foreign key (id_paciente) references pacientes(id_paciente)
)Engine = InnoDb default charset utf8;

create table if not exists internacao_has_enfermeiros(
id_internacao int not null,
id_enfermeiro int not null,
foreign key (id_internacao) references internacao(id_internacao),
foreign key (id_enfermeiro) references enfermeiros(id_enfermeiro)
)Engine = InnoDb default charset utf8;