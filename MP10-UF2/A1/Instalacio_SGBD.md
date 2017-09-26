## PART1: INSTAL·LACIÓ SGBD MySQL Percona

**1. Instal·lació**  
* **Instal·lar el repositori de Percona:**  
*yum install http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm*  

![REPOSITORI1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/captura%20instalar%20repositori.JPG)  
![REPOSITORI2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/captura%20instalar%20repositori%201.JPG)
  
* **Comprovar que els paquets necessaris estan en el repositori:**  
*yum list | grep Percona-Server*  

![COMPROVAR_REPOSITORI1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/comprobar%20repositori%20percona.JPG)  
![COMPROVAR_REPOSITORI2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/comprobar%20repositori%20percona%201.JPG)

* **Instal·lar Percona-Server:**  
*yum install Percona-Server-server-57*  

![INSTAL·LAR1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/instalar%20percona%20server.JPG)  
![INSTAL·LAR2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/instalar%20percona%20server%202.JPG)  
![INSTAL·LAR3](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/instalar%20percona%20server%203.JPG)  

* **Arrencar el servei ja que no s'ha activa automàticament**  
*systemctl start mysql*  

![ARRENCAR_SERVEI](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/ARRENCAR_sERVEI.PNG)  

* **Comprovar que el servei està en funcionament**  
*systemctl status mysql*  

![ESTAT_SERVEI](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/ESTAT_SERVEI.PNG)

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
![/etc/my.cnf](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/ruta%20del%20arxiu%20de%20configuracio.JPG)

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

* **Extreure fitxer**  
*tar xzf mysql-5.7.14.tar.gz*  

* **Instal·lar el compilador cmake**
*yum install cmake cmake-gui*
