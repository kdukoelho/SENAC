-- --> Alterando a estrutura da tabela para o recebimento de caracteres com 4 bytes.
alter table usuario
change senha senha varbinary(255);

-- --> Inserindo dados na tabela e criptografando a coluna de senha.
insert into usuario (id, login, senha, ultimo_login)
values 
	(1, 'admin', aes_encrypt('12345', 'amazonia'),'2022-01-10 10:00:00'),
	(2, 'gerencia',aes_encrypt('67890', 'amazonia'),'2022-01-10 10:00:00'),
	(3, 'dev', aes_encrypt('1q2w3e', 'amazonia'),'2022-01-10 10:00:00'),
	(4, 'silvioc', aes_encrypt('sil123', 'amazonia'),'2022-01-10 10:00:00'),
	(5, 'amarov', aes_encrypt('ama123', 'amazonia'),'2022-01-10 10:00:00'),
	(6, 'marcosv', aes_encrypt('mar123', 'amazonia'),'2022-01-10 10:00:00'),
	(7, 'domingass', aes_encrypt('dom123', 'amazonia'),'2022-01-10 10:00:00'),
	(8, 'marinaf', aes_encrypt('mar123', 'amazonia'),'2022-01-10 10:00:00'),
	(9, 'joanaf', aes_encrypt('joa123', 'amazonia'),'2022-01-10 10:00:00'),
	(10, 'apariciod', aes_encrypt('apa123', 'amazonia'),'2022-01-10 10:00:00'),
	(11, 'filomenal', aes_encrypt('fil123', 'amazonia'), '2022-01-10 10:00:00');

-- --> Visualizando os dados e decriptando a senha.
select *, cast(aes_decrypt(senha, 'amazonia') as char(50)) as 'senha decriptada' from usuario;
