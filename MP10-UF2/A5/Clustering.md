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

* Iniciar el servei  

***sudo systemctl start mysql***  

<br>


* Veure la contrasenya temporal assignada a l’usuari root per accedir per primera vegada a mysql  
***sudo grep ’temporary password’ /var/log/mysqld.log***  

* Accedir a mysql:

***mysql -u root –p***  

***ALTER USER 'root'@'localhost' IDENTIFIED BY 'patata';***  

* Parar el servei:
***sudo systemctl stop mysql***  

<br>


* CONFIGURACIÓ NODES:  
Percona1: 10.92.255.109  
Percona2: 10.92.255.108  
Percona3: 10.92.255.78  
Percona4: 10.92.255.79  

<br>


* Crear un fitxer de configuració a /etc/percona-xtradb-cluster.conf.d i configurar-lo per cada node  

***wsrep_cluster_name=nom_cluster  
wsrep_cluster_address=gcomm://adreces_servidors_cluster_separades_per_comes  
wsrep_node_name=nom_maquina  
wsrep_node_address=ip_maquina  
wsrep_sst_method=metode_per_fer_la_replica  
wsrep_sst_auth”usuari:contrasenya” per_fer_la_replica***  

![wsrep.cnf](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/Captura1.JPG)  

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
