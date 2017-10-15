## CONFIGURACIÓ SGBD  

**1. Creació del fitxer de configuració:**  
* **Comprovar els logs activats per defecte:**  

*SHOW GLOBAL VARIABLES LIKE '%log%';*  

![LOGS_PER_DEFECTE1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/logs_activats_perdefecte.PNG)  

![LOGS_PER_DEFECTE2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/logs_activats_perdefecte2.PNG)  


* **Activar els logs**  
Editar el fitxer ***/etc/percona-server.conf.d/mysql.cnf***. Afegir les següents línies:  

*server_id=master-01  
log_bin=1  
general_log=1  
slow_query_log=1*  

![ACTIVAR_LOGS](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/activar_logs.PNG)  

Un cop fet això reiniciar el servei:  
*systemctl restart mysql*  


**RUTES:**  
log_bin:         ***/var/lib/mysql/asix2-bin***  
slow_query_log:  ***/var/lib/mysql/asix2-slow.log***  
general_log:     ***/var/lib/mysql/asix2.log***  

<br>


**2. Comprovar l'estat dels logs**  

Executar ***SHOW GLOBAL VARIABLES LIKE '%log%;***  

![ESTAT_LOGS1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/estat_logs.PNG) 

![ESTAT_LOGS2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/estat_logs2.PNG)  

<br>


**3. Desactivar els logs**  

Editar el fitxer ***/etc/percona-server.conf.d/mysqld.cnf***  
Posar els logs a ***0***  

![DESACTIVAR_LOGS](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/desactivar_logs.PNG)  

Reiniciar el servei:  
*systemctl restart mysql*  

<br>


**4. Activar els logs en temps d'execució**  

general_log = ***SET GLOBLAL general_log=ON***  
slow_query_log = ***SET GLOBAL slow_query_log=ON***  

El log de binary (log_bin) no és pot activar en temps d’execució perquè és una variable de només lectura. Per tant s’ha d’activar cambiant **0** per **1** des del fitxer de configuració /etc/percona-server.conf.d/mysqld.cnf com s’ha fet anteriorment en el pas 1.  

* Canviar el destí de general_log:  

*SET GLOBAL log_output='TABLE';*  

Es registra a la taula mysql.general_log.  

![LOG_OUTPUT](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/log_output.PNG)  

![MYSQL.GENERAL_LOG](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/taula_mysql.general_log.PNG)  

<br>


**5. Carregar BD Sakila**  

*SOURCE sakila-schema.sql;*  

![SOURCE_SAKILA](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/source1.PNG)  

![SAKILA](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/sakila.PNG)  

<br>


**6. Número sentencies 'CREATE TABLE' dins del general_log**  

SELECT COUNT (*)
      FROM mysql.general_log
   WHERE ARGUMENT LIKE 'CREATE TABLE%';  
   
![COUNT_CREATE_TABLE](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/COUNT_CREATE_TABLE.PNG)  

<br>


**7. Query mitjançant la funció SLEEP(11) registrada en el log slow_query_log**  

*SELECT SLEEP(11)*  

![SELECT_SLEEP](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/select_sleep.PNG)  


*cat /var/lib/mysql/asix2-slow.log*  

![SLOW_QUERY_LOG1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/slow_query_log1.PNG)  

![SLOW_QUERY_LOG2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/slow_query_log2.PNG)  

<br>


**8. Activar log_bin y borrar els logs anteriors amb 'RESET MASTER'**  

![LOG_BIN_ACTIVAT](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/binary_activat.PNG)  

![RESET_MASTER](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/reset_master.PNG)  


* **Crear i borrar una base dades amb nom foo**  

Crear base dades: ***CREATE DATABASE foo;***  
Borrar base dades: ***DROP DATABASE foo;***  

![foo](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/foo.PNG)  


* **Llistar els events i comprovar en quin fitxer log estan les sentències anteriors**  

*SHOW BINLOG EVENTS;*  

![SOW_BINLOG_EVENTS](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/binlog_events1.PNG)  

![MYSQLBINLOG](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/1.000001.PNG)  


* **Realitzar un rotate log**  

*FLUSH LOGS;*  

![FLUSH_LOGS](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/flush_logs.PNG)  


* **Crear i borrar una base dades amb nom bar**  

Crear base dades: ***CREATE DATABASE bar;***  
Borrar base dades: ***DROP DATABASE bar;***  

![bar](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/bar.PNG)  


* **Llistar els fitxers de logs**  


* **Borrar el primer binary log**  

![BORRAR_PRIMER_BINARY_LOG](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/borrar_primer_binary_log.PNG)  


* **Mostrar el contingut del fitxer mysql.bin.000002**  

*mysqlbinlog /var/lib/mysql/0.000002*  

![mysql.bin.000002](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/000002.PNG)  


* **Número d'event de la creació de la base dades bar**  

*mysqlbinlog /var/lib/mysql/0.000002*  

Número d'event: 219  

![NÚMERO_EVENT](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/numero_event_bd-bar.PNG)  
