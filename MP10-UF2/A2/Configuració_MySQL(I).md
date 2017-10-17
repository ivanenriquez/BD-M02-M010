## CONFIGURACIÓ SGBD  



### CONFIGURACIÓ I COMPROVACIÓ DE LOGS

**1. Creació del fitxer de configuració:**  
* Comprovar els logs activats per defecte:  

***SHOW GLOBAL VARIABLES LIKE '%log%';***  

![LOGS_PER_DEFECTE1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/logs_activats_perdefecte.PNG)  

![LOGS_PER_DEFECTE2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/logs_activats_perdefecte2.PNG)  


* Activar els logs  
Crear un fitxer de configuració i afegir les següents línies (està ubicat a ***/etc/percona-server.conf.d/***):  

![ACTIVAR_LOGS](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/crear_fitxer_configuracio.PNG)  


Crear el directori */var/lib/mysql/logs*: ***mkdir /var/lib/mysql/logs***  

Canviar els permisos i el propietari del fitxer de configuració ***/etc/percona-server.conf.d/configuracio_mysql.cnf***:  

Canviar permisos: ***chmod –R 644 /etc/percona-server.conf.d/configuracio_mysql.cnf***  
Canviar propietari: ***chown –R mysql:mysql /etc/percona-server.conf.d/configuracio_mysql.cnf***  

![CAMBIAR_PERMISOS_FITXER_CONFIGURACIO](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/permisos_fitxer_configuracio.PNG)  

Canviar els permisos i el propietari al directori dels logs i els fitxers que hi hauràn en aquest:  

Canviar permisos: ***chmod –R 750 /var/lib/mysql/logs***  
Canviar propietari: ***chown –R mysql:mysql /var/lib/mysql/logs***  

![CAMBIAR_PERMISOS_CARPETA_LOGS](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/permisos_carpeta_logs.PNG)  

Afegir el fitxer de configuració a **/etc/my.cnf**, en aquest cas el directori on està ubicat el fitxer ja està assignat dins ***/etc/my.cnf***:  

![/etc/my.cnf](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/my.cnf.PNG)  

Un cop fet això reiniciar el servei:  
***systemctl restart mysql***  


**RUTES:**  
log_bin:         ***/var/lib/mysql/mysql-bin***  
slow_query_log:  ***/var/lib/mysql/logs/general.log***  
general_log:     ***/var/lib/mysql/logs/slow_query.log***  

<br>


**2. Comprovar l'estat dels logs**  

Executar ***SHOW GLOBAL VARIABLES LIKE '%log%';***  

![ESTAT_LOGS1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/VARIABLES1.PNG)   

![ESTAT_LOGS2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/VARIABLES2.PNG)  

<br>


**3. Desactivar els logs**  

![DESACTIVAR_LOGS](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/ex3-desactivarlogs.PNG)  

Reiniciar el servei:  
***systemctl restart mysql***  

<br>


**4. Activar els logs en temps d'execució**  

general_log = ***SET GLOBLAL general_log=ON***  
slow_query_log = ***SET GLOBAL slow_query_log=ON***  

El log de binary (log_bin) no és pot activar en temps d’execució perquè és una variable de només lectura. Per tant s’ha d’activar des del fitxer de configuració ***/etc/percona-server.conf.d/configuracio_mysql.cnf*** com s’ha fet anteriorment en el pas 1.  

* Canviar el destí de general_log:  

***SET GLOBAL log_output='TABLE';***  

Es registra a la taula mysql.general_log.  

![LOG_OUTPUT](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/log_output.PNG)  

![MYSQL.GENERAL_LOG](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/taula_mysql.general_log.PNG)  

<br>


**5. Carregar BD Sakila**  

***SOURCE sakila-schema.sql;***  

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

***SELECT SLEEP(11);***  

![SELECT_SLEEP](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/select_sleep.PNG)  


***SELECT * FROM slow_log;***  

![SLOW_QUERY_LOG](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/slow_log.PNG)  

<br>


**8. Activar log_bin y borrar els logs anteriors amb 'RESET MASTER'**  

![LOG_BIN_ACTIVAT](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/log_bin.PNG)  

![RESET_MASTER](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/reset_master.PNG)  


* Crear i borrar una base dades amb nom foo  

Crear base dades: ***CREATE DATABASE foo;***  
Borrar base dades: ***DROP DATABASE foo;***  

![foo](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/foo.PNG)  


* Llistar els events i comprovar en quin fitxer log estan les sentències anteriors  

***SHOW BINLOG EVENTS;***  

![SOW_BINLOG_EVENTS](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/show_binlog_events.PNG)  

![MYSQLBINLOG](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/foo_in_log.PNG)  


* Realitzar un rotate log  

***FLUSH LOGS;***  

![FLUSH_LOGS](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/flush_logs.PNG)  


* Crear i borrar una base dades amb nom bar  

Crear base dades: ***CREATE DATABASE bar;***  
Borrar base dades: ***DROP DATABASE bar;***  

![bar](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/bar.PNG)  


* Llistar els fitxers de logs  

***SHOW MASTER LOGS;***  

![SHOW_MASTER_LOGS](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/SHOW_MASTER_LOGS.PNG)  


* Borrar el primer binary log  

![BORRAR_PRIMER_BINARY_LOG](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/purge_master_logs.PNG)  


* Mostrar el contingut del fitxer mysql.bin.000004  

***mysqlbinlog /var/lib/mysql/mysql-bin.000004***  

![mysql-bin.000004](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/mysql-bin.000004.PNG)  


* Número d'event de la creació de la base dades bar  

***mysqlbinlog /var/lib/mysql/0.000004***  

Número d'event: 219  

![NÚMERO_EVENT](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/mysql-bin.000004-event.PNG)  

<br>
<br>
<br>
<br>



## CONFIGURACIÓ DEL SERVIDOR PERCONA-SERVER PER REALITZAR CONNEXIONS SEGURES SOBRE SSL  

* Generar els certificats  

Certificats del servidor:

![CERTIFICAT1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/1.PNG)  

![CERTIFICAT2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/2.PNG)  

![CERTIFICAT3](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/3.PNG)  


Certificats del client:  

![CERTIFICAT4](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/4.PNG)  

![CERTIFICAT5](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/5.PNG)  


* Verificar els certificats  

![CERTIFICAT6](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/6.PNG)  


* Copiar els fitxers ***client-cert.pem***, ***ca.pem***, ***client-key.pem***

![CERTIFICAT7](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/13.PNG)  


* Reiniciar el servei  

![CERTIFICAT8](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/7.PNG)


* Editar el fitxer ***/etc/percona-server.conf.d/configuracio_mysql.cnf***  
Afegir les següents línies sota l'apartat ***[mysqld]***  

![SSL_SERVER](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/8.PNG)  


* Reiniciar el servei  

![CERTIFICAT8](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/7.PNG)  


* Crear un usuari per només permetre la connexió SSL  

![CREAR_USUARI](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/ssl3.PNG)  

![PERMISOS_USUARI](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/ssl3.2.PNG)  

