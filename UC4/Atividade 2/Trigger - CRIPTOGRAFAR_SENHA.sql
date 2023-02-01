USE `uc4atividades`;
DROP trigger IF EXISTS `uc4atividades`.`CRIPTOGRAFAR_SENHA`;
;

DELIMITER $$
use `uc4atividades`$$
create trigger CRIPTOGRAFAR_SENHA before insert on usuario
for each row
BEGIN
set new.senha = md5(new.senha);
END$$
DELIMITER ;;
