function help()
  print("sysbench Lua demo; no special command line options available")
end

function thread_init(thread_id)
end

function thread_done(thread_id)
  db_disconnect()
end

function event(thread_id)
	local randomFrom = math.random(1,5)
	local randomSelect = math.random(1,2)
	local randomWhere = math.random(1,2)	
	local vSelect= ''
	local vFrom = ''
	local vWhere = ''					
				if randomFrom == 1
				then
				vFrom = ' FROM clients c INNER JOIN paisos p ON c.pais_origen_id = p.pais_id'

					if randomSelect == 1
					then
						vSelect = 'SELECT c.client_id,c.nom,c.cognom1'
				
					elseif randomSelect == 2
					then
						vSelect = 'SELECT c.client_id,c.data_naix'
					end
					
					if randomWhere == 1
					then			
						vWhere = ' WHERE p.pais_id = 3;'

					elseif randomWhere == 2
					then
						vWhere = ' WHERE c.sexe = "M";'									
						
					end
					db_query(vSelect .. vFrom .. vWhere)
				end
			
	if randomFrom == 2
	then
		db_query("SELECT c.client_id,c.nom,c.cognom1 FROM clients c INNER JOIN reserves r ON r.client_id = c.client_id INNER JOIN habitacions hab ON hab.hab_id = r.hab_id GROUP BY c.client_id HAVING COUNT(r.reserva_id) = ( SELECT MAX(TotalReserves) MaxTotalReserves FROM ( SELECT c.client_id,c.nom,c.cognom1,COUNT(r.reserva_id) TotalReserves FROM clients c INNER JOIN reserves r ON r.client_id = c.client_id INNER JOIN habitacions hab ON hab.hab_id = r.hab_id GROUP BY c.client_id) C);")
	end 
	
	if randomFrom == 3
	then
	db_query ("SELECT p.pais_id,p.nom FROM paisos p INNER JOIN clients c ON c.pais_origen_id = p.pais_id GROUP BY p.pais_id HAVING COUNT(c.client_id) = ( SELECT MIN(Totalclients) MaxTotalclients FROM ( SELECT p.pais_id,COUNT(c.client_id) Totalclients FROM paisos p INNER JOIN clients c ON c.pais_origen_id = p.pais_id GROUP BY p.pais_id ) P);")
	end 
	
	if randomFrom == 4
	then
	db_query("INSERT INTO reserves(hab_id,data_inici,data_fi,client_id) VALUES(50000,'2018-03-10','2018-03-25',10346)")
	end
	
	if randomFrom == 5
	then
	db_query("UPDATE clients SET nom = 'David', data_naix = '1996-03-25' WHERE client_id = 10115")

	end			
end