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
* **Iniciar sessió com a root, la contrasenya del qual es troba en el fitxer /var/log/mysqld.log, és una contrasenya temporal que crea mysql**  
*grep 'temporary password' /var/log/mysqld.log*  

![ROOT_PASSWORD](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/root_password.PNG)  
  
* **Un cop dins de mysql, cambiar la contrasenya per defecte de l'usuari root per una que compleixi els requisits de complexitat**  
*ALTER USER 'root'@'localhost' IDENTIFIED BY 'Contrasenya509*';*  

![CONTRASENYA_ROOT](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/canviar%20la%20contra%20per%20defecte.JPG)  

* **Desinstalar el plugin validate_password per treure la complexitat de les contrasenyes**  
*uninstall plugin validate_password;*  

![COMPLEXITAT_CONTRASENYES](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/desinstalar%20el%20plugin%20de%20validate_password.JPG)  
  
* **Realitzar la securització**  
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


## PART2: INSTAL·LACIÓ SGBD MongoDB 
**1. Instal·lació**  
* **Crear arxiu del repositori**  
*nano /etc/yum.repos.d/mongodb-org-3.4.repo*  

![REPOSITORI](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/arxiu%20repositori.PNG)  

* **Afegir les següents línies**  

![CONTINGUT_ARXIU_REPOSITORI](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/contingut_arxiu_repositori.PNG)  

* **Instal·lar MongoDB**  
*yum install -y mongodb-org*  

![INSTAL·LACIÓ2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/instal·lació2.PNG)

![INSTAL·LACIÓ1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/instal·lació1.PNG)  

* **Deshabilitar el mòdul de seguretat selinux**
Editar fitxer */etc/selinux/config*  
*nano /etc/selinux/config*  
Canviar *SELINUX=enforcing* per *SELINUX=disabled*, un cop fet això reiniciar el sistema  

![SELINUX=disabled](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/selinux%3Ddisabled.PNG)  


* **Iniciar servei de MongoDB**  
*service mongodb start*  

![INICIAR_MONGODB](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/iniciar%20servei.PNG)  

* **Verificar que el servei s'ha iniciat correctament**
*cat /var/log/mongodb/mongod.log*
![VERIFICAR_SERVEI1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/verificar%20estat%20mongodb1.PNG)

Si tot ha estat correcte l'última línia d'aquest log hauría de ser la següent:
*waiting for connections on port 27017*, on el port és el que està configurat per defecte a l'arxiu */etc/mongod.conf*  

![VERIFICAR_SERVEI2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/verificar%20estat%20mongodb2.PNG
