
<% 
 'Funcion que va rellenando las celdas
 'rellenar(cadena a poner, coordenada x, y_inicio de la coordenada y, ancho de la fila): devulve la posicion y con la que termina
 'on error resume next
 
 function rellenar(des, x, y_inicio, ancho, alto)
     y_pos = 0
	 'Voy obteniendo palabra a palabra hasta obtener como máximo de ancho de linea el ancho pasado a la funcion
	 aux_cad = ""
	 cad_final = ""
	 aux_ancho = 0
	 'ancho: longitud de la linea
	 'aux_ancho: ancho que se va cojiendo
	 do while (aux_ancho < ancho) and (len(des) > 0) 
		aux_espacio = instr(des, " ")		
		if aux_espacio = 0 then
			aux_espacio = len(des) 'Si no hay espacio lo pongo a la longitud total de la cadena			
		end if
		aux_cad = aux_cad & mid(des, 1, aux_espacio)
	 	aux_ancho = pdf.GetStringWidth(aux_cad)		
		if aux_ancho <= ancho then 			
			cad_final = cad_final & mid(des, 1, aux_espacio)
			des = mid(des, aux_espacio + 1)		
		end if		
	 loop
	 
	 if cad_final = "" then 'Si se trata de una única palabara más larga que el ancho fijado.
		aux_espacio = instr(des, " ")
		if aux_espacio = 0 then 	
			aux_espacio = len(des) 'Si no hay espacio lo pongo a la longitud total de la cadena				
		end if
		cad_final = mid(des, 1, aux_espacio)
		des = mid(des, aux_espacio + 1)
	end if
		
	 pdf.Text x, y_inicio, "" & cad_final
	 y_pos = y_inicio + alto

	 while (len(des) > 0) 
        aux_cad = ""
		cad_final = ""
		aux_ancho = 0
	 	do while (aux_ancho < ancho) and (len(des) > 0)
			aux_espacio = instr(des, " ")			
			if aux_espacio = 0 then 	
				aux_espacio = len(des) 'Si no hay espacio lo pongo a la longitud total de la cadena				
			end if
			aux_cad = aux_cad & mid(des, 1, aux_espacio)
	 		aux_ancho = pdf.GetStringWidth(aux_cad)
			if aux_ancho <= ancho then 
				cad_final = cad_final & mid(des, 1, aux_espacio)
				des = mid(des, aux_espacio + 1)
			end if			
	 	loop
	    
		if cad_final = "" then
			aux_espacio = instr(des, " ")
			if aux_espacio = 0 then 	
				aux_espacio = len(des) 'Si no hay espacio lo pongo a la longitud total de la cadena				
			end if
			cad_final = mid(des, 1, aux_espacio)
			des = mid(des, aux_espacio + 1)
		end if
		
	    pdf.Text x, y_pos, "" & cad_final
        y_pos = y_pos + alto		
	wend
	

	 'Puesto para forzar un salto de linea cuando acabe de poner todo el texto.
	 if (y_pos = (y_inicio + alto)) then 'Es que el texto a escribir solo ha ocupado una linea
	   rellenar = y_inicio + alto
	 else
	   rellenar = y_pos
	 end if  
 end function
 
 'Funcion que lanza la escritura del texto
 'escribe(coordenada y donde empieza, coordenada x donde empieza el texto, cadena a escribir, ancho de la linea): devulve la posicion y donde termina
 function escribe (y_inicio, x, des, ancho, alto)
 	 if alto = 0 then alto = 3
 	 y_aux = y_inicio
	 while (instr(des, chr(13)) <> 0) 'chr(13) --> Salto de linea
	   corte = instr(des, chr(13))
       aux = Left(des, corte) & " "
	   'des = Ltrim(Right(des, len(des) - corte - 1)) '-1 para quitar el salto de linea
	   des = Ltrim(Mid(des, corte + 1))	   
	   y_aux = rellenar(aux, x, y_aux, ancho, alto)	   
	 wend
	 
     y_aux = rellenar(des & " ", x, y_aux, ancho, alto)
     'Le resto 5 de altura que son puestos a mayores para ir escribiendo seguidamente la siguiente liena a mostrar
	 y_aux = y_aux - alto 'Por defecto alto = 3
	 escribe = y_aux
 end function

 'Funcion que devuelve el valor maximo de dos numeros
 function maximo(valor1, valor2)
   if Cdbl(valor1) > Cdbl(valor2) then
     maximo = valor1
   else
     maximo = valor2
   end if
 end function
 
%>

