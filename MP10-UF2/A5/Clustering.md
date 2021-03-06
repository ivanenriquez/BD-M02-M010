## CLUSTERING  


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

![wsrep.cnf](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/wsrepconf.JPG)  

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

![SHOW_STATUS](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/Captura3.JPG)  

<br>


**BOOTSTRAPPING**  
El concepte bootstrapping vol dir tenir un node principal dins un cluster que s’arrencarà el primer del cluster i el qual conté totes les dades i les quals es repliquen a tots els altres nodes del cluster.  

<br>


**SPLIT-BRAIN**  

El concepte Split-brain succeeix quan un o més nodes fallen en un clúster i els subconjunts de nodes no poden comunicar-se entre si. Això pot fer que els subconjunts de nodes intentin ser propietaris de la càrrega de treball i escriure en el mateix disc, la qual cosa pot ocasionar nombrosos problemes.

Exemple:  

•	Suposem que hi ha 5 nodes A, B, C, D i E que formen un clúster, X.  
•	Ara falla un node (per exemple, E).  
•	Es realitza la reforma del clúster. En realitat, els nodes restants A, B, C i D haurien de formar el clúster X.  
•	Però es pot produir una divisió de la situació cerebral que condueix a la formació de dos grups X1 (que contenen A i B) i X2 (que contenen C i D).  
•	Els clústers X1 i X2 creuen que són l'únic clúster actiu. Ambdós grups comencen a accedir a les dades o al disc, la qual cosa provoca la corrupció de dades.  

<br>
<br>
<br>
<br>

## BALANCEJADOR/PROXY    



* Instal·lar el paquet en una màquina fora del clúster:  

***sudo yum install proxysql***  

<br>


* Accedir a la interfície d'administració de ProxySQL en el ProxySQL  

***mysql -u admin -padmin -h 127.0.0.1 -P 6032***  

<br>


* Afegir els nodes del clúster dins la base de dades del ProxySQL  

![INSERT_SELECT](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/AFEGIR_NODES_cLUSTER_BD.JPG)  

<br>


* Crear un usuari per monitoritzar els nodes en qualsevol node del clúster  

![USER](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/crear_usuari.JPG)  

<br>


* Configurar l'usuari per monitoritzar els nodes en la màquina on tenim el ProxySQL  

![UPDATE_USER](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/usuari_in_proxy_sql.JPG)  
![UPDATE_PASSWORD](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/contrasenya_in_proxysql.JPG)  

<br>


* Carregar la configuració en temps d'execució i a disc  

***LOAD MYSQL VARIABLES TO RUNTIME;***  
***SAVE MYSQL VARIABLES TO DISK;***  

<br>

* Comprovar que ProxySQL es pot connectar als nodes del clúster  

![LOG](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/monitoring_log_is_enabled.JPG)  

<br>


* Habilitar la monitorització dels nodes carregant la configuració en temps d'execució  

***LOAD MYSQL SERVERS TO RUNTIME;***  

<br>


* Crear usuari per administrar les connexions  

![INSERT_USER](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/PROXY_CLIENT_USER.JPG)  

<br>


* Carregar la configuració en temps d'execució i a disc  

***LOAD MYSQL USERS TO RUNTIME;***  
***SAVE MYSQL USERS TO DISK;***  

<br>


* Per confirmar que l'usuari s'ha configurat correctament iniciem sessió amb aquest  

![sbuser_localhost](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/access%20sbuser.JPG)  

<br>


* Per proporcionar accés de lectura/escriptura al clúster, afegim l'usuari a un dels nodes del clúster  

![sbuser_node_cluster](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/create_user_sbuser.JPG)  

<br>


* ProxySQL no pot detectar un node que no estigui en estat sincronitzat. Per controlar l'estat dels nodes, utilitzem l'script proxyql_galera_checker ubicat a  ***/usr/bin/proxysql_galera_checker***. Carregar l'script al sheduler  

![INSERT_SCHEDULER](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/shceduler.JPG)  

<br>


* Carregar els canvis al scheduler en temps d'execució  

***LOAD SCHEDULER TO RUNTIME;***  

<br>


* Comprovar que l'script s'ha carregat correctament  

![SELECT_SCHEDULER](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/select_Sheduler.JPG)  

<br>


* Comprovar l'estat dels nodes  

![SELECT_STATUS](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/node_Status.JPG)  

<br>


* Comprovació del clúster amb sysbench. Instal·lar l'eina ***sysbench*** a la màquina proxysql  

***yum install sysbench***  

<br>


* Crear la base de dades que s'utilitzarà pel test en un dels nodes del clúster  

***CREATE DATABASE sbtest;***

<br>


* Omplir la taula amb la informació del benchmark a la màquina proxysql  

![SYSBENCH1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/sysbench.JPG)  

<br>


* Activar el benchmark a la màquina proxysql  

![SYSBENCH2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/sysbench2.JPG)  

<br>


* Comprovar que funciona el benchmark  

![BENCHMARK](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/sysbench4.JPG)  

<br>


* Comprovar que ProxySQL detecta automàticament si un node no està disponible o no s'ha sincronitzat amb el clúster  

![FAILOVER1](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/failover1.JPG)  

<br>


* Per comprovar que funciona la detecció de problemes i el mecanisme d'error parem el servei d'un dels nodes  

***systemctl stop mysql*** 

<br>


* ProxySQL detecta que el node ha caigut  

![FAILOVER2](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/failover2.JPG)  

<br>


* Iniciem el servei en el node el qual està parat  

***systemctl start mysql***

<br>


*  Tornem a comprovar l'estat dels nodes i veiem que el node torna a estar actiu  

![FAILOVER3](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/failover3.JPG)  

<br>


* Accedir a proxysql amb l'usuari ***sbuser***  

![SBUSER](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/access%20sbuser.JPG)  

<br>


* Comprovar que fa el balanceig de les peticions comprovant el ***server_id***  

![BALANCEIG](https://github.com/ivanenriquez/BD-M02-M010/blob/master/MP10-UF2/A5/imatges/server_id.JPG)  

