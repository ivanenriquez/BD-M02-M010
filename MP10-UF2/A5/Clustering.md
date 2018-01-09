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

* CONFIGURACIÓ NODES:  
Percona1: 10.92.255.109  
Percona2: 10.92.255.108  
Percona3: 10.92.255.78  
Percona4: 10.92.255.79  

* Crear un fitxer de configuració a /etc/percona-xtradb-cluster.conf.d i configurar-lo per cada node  

***wsrep_cluster_name=nom_cluster  
wsrep_cluster_address=gcomm://adreces_servidors_cluster_separades_per_comes  
wsrep_node_name=nom_maquina  
wsrep_node_address=ip_maquina  
wsrep_sst_method=metode_per_fer_la_replica  
wsrep_sst_auth”usuari:contrasenya” per_fer_la_replica***  

