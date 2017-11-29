
## REPLICACIÓ  



### REPLICACIÓ VIA BINLOG  

**CONFIGURACIÓ MASTER**  

* Fer una còpia del fitxer de configuració del MySQL ***/etc/percona-server.conf.d/configuracio_mysql.cnf***

![CP_CONFIGURACIO_MYSQL](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Captura1.JPG)  

<br>


* Editar el fitxer de configuració ***/etc/percona-server.conf.d/configuracio_mysql.cnf***  

Activar el paràmetre ***log-bin*** amb el nom <PRIMER LLETRA DEL NOM + 1r COGNOM>rep    
Verificar que el paràmetre ***server_id*** està activat amb un valor numèric  
Canviar el paràmetre ***innodb_log_buffer*** a ***10M***  
Canviar/afegir el paràmetre ***innodb_log_files_in_group*** a 2  

![CONFIGURACIO_MYSQL_MASTER](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Captura2.JPG)  

<br>


* Parar el servei  

***systemctl stop mysql***  

<br>


* Borrar els fitxers de log InnoDB del directori de dades de mysql ***/var/lib/mysql***  

***rm -rf mysql-bin.****  

<br>


* Arrencar el servei  

***systemctl start mysql***  

<br>


* Comprovar que s'ha aplicat la configuració de ***log-bin***  

![LOG-BIN](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Captura3.JPG)  

<br>


* Realitzar una instrucció DML  

![INSERT](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Captura4.JPG)  

<br>


* Mostrar el contingut del fitxer ***ienriquezrep.000001***  

***mysqlbinlog -v ienriquezrep.000001***

![mysqlbinlog](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Captura5.JPG)  


* Executar la comanda ***FLUSH LOGS***  

![FLUSH_LOGS](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Captura6.JPG)  

<br>


* Comprovar els logs com a master  

![MASTER_LOGS](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Captura7.JPG)  

<br>
<br>


**CONFIGURACIÓ SLAVE I MASTER**  

* IP de cadascuna de les màquines(master, slave)  

MASTER: 192.168.59.2  
SLAVE: 192.168.59.3  

<br>


* Crear un backup de la BD a la màquina master  

***mysqldump –-user=root –-password=vostrepwd -–master-data=2 sakila > /tmp/master_backup.sql***  

<br>


* Editar el fitxer ***master_backup.sql*** i buscar la línia ***--CHANGE MASTER TO*** amb els valors ***MASTER_LOG_FILE*** i ***MASTER_LOG_POS***  

![MASTER_BACKUP.SQL](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/master_backup.JPG)  

<br>


***SLAVE***  

* Parar el servei  

***systemctl stop mysql***  

<br>


* Editar el fitxer de configuració ***/etc/percona-server.conf.d/configuracio_mysql.cnf***  

Assignar un valor numèric al paràmetre ***server_id*** diferent del master. En aquest cas el master té assignat el valor ***1*** i el slave el valor ***2***  

![CONFIGURACIO_MYSQL_SLAVE](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Mysql%20Conf%20Slave.PNG)  

<br>


* Arrencar el servei  

***systemctl start mysql***  

<br>


***MASTER***  

* Crear l'usuari ***slave*** amb la ip de la màquina slave  

![CREATE_USER_BINLOG](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Captura10.JPG)  

<br>


* Assignar-li el permís de replicació  

![GRANT_SLAVE_BINLOG](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/permisos_usuari.JPG)  

<br>


* Executar la següent comanda a la màquina slave per connectar-la a la màquina master amb les dades que trobem a l'arxiu ***/tmp/master_backup.sql*** de backup que hem realitzat anteriorment. En aquest cas els valors dels paràmetres ***MASTER_LOG_FILE*** i ***MASTER_LOG_POS*** són ***ienriquezrep.000008*** i ***154***  

![CONNECT_SLAVE_TO_MASTER_BINLOG](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Slave%20Connect.PNG)  

<br>


* Iniciar la replicació executant la següent comanda  

***START SLAVE***  

<br>


* Comprovar que el slave està actiu i connectat correctament al master per realitzar la replicació  

![SHOW_SLAVE_STATUS_BINLOG](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Show%20Status%20Slave.PNG)  

<br>


* Comprovar que la replicació s'efectua correctament  

***MASTER***  

Realitzar una instrucció DML en el servidor master  

![INSERT_MASTER_BINLOG](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Captura13.JPG)  

<br>


***SLAVE***  

* Comprovar que les dades introduïdes des del master s'han replicat correctament  

![SELECT_ACTOR_SLAVE_BINLOG](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Select%20Actors%20Slave.PNG)  

![MYSQLD_LOG_BINLOG](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/mysqld_log.PNG)  


<br>
<br>
<br>
<br>



### REPLICACIÓ VIA GTID


<br>
<br>
<br>
<br>
