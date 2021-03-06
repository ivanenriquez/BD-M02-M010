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

***SHOW ENGINES;***  
![ENGINES3](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ex2.3.PNG)  

Crear una base dades y dins d'aquesta una taula per comprovar que es crea amb el motor MyISAM

***USE prova***  
***SHOW TABLE STATUS;***  
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

***SHOW TABLE STATUS FROM sakila;***  
![SAKILA1_MYISAM](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ex5.1.PNG)  

***ls -ls /var/lib/mysql/sakila***  
![SAKILA2_MYISAM](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ls%20sakila.PNG)  

<br>
<br>
<br>
<br>



### ACTIVITAT 2. INNODB PART1  

**1. Importar la BD sakila creant les taules amb el motor InnoDB**  

***SHOW TABLE STATUS FROM sakila;***  
![SAKILA1_INNODB](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ex1-activitat2PNG.PNG)  

<br>


**2. Fitxers de dades**  

***ls -ls /var/lib/mysql***  
![SAKILA2_INNODB](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ex2-activitat2PNG.PNG)  

<br>


**3. Canviar configuració MySQL**  

* Deshabilitar SELINUX:  
	* Editar el fitxer ***/etc/sysconfig/selinux***, i escriure ***selinux=disabled***  

![SELINUX1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/selinux.PNG)  


* Comprovar que ***selinux*** s'ha desactivat:  

![SELINUX2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/selinux2.PNG)  


* Editar el fitxer de configuració ***/etc/percona-server.conf.d/configuracio_mysql.cnf*** i afegir les següents línies:  

![INNODB_FILE_PATH](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/innodb_file_path.PNG)  


* Crear els directoris i donar els permisos corresponents:  

![/discs-mysql](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/carpeta%20discs-mysql.PNG)  
![/discs-mysql/disk1,disk2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/discs-msyql%2Cdisks.PNG)  


* Eliminar els fitxer redolog ***ib_logfile0, ib_logfile1*** ubicats a ***/var/lib/mysql***  

![ib_logfile](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ib_logfile.PNG)  


* Reiniciar el servei:  

***systemctl restart mysql***  

<br>
<br>
<br>
<br>



### ACTIVITAT 3. INNODB PART2  

* Crear els directoris i donar els permisos corresponents:  

![/tspaces](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/crear_tspaces.PNG)  


* Editar el fitxer de configuració ***/etc/percona-server.conf.d***  

Comentar les línies de ***innodb*** i posar a ***1 innodb_file_per_table***  

![crear_tspaces](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/innodb_file_per_table.PNG)  


* Editar el fitxer de configuració ***/etc/percona-server.conf.d/mysqld.cnf***  

Canviar el directori de dades per defecte de mysql ***datadir=/tspaces/***  

![datadir](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/datadir.PNG)  


* Copiar els arxius de ***/var/lib/mysql*** a ***/tspaces/***  

***cp -a /var/lib/mysql/. /tspaces/***  

![copiar_arxius_a_tspaces](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/copiar_arxius_a_tspaces.PNG)  


* Comprovar que s'ha efectuat el canvi de directori de dades per defecte:  

***SELECT @@datadir***  

![@@datadir](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/%40%40datadir.PNG)  

<br>
<br>
<br>
<br>



### ACTIVITAT 4. INNODB PART3  

* Crear un tablespace anomenat ***ts1*** situat a ***/discs-mysql/disk1*** i afegir-hi les taules ***actor, address i category***  

***USE sakila;
CREATE TABLESPACE `ts1`  
ADD DATAFILE '/discs-mysql/disk1/ts1.ibd'  
ENGINE=InnoDB;  
ALTER TABLE actor TABLESPACE ts1;  
ALTER TABLE address TABLESPACE ts1;  
ALTER TABLE category TABLESPACE ts1;***  

![ts1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ts1.PNG)  


* Crear un tablespace anomenat ***ts2*** situat a ***/discs-mysql/disk2*** i afegir-hi la resta de taules***  

***USE sakila;  
CREATE TABLESPACE `ts2`  
ADD DATAFILE '/discs-mysql/disk2/ts2.ibd'  
ENGINE=InnoDB;***  

***ALTER TABLE city TABLESPACE ts2;  
ALTER TABLE country  TABLESPACE ts2;  
ALTER TABLE customer TABLESPACE ts2;  
ALTER TABLE film TABLESPACE ts2;  
ALTER TABLE film_actor TABLESPACE ts2;  
ALTER TABLE film_category TABLESPACE ts2;  
ALTER TABLE film_text TABLESPACE ts2;  
ALTER TABLE inventory TABLESPACE ts2;  
ALTER TABLE language TABLESPACE ts2;  
ALTER TABLE payment TABLESPACE ts2;  
ALTER TABLE rental TABLESPACE ts2;  
ALTER TABLE staff TABLESPACE ts2;  
ALTER TABLE store TABLESPACE ts2;***  

![ts2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ts2.PNG)  


* Instruccions DML  

***ts1***  

***USE sakila;  
INSERT INTO actor(first_name, last_name)  
	VALUES("david","ruiz");***  

![INSERT_INTO_TS1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/insert_into_ts1.PNG)  


***ts2***  

***USE sakila;  
INSERT INTO country(country)  
	VALUES("Espanya");***  

![INSERT_INTO_TS2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/insert_into_ts2.PNG)  

<br>
<br>
<br>
<br>



### ACTIVITAT 5. REDOLOG  

**1. Comprovar *Innodb Log Checkpointing***  

***SHOW ENGINE INNODB STATUS\G***  
  
  **1.1 LSN (Log Sequence Number)** 
  
  ![LSN1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/lsn.PNG)  
  
  **1.2 Últim LSN actualitzat a disc**  
  
  ![LSN2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/lsn_disk.PNG)  
  
  **1.3 Últim LSN que se li ha fet Checkpoint**  
  ![LSN3](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/last_checkpoint.PNG)  

**3. Pàgines modificades (dirty pages) i total pàgines**  

![DIRTY_PAGES](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/dirty_pages.PNG)  

<br>
<br>
<br>
<br>



### ACTIVITAT 6. IMPLEMENTAR BD DISTRIBUÏDES  

* Configuració firewall servidor1:  

![FIREWALL1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/configuració_firewall.PNG)  


**(EN EL SERVIDOR 1 LES TAULES JA ESTAN CREADES)**  


**OPCIÓ1**  

***Servidor2 (FEDERATED)***  

* Crear una taula:  

***USE sakila;  
CREATE TABLE actor (  
	  actor_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,  
	  first_name VARCHAR(45) NOT NULL,  
	  last_name VARCHAR(45) NOT NULL,  
	  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  
	  PRIMARY KEY  (actor_id),  
	  KEY idx_actor_last_name (last_name)  
	)  
ENGINE=FEDERATED  
CONNECTION='mysql://root:patata@192.168.109.144:3306/sakila/actor';***  

![FEDERATED1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/Captura1.PNG)  

<br>

***Servidor1***  

* Inserir dades:  

***INSERT INTO actor (first_name,last_name)  
VALUES ('ivan','enriquez');***  

![INSERT1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/Captura2.PNG)  

<br>

***Servidor2 (FEDERATED)***  

* Mostrar les dades:  

![SELECT1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/select1_servidor2.PNG)  

<br>

**OPCIÓ2**  

***Servidor2***  

* Crear una connexió:  

***CREATE SERVER connexio1  
FOREIGN DATA WRAPPER mysql  
OPTIONS (USER 'root', PASSWORD 'patata', HOST '192.168.109.144', PORT 3306, DATABASE 'sakila');***  

![CREATE_SERVER](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/Captura3.PNG)  


* Crear una taula:  

***USE sakila;  
CREATE TABLE country (  
  country_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,  
  country VARCHAR(50) NOT NULL,  
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  
  PRIMARY KEY  (country_id)  
)  
ENGINE=FEDERATED  
CONNECTION='connexio1/country';***  

![FEDERATED2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/Captura4.PNG)  


* Inserir dades:  

***INSERT INTO country (country)  
VALUES ('Franca');***  

![INSERT2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/Captura5.PNG)  

<br>

***Servidor1***  

* Mostrar les dades: 

![SELECT2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/select2_servidor2.PNG)  

<br>
<br>
<br>
<br>



### ACTIVITAT 7. STORAGE ENGINE CSV  

**CONFIGURACIONS**  

No cal fer cap configuració ja que csv storage engine està activat per defecte en MySQL.  


**DDL**  

***CREATE TABLE actor (  
	  actor_id SMALLINT UNSIGNED NOT NULL,  
	  first_name VARCHAR(45) NOT NULL,  
	  last_name VARCHAR(45) NOT NULL,  
	  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	  
	)ENGINE=CSV;***  
	
![DDL_CSV](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/ddl_csv.PNG)  


**DML**  

***INSERT INTO actor (actor_id,first_name,last_name)
VALUES (10001,'ivan','enriquez');***  

![INSERT_CSV](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/dml_csv.PNG)  


**FITXER CSV**  

![FITXER_CSV](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A3/imatges/fitxer_csv.PNG)  
