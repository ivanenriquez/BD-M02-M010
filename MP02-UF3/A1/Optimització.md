## PART1 - OPTIMITZACIÓ  

1. Obtenir el nom i l’adreça dels hotels de 4 estrelles.  

<span style="color:blue">SELECT nom  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ,adreca  
&nbsp;&nbsp;&nbsp; FROM hotels  
  WHERE categoria = 4;***</span> 

<br>


2. Obtenir el nom dels clients (Nom i cognom) que el seu cognom comenci per vocal (sense tenir en compte els accents).  

***SELECT CONCAT(nom,',',cognom1)  
&nbsp;&nbsp;&nbsp;  FROM clients  
WHERE cognom1 like 'a%' OR cognom1 like 'e%' OR cognom1 like 'i%' OR cognom1 like 'o%' OR cognom1 like 'u%';***  

<br>


3. Quina és la reserva_id que té més nits. Indica també la quantitat de nits.  

***SELECT reserva_id  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ,DATEDIFF (data_fi, data_inici) Nits  
&nbsp;&nbsp;&nbsp; FROM reserves  
WHERE DATEDIFF (data_fi, data_inici) = (SELECT MAX(DATEDIFF (data_fi, data_inici))  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FROM reserves)LIMIT 1;***  

<br>


4. Quantes reserves va rebre l’hotel ‘Catalonia Ramblas’ de Barcelona durant tot  l’any 2015 (una reserva pertany al 2015 si alguna nit d’aquesta reserva era del 2015).  

***SELECT COUNT(r.reserva_id) AS Total_Reserves  
  FROM reserves AS r  
  INNER JOIN habitacions AS hab ON hab.hab_id = r.hab_id  
  INNER JOIN hotels AS h ON h.hotel_id = hab.hotel_id  
  INNER JOIN poblacions AS p ON p.poblacio_id = h.poblacio_id  
WHERE h.nom = 'Catalonia Ramblas' AND YEAR(data_inici)=2015 AND p.nom = 'Barcelona';***  

<br>


5. Obtenir el nom i cognoms dels clients que varen néixer el mes de Març.  

***SELECT nom  
         ,cognom1  
  FROM clients  
WHERE MONTH(data_naix) = 03;***  

<br>


6. Quantitat d’hotels de 4 estrelles de la població de Barcelona.  



<br>


7. De l’any 2015 volem obtenir els seu histograma de reserves. És a dir volem saber el número de reserves de cadascun dels mesos. Una reserva pertany a un mes si la alguna nit d’aquella reserva cau a dins de l’any 2015.  



<br>


8. El nom dels hotels que tenen com a mínim una habitació lliure durant les dates ‘2015-05-01’ i ‘2015-05-17’.  



<br>


9. Obtenir la quantitat de reserves que s’inicien en cadascun dels dies de la setmana. Tenint en compte només l’any 2016.  



<br>


10. Durant 2014 qui va realitzar més reserves? Els homes o les dones? Mostra el sexe i el número de reserves.  



<br>



11.	Quina és la mitjana de dies de reserva per l’hotel «HTOP Royal Star» de Blanes durant l’any 2016? (Una reserva pertany el 2016 si alguna nit cau en aquest any).  



<br>


12.	El nom, categoria, adreça i número d’habitacions de l’hotel amb més habitacions de la BD.  



<br>


13.	Rànquing de 5 països amb més reserves durant l’any 2016. Per cada país mostrar el nom del país i el número de reserves.  



<br>


14. Codi client, Nom, Cognom, del client que ha realitzat més reserves de tota la BD.  



<br>


15. Codi client, Nom, Cognom, del client que ha realitzat més reserves durant el mes d’agost de l’any 2016. Les reserves a comptabilitzar són totes aquelles que en algun dia del seu període cau en el mes d’agost.  



<br>


16. Quin és el país que en tenim menys clients?  



<br>


17. Quina és la mitjana de nits dels clients provinents d’‘HOLANDA’ per l’any 2016?  



<br>


18.	Digues el nom i cognoms dels clients que el seu cognom sigui ‘Bahi’.  



<br>


19.	Quins clients (nom, cognoms) segueixen el patró de que el seu cognom comenci per la lletra ‘p’  i seguida d’una vocal.  



<br>


20.	Quin és l’hotel de 4 estrelles amb més reserves durant tot el 2015 ( una reserva pertany el 2015 si alguna de les nits hi pertany).  



<br>


21.	Quin és l’hotel amb més reserves (tota la BD).  



<br>


22.	Quin és el país amb més reserves? (tots els anys) O sigui, quin és el país d’on han vingut més turistes.  



<br>
<br>
<br>
<br>

## QUERY CACHÉ   



<br>
<br>
<br>
<br>


## BENCHMARKING
