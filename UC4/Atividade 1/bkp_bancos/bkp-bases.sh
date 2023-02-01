# -- Variaveis de Ambiente ---
DATA=$(date +%Y-%m-%d_%H-%M)

# Diretorio local de backup.
PBACKUP="/MySQLBackup"

# Diretorio remoto de backup.
RBACKUP="/backup/dumps"

# Usuario e host de destino do repositório remoto.
SDESTINO="dumper@IP_remoto"
HOST=$(hostname)

# Envio de e-mail com a confirmacao do backup.
EMAIL=""

# Usuario dumper e a senha do servidor MySQL.
MUSER="dumper"
MSENHA=""

# -- LIMPEZA -- Excluindo arquivos com mais de 5 dias de existencia.
NDIAS="5"

if [ ! -d ${PBACKUP} ]; then
	echo ""
	echo " A pasta de backup nao foi encontrada!"
	mkdir -p ${PBACKUP}
	echo " Iniciando Tarefa de backup..."
	echo "" 
else
	echo ""
	echo " Rotacionando backups mais antigos que $NDIAS dias"
	echo ""
	find ${PBACKUP} -type d -mtime +$NDIAS -exec rm -rf {} \;
fi

# -- SCRIPT BACKUP --
echo "Iniciando o backup" |mutt -s "Backup $HOST Iniciado" $EMAIL # Enviando email para o administrador do DB.

if [ ! -d $PBACKUP/$DATA/mysql ]; then
        mkdir -p $PBACKUP/$DATA/mysql

fi
for basemysql in `/usr/bin/mysql -u $MUSER -p$MSENHA --execute="show databases;" |grep "uc4atividades"`; do
        /usr/bin/mysqldump -u $MUSER --password=$MSENHA --databases $basemysql > $PBACKUP/$DATA/mysql/$basemysql.txt
        cd $PBACKUP/$DATA/mysql/
        tar -czvf $basemysql.tar.gz $basemysql.txt		 
	sha1sum $basemysql.tar.gz > $basemysql.sha1
        rm -rf $basemysql.txt
	cd /
done

# -- REALIZANDO O BACKUP GERAL SEMANAL --
DAYOFWEEK=$(date +"%u")
if [ "${DAYOFWEEK}" -eq 7  ];  then
  /usr/bin/mysqldump -p -u ${MUSER} --password=${MSENHA} --all-databases  > ${PBACKUP}/${DATA}/mysql/mysql_tudo.txt
   cd ${PBACKUP}/${DATA}/mysql/
   tar -czvf mysql_tudo.tar.gz mysql_tudo.txt
   sha1sum mysql_tudo.tar.gz > mysql_tudo.sha1
   rm -f mysql_tudo.txt
fi

cd /

# - BACKUP USUARIOS -
/usr/bin/mysqldump -u $MUSER --password=$MSENHA --no-create-info  mysql user > $PBACKUP/$DATA/mysql/usuarios.sql

# - BACKUP GRANTS -
/usr/bin/mysql -u $MUSER --password=$MSENHA --skip-column-names -A -e"SELECT CONCAT('SHOW GRANTS FOR ''',user,'''@''',host,''';') FROM mysql.user WHERE user<>''" | mysql -u $MUSER --password=$MSENHA --skip-column-names -A | sed 's/$/;/g' > $PBACKUP/$DATA/mysql/grants.sql

# Copiar para o host de destino os dumps gerados localmente.
scp -o StrictHostKeyChecking=no -r $PBACKUP/$DATA $SDESTINO:${RBACKUP}/$HOST/
echo "Backup finalizado" |mutt -s "Backup $HOST Finalizado!" $EMAIL

exit 0
