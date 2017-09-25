## PART1: INSTAL·LACIÓ SGBD MySQL Percona

**1. Instal·lació**  
* **Instal·lar el repositori de Percona:**  
*yum install http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm*  
  
* **Comprovar que els paquets necessaris estan en el repositori:**  
*yum list | grep percona*

* **Instal·lar Percona-Server:**  
*yum install Percona-Server-server-57*  

* **Arrencar el servei ja que no s'ha activa automàticament**  
*systemctl start mysql*  

* **Comprovar que el servei està en funcionament**  
*systemctl status mysql*  

<br>


**1.1 Securització**  
Executar la comanda:  
*mysql_secure_installation*  

![SECURITZACIÓ1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/securitzacio1.png)  
![SECURITZACIÓ2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/securitzacio2.png)

<br>


**2. Instruccions per arrancar / verificar status / apagar servei de la base de dades de Percona Server:**
	
	 ARRENCAR SERVEI			systemctl start mysql
	 VERIFICAR STATUS SERVEI		systemctl status mysql
	 APAGAR SERVEI				systemctl stop mysql  

<br>


**3. Ubicacio fitxer de configuració del SGBD Percona Server:**  
*/etc/my.cnf*  

<br>


**4. Ubicacio fitxers de dades:**  
*/var/lib/mysql*  

![COMPROVACIÓ](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/ubicació_per_defecte_fitxers_de_dades.PNG)

<br>


**5. Conexió mysql sense usuari ni contrasenya**
* **Crear el fitxer .my.cnf a la carpeta personal de l’usuari asix:**  
*/asix/.my.cnf*

* **Donar permisos al fitxer perquè només nosaltres y tinguem accés:**  
*chmod 600 .my.cnf*

* **Afegir les següents línies**  
*[client]  
password="patata"*  

![my.cnf](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/my.cnf.PNG)

<br>

* **Assignar el fitxer per defecte on buscarà la contrasenya**  
*mysql --defaults-file=/home/asix/.my.cnf*


![connexió_mysql](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/connexió_mysql_sense_usuari_ni_contrasenya.PNG)

<br>


**6. Canviar port mysqld**
* Editar fitxer configuració ***/etc/my.cnf***
* Afegir la següent línia: ***port=33306***
* Executar la següent comanda per reiniciar el servei: ***service mysqld restart***  

<br>
<br>
<br>
<br>


## PART2: INSTAL·LACIÓ SGBD MySQL 
**1. Instal·lació**  
* **Descarregar el fitxer mysql**  
*wget https://dev.mysql.com/get/archives/mysql-5.7/mysql-5.7.14.tar.gz*
