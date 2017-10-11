## CONFIGURACIÓ SGBD  

**1. Creació del fitxer de configuració:**  
* **Comprovar els logs activats per defecte:**  
*SHOW GLOBAL VARIABLES LIKE '%log%';*  

![LOGS_PER_DEFECTE1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/logs_activats_perdefecte.PNG)  

![LOGS_PER_DEFECTE2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/logs_activats_perdefecte2.PNG)  

* **Activar els logs**  
Editar el fitxer */etc/percona-server.conf.d/mysql.cnf*. Afegir les següents línies:  

*server_id=master-01  
log_bin=1  
general_log=1  
slow_query_log=1*  

![ACTIVAR_LOGS](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A2/imatges/activar_logs.PNG)  

Un cop fet això reiniciar el servei:  
*systemctl restart mysql*  


RUTES:  
log_bin:         ***/var/lib/mysql/asix2-bin***  
slow_query_log:  ***/var/lib/mysql/asix2-slow.log***  
general_log:     ***/var/lib/mysql/asix2.log***  
