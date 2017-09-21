## PART1: INSTAL·LACIÓ SGBD MySQL Percona

**1. Instal·lació**  
* **Instal·lar el repositori de Percona:**  
*yum install http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm*  
  
* **Comprovar que els paquets necessaris estan en el repositori:**  
*yum list | grep percona*

* **Instal·lar Percona-Server:**  
*yum install Percona-Server-server-57*  

* **Arrencar el servei ja que no s'ha activa automàticament**  
*service mysql start*  

* **Comprovar que el servei està en funcionament**  
*service mysql status*  

<br>


**1.1 Securització**  


<br>


**2. Instruccions per arrancar / verificar status / apagar servei de la base de dades de Percona Server:**
	
	 ARRENCAR SERVEI			service mysql start
	 VERIFICAR STATUS SERVEI		service mysql status
	 APAGAR SERVEI				service mysql stop  

<br>


**3. Ubicacio fitxer de configuració del SGBD Percona Server:**  
*/etc/my.cnf*  

<br>


**4. Ubicacio fitxers de dades:**  
*/var/lib/mysql*  

![COMPROVACIÓ](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/ubicació_per_defecte_fitxers_de_dades.PNG)

<br>


**5. Conexió mysql sense usuari ni contrasenya**
* Crear el fitxer .my.cnf a la carpeta personal de l’usuari asix:  
*/asix/.my.cnf*

* Donar permisos al fitxer perquè només nosaltres y tinguem accés:  
*chmod 600 .my.cnf*

* Afegir les següents línies  
*[client]  
password="patata"*  

![my.cnf](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/my.cnf.PNG)

![connexió_mysql](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/connexió_mysql_sense_usuari_ni_contrasenya.PNG)

<br>


**6. Canviar port mysqld**
* Editar fitxer configuració **/etc/my.cnf**
* Afegir la següent línia: **port=33306**
* Executar la comanda: **service mysqld restart**  

<br>
<br>
<br>


## PART1: INSTAL·LACIÓ SGBD MySQL Percona
