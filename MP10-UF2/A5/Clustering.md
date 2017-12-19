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
