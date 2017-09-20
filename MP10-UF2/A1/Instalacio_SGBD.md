**2. Instruccions per arrancar / verificar status / apagar servei de la base de dades de Percona Server:**
	
	 ARRENCAR SERVEI			service mysql start
	 VERIFICAR STATUS SERVEI		service mysql status
	 APAGAR SERVEI				service mysql stop  


**3. Ubicacio fitxer de configuració del SGBD Percona Server:**

/etc/my.cnf


**4. Ubicacio fitxers de dades:**

/var/lib/mysql

![COMPROVACIÓ](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A1/imatges/ubicació_per_defecte_fitxers_de_dades.PNG)


**6. Canviar port mysqld**
* Editar fitxer configuració **/etc/my.cnf**
* Afegir la següent línia: **port=33306**
* Executar la comanda: **service mysqld restart**
