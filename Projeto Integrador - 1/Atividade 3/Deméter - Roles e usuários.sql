-- Crianção de roles e dando privilegios.
create role 'gerenciador', 'estoquista', 'vendedor', 'relatorios';
grant all on Demeter.* to 'gerenciador';
grant insert, update on Demeter.vegetais to 'estoquista';
grant select, insert, update, delete on Demeter.pedido to 'vendedor';
grant select on Demeter.* to 'relatorios';

-- Criação de usuários e atribuindo as roles.
create user 'username_gerenciador'@'localhost' identified by 'g3r#nc!Ad0r';
create user 'username_estoquista'@'localhost' identified by '3stOqu!sta';
create user 'username_vendedor'@'localhost' identified by 'v3nd#d0R';
create user 'user_relatorios'@'localhost' identified by 'r3L4t0r!0s';
grant 'gerenciador' to 'username_gerenciador'@'localhost';
grant 'estoquista' to 'username_estoquista'@'localhost';
grant 'vendedor' to 'username_vendedor'@'localhost';
grant 'relatorios' to 'user_relatorios'@'localhost';
