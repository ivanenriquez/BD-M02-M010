
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

![CONFIGURACIO_MYSQL](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Captura2.JPG)  

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

![MASTER_BACKUP.SQL](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Captura8.JPG)  

<br>

***SLAVE***  

* Parar el servei  

***systemctl stop mysql***  

<br>
<br>
<br>
<br>



### REPLICACIÓ VIA GTID


<br>
<br>
<br>
<br>
