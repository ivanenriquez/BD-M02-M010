## CLUSTERING  



**INSTAL·LACIÓ**  


* Instal·lar el repositori:  

***yum install http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm***  

<br>


* Comprovar que el paquet esta disponible  

***sudo yum list | grep Percona-XtraDB-Cluster-57***  

<br>


* Instal·lar el paquet  

***sudo yum install Percona-XtraDB-Cluster-57***  

<br>


* Desactivar el firewall  

***sudo systemctl stop firewalld***  
***sudo systemctl disable firewalld***

<br>


* Desactivar selinux  

Editar el fitxer de configuració ***/etc/selinux/config*** i canviar el paràmetre ***SELINUX=enforce*** per ***SELINUX=disabled***  

<br>


* Iniciar el servei  

***sudo systemctl start mysql***  

<br>


* Veure la contrasenya temporal assignada a l’usuari root per accedir per primera vegada a mysql  
***sudo grep ’temporary password’ /var/log/mysqld.log***  

<br>


* Accedir a mysql:

***mysql -u root –p***  

***ALTER USER 'root'@'localhost' IDENTIFIED BY 'patata';***  

<br>


* Parar el servei:
***sudo systemctl stop mysql***  

<br>


* CONFIGURACIÓ NODES:  
Node1: 10.92.255.78  
Node2: 10.92.255.79  
Node3: 10.92.255.166  
Node4: 10.92.255.167  


<br>


* Crear un fitxer de configuració a ***/etc/percona-xtradb-cluster.conf.d*** i configurar-lo per cada node  

***wsrep_cluster_name=nom_cluster  
wsrep_cluster_address=gcomm://adreces_servidors_cluster_separades_per_comes  
wsrep_node_name=nom_maquina  
wsrep_node_address=ip_maquina  
wsrep_sst_method=metode_per_fer_la_replica  
wsrep_sst_auth”usuari:contrasenya” per_fer_la_replica***  

![wsrep.cnf](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/Captura.JPG)  

<br>


* Iniciar el node1 amb el bootstrap:  

***systemctl start mysql@bootstrap.service***  

<br>


* Crear un usuari per al node principal per realizar la replicació en els altres.

***CREATE USER ’sstuser’@’localhost’ IDENTIFIED BY ’P@ssw0rd’;  
GRANT RELOAD, LOCK TABLES, PROCESS, REPLICATION CLIENT ON *.* TO ’sstuser’@’localhost’;  
FLUSH PRIVILEGES;***  

<br>


* Afegir la resta de nodes al cluster:  

***systemctl start mysql***  

<br>


* Comprobar que el cluster està funcionant:  

***SHOW STATUS LIKE ’wsrep%’;***  

![SHOW_STATUS](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/Captura2.JPG)  

<br>


**BOOTSTRAPPING**  
El concepte bootstrapping vol dir tenir un node principal dins un cluster que s’arrencarà el primer del cluster i el qual conté totes les dades i les quals es repliquen a tots els altres nodes del cluster.  

<br>


**SPLIT-BRAIN**  

El concepte Split-brain succeeix quan un o més nodes fallen en un clúster i els subconjunts de nodes no poden comunicar-se entre si. Això pot fer que tots dos subconjunts de nodes intentin ser propietaris de la càrrega de treball i escriure en el mateix disc, la qual cosa pot ocasionar nombrosos problemes.

Exemple:  

•	Suposem que hi ha 5 nodes A, B, C, D i E que formen un clúster, X.  
•	Ara falla un node (per exemple, E).  
•	Es realitza la reforma del clúster. En realitat, els nodes restants A, B, C i D haurien de formar el clúster X.  
•	Però es pot produir una divisió de la situació cerebral que condueix a la formació de dos grups X1 (que contenen A i B) i X2 (que contenen C i D).  
•	Els clústers X1 i X2 creuen que són l'únic clúster actiu. Ambdós grups comencen a accedir a les dades o al disc, la qual cosa provoca la corrupció de dades.  
