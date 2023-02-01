-- --> Criando usuários:

CREATE USER 'relatorios'@'localhost' identified by 'R&l4t0rios';
CREATE USER 'funcionario_pedro'@'localhost' identified by 'F#tfh1203!@';

-- --> Criando roles:

CREATE ROLE 'relatorio', 'funcionarios';

-- --> Dando permissões à roles:

GRANT INSERT, UPDATE, DELETE ON uc4atividades.venda TO 'funcionarios';
GRANT INSERT, UPDATE, DELETE ON uc4atividades.produto TO 'funcionarios';
GRANT INSERT, UPDATE, DELETE ON uc4atividades.cliente TO 'funcionarios';
GRANT SELECT ON uc4atividades.* to 'relatorio';
FLUSH PRIVILEGES;

-- --> Atribuindo as roles paras os usuário:
GRANT 'funcionarios' TO 'funcionario_pedro'@'localhost';
GRANT 'relatorio' TO 'relatorios'@'localhost';
FLUSH PRIVILEGES;
