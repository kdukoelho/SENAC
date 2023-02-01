use hospital;

insert into tipo_quarto values
('1', 'apartamento', '400'),
('2', 'quarto duplo', '200'),
('3', 'enfermaria', '500');

insert into convenios values
(null, 'Premiere', '34754566000120', '30 dias'),
(null, 'Portal', '75594567000132', '30 dias'),
(null, 'Lux', '34267202000116', '70 dias'),
(null, 'Genuíno', '63343672000110', '60 dias'),
(null, 'São Francisco', '86525836000125', '85 dias');

insert into especialidades values 
(null, 'pediatria'), (null, 'gastroenterologia'), (null, 'dermatologia'),
(null, 'clinica geral'), (null, 'proctologia'), (null, 'otorinolaringologia'), 
(null, 'endocrinologia');