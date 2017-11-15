
## REPLICACIÓ  



### REPLICACIÓ VIA BINLOG  

**CONFIGURACIÓ MASTER**  

* Fer una còpia del fitxer de configuració del MySQL ***/etc/percona-server.conf.d/configuracio_mysql.cnf***

![CP_CONFIGURACIO_MYSQL](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Captura1.JPG)  


* Editar el fitxer de configuració ***/etc/percona-server.conf.d/configuracio_mysql.cnf***  

Activar el paràmetre ***log-bin*** amb el nom <PRIMER LLETRA DEL NOM + 1r COGNOM>rep    
Verificar que el paràmetre ***server_id*** està activat amb un valor numèric  
Canviar el paràmetre ***innodb_log_buffer*** a ***10M***  
Canviar/afegir el paràmetre ***innodb_log_files_in_group*** a 2  

![CONFIGURACIO_MYSQL](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Captura2.JPG)  


* Parar el servei  

***systemctl stop mysql***  


* Borrar els fitxers de log InnoDB del directori de dades de mysql ***/var/lib/mysql***  

***rm -rf mysql-bin.***  


* Arrencar el servei  

***systemctl start mysql***  


* Comprovar que s'ha aplicat la configuració de log-bin  

![LOG-BIN](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A4/Imatges/Captura3.JPG)  

<br>
<br>
<br>
<br>



### REPLICACIÓ VIA GTID


<br>
<br>
<br>
<br>
