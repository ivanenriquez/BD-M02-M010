## STORAGE ENGINES MySQL  



### ACTIVITAT 1  

**1. Motors d'emmagatzematge que estan instal·lats:**  

***SHOW ENGINES;***  

![ENGINES1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ex1.PNG)  

<br>


**2. Canviar el motor d'emmagatzematge per defecte:**  

* Editar el fitxer de configuració ***/etc/percona-server.conf.d/configuracio_mysql.cnf***  

Afegir la següent línia:  

![ENGINES2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ex2.1.PNG)  

Un cop fet això reiniciar el servei:  
***systemctl restart mysql***  

Comprovacions de que s'ha efectuat el canvi:  

***SHOW ENGINES;**  
![ENGINES3](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ex2.3.PNG)  

Crear una base dades y dins d'aquesta una taula per comprovar que es crea amb el motor MyISAM

***USE prova***
***SHOW TABLE STATUS;**  
![ENGINES4](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/show%20table%20status.JPG)  

<br>


**3. Motor d'emmagatzematge per defecte**  

FORMA1:

***SHOW ENGINES;***
![SHOW_ENGINES](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ex2.3.PNG)  

FORMA2:  
![INFORMATION_SHEMA1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ex3_forma2.1.PNG)  

***SELECT * FROM engines WHERE SUPPORT='DEFAULT';***  
![INFORMATION_SCHEMA2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ex3_forma2.PNG)  

<br>


**4. Instal·lar i activar l'engine MyRocks**  

* Instal·lar el paquet corresponent:  

***yum install Percona-Server-rocksdb-57.x86_64***  
![INSTAL·LAR_MyRocks](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/instalar%20percona-server.JPG)  


* Activar MyRocks:

***ps-admin --enable-rocksdb -u root -ppatata***  
![ACTIVAR MyRocks](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/habilitar%20rocks%20db.JPG)  


* Comprovació:

***SHOW ENGINES;***  
![MyRocks](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/comprovacio%20rocks.JPG)  

<br>


**5. Importar la BD sakila creant les taules amb el motor MyISAM**  

***SHOW TABLE STATUS FROM SAKILA;***  
![SAKILA1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ex5.1.PNG)  

***ls -ls /var/lib/mysql/sakila***  
![SAKILA2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ex5.2.PNG)  
![SAKILA2.1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ex5.2.1.PNG)  
