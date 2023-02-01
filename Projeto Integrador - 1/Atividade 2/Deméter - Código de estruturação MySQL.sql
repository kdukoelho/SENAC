create database if not exists Demeter character set utf8mb4 default collate utf8mb4_general_ci;

use Demeter;

create table if not exists clientes (
id int not null auto_increment,
nome varchar(50) not null,
endereco varchar(130) not null,
email varchar(100),
num_contato varchar(14),
primary key (id)
)Engine = InnoDB charset = utf8mb4 default collate utf8mb4_general_ci;

create table if not exists tipos_vegetais(
id_tipo int not null,
nome_tipo varchar(25),
primary key (id_tipo)
)Engine = InnoDB charset = utf8mb4 default collate utf8mb4_general_ci;


create table if not exists vegetais(
id_vegetal int not null auto_increment,
id_tipo_vegetal int not null,
nome varchar(35) not null,
qtd_estoque int,
valor_p_kg decimal(4,2),
primary key(id_vegetal),
foreign key (id_tipo_vegetal) references tipos_vegetais(id_tipo)
)Engine = InnoDB charset = utf8mb4 default collate utf8mb4_general_ci;

create table if not exists pedido(
id_pedido int not null auto_increment,
id_cliente int not null,
data_pedido date,
data_agendada_entrega date,
data_efetiva_entrega date,
primary key (id_pedido),
foreign key (id_cliente) references clientes(id)
)Engine = InnoDB charset utf8mb4 default collate utf8mb4_general_ci;

create table if not exists pedido_has_vegetais(
id_pedido int not null,
id_vegetal int not null,
qtd_kg decimal(4,2) not null,
foreign key (id_pedido) references pedido(id_pedido),
foreign key (id_vegetal) references vegetais(id_vegetal)
)Engine = InnoDB charset = utf8mb4 default collate utf8mb4_general_ci;
