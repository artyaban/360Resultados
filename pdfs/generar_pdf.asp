
<%@language=vbscript%>

<!-- #include file="../Includes/constantes.asp" -->
<!--#include file="../funcionpdf.asp"-->
<!--#include file="../fpdf.asp"-->
<!--#include file="../Includes/funciones.asp"-->


<%
sub crearPie()

	pdf.SetX(0)
	pdf.SetY(275)
	pdf.SetFillColor 250, -1, -1
	pdf.Cell 0, 5, "Fechas de revisión ->  Rev 1: " & fecha1 & " | Rev 2: " & fecha2 & " | Rev 3: " & fecha3 & " | Rev 4: " & fecha4 , 1, 1, "C",1
end sub

sub cabecera()
   
    pdf.SetFont "Arial","B",8	
   x =  15
   y = 20
   pdf.Image "../imagenes/" & "logo_PDF" & ".jpg", x, y, 68, 31
   pdf.ln(2)
   pdf.SetFillColor 250, -1, -1
   pdf.SetX(x + 75 + 10)   
   pdf.Cell 20, 5, "Consultora:", 1, 0, "L", 1
   pdf.SetFont "Arial","",8
   pdf.Cell 80, 5, "" & "LA EMPRESA", 1, 1
   pdf.SetX(x + 75 + 10)
   pdf.SetFont "Arial","B",8
   pdf.Cell 20, 5, "Dirección:", 1, 0
   pdf.SetFont "Arial","",8
   pdf.Cell 80, 5, "" & "Sede Principal en -> ... " , 1, 1    
   pdf.SetX(x + 75 + 10)
   pdf.SetFont "Arial","B",8
   pdf.Cell 20, 5, "Situado en: ", 1, 0
   pdf.SetFont "Arial","",8
   pdf.Cell 80, 5, "" & "Palencia, España", 1, 1 
   pdf.SetX(x + 75 + 10)
   pdf.SetFont "Arial","B",8
   pdf.Cell 20, 5, "Teléfono/fax:", 1, 0
   pdf.SetFont "Arial","",8
   pdf.Cell 80, 5, "" & "Telf.: (999) 999 999 " & "/ " & "Fax: (999) 999 999" , 1, 1 
   pdf.SetX(x + 75 + 10)
   pdf.SetFont "Arial","B",8
   pdf.Cell 20, 5, "Pag. web:", 1, 0
   pdf.SetFont "Arial","",8
   pdf.Cell 80, 5, "" & "http://www.laweb.com" , 1, 1 
   pdf.SetLeftMargin(20)
   pdf.SetRightMargin(12)
    
   pdf.ln(7)
   
   pdf.SetFont "Arial","B",8
   ' Comenzamos con los registros asociados a la norma.
   'Antes vamos a imprimir los estados para las fechas
   'on error resume next
 	
	
end sub





'Si posee acceso
if session("acceso") = "SI" and request.form("IDR")<>"" then 


 'on error resume next
 set conexionPDF=Server.CreateObject("ADODB.Connection")  
 set registroPDF=Server.CreateObject("ADODB.RecordSet")  
 'Información de la norma.
 SQL = "SELECT * FROM REQT1RNORMAS WHERE IDR = " & trim(Request("IDR")) 
 conexionPDF.Open DBA_gestor
 registroPDF.Open SQL, conexionPDF, 1, 2
	
 
 
set pdf=CreateJsObject("FPDF")
pdf.CreatePDF()
pdf.SetPath("../fpdf/")


'En caso de no pasar el usuario por request
if request("IDCL")="" then
pdf.Setnombre ("IDCL : " & session("idusuario") & " - " & session("usuario") & " a fecha de " & date() )
else
pdf.Setnombre ("IDCL : " & Request("IDCL") & " - " & Consultar_Nombre("reqt2clientes","IDCL",request("IDCL"),"numerico", "usuario") & " a fecha de " & date() )
end if


pdf.Open()
pdf.AddPage()
   'pdf.ln()
   salto_linea = 3	
   cabecera()
     
   pdf.SetFillColor 250, -1, -1
   pdf.Cell 0, 5, "NORMA SELECCIONADA (IDR) ->  " & rtrim(registroPDF("IDR")) & " | TIPO : " & rtrim(registroPDF("Tipoleg")) , 1, 1, "C", 1
   y_inicio = pdf.GetY()
   x = pdf.GetX()

	set conexionFecha=Server.CreateObject("ADODB.Connection")  
 	set registroFEcha=Server.CreateObject("ADODB.RecordSet")  
 	'Información de la norma.
 	if request("IDCL")<>"" then
		SQL = "SELECT * FROM REQT2CLIENTES WHERE IDCL = " & trim(Request("IDCL")) 
		else
		SQL = "SELECT * FROM REQT2CLIENTES WHERE IDCL = " & trim(session("idusuario")) 
	end if
	
 	conexionFecha.Open DBA_gestor
 	registroFEcha.Open SQL, conexionFecha, 1, 2
	
	'pdf.Cell 0, 5, "Fechas de revisión: Rev 1: " & cstr(registroFEcha("revfecha1")) &  " | Rev 2: " & cstr(registroFEcha("revfecha2")) & " | Rev 3: " & cstr(registroFEcha("revfecha3")) &  " | Rev 4: " & cstr(registroFEcha("revfecha4"))  , 1, 1, "C",1
 		if not isnull(registroFecha("REVFECHA1")) or not isempty(registroFecha("REVFECHA1")) then
			fecha1=registroFEcha("REVFECHA1")
			else
			fecha1= "----"
		end if
		if not isnull(registroFecha("REVFECHA2")) or not isempty(registroFecha("REVFECHA2")) then
			fecha2=registroFEcha("REVFECHA2")
			else
			fecha2= "----"
		end if
	    if not isnull(registroFecha("REVFECHA3")) or not isempty(registroFecha("REVFECHA3")) then
			fecha3=registroFEcha("REVFECHA3")
			else
			fecha3= "----"
		end if	
		if not isnull(registroFecha("REVFECHA4")) or not isempty(registroFecha("REVFECHA4")) then
			fecha4=registroFEcha("REVFECHA4")
			else
			fecha4= "----"
		end if
	

	
	registroFEcha.Close
 	conexionFecha.Close
 	SET registroFEcha = Nothing      
 	SET conexionFecha = Nothing 
    

	
   crearPie()
   
   pdf.setX(x)
   pdf.SetY(y_inicio)
   longitud=900
   if len(rtrim(registroPDF("NORMA"))) > longitud then
   		textoNorma=Left(rtrim(registroPDF("NORMA")), longitud) & " ... " & chr(13) 
 	else
   		textoNorma=Left(rtrim(registroPDF("NORMA")), longitud) & chr(13) 
   end if

   pdf.SetFont "Arial","",7
   alto = escribe(y_inicio+4, x+3, textoNorma, 175, 3)
   pdf.SetFont "Arial","B",8
   pdf.Cell 0, alto- y_inicio +1, "", 1, 1, "L"

   pdf.Cell 10, 5 , "REV 1", 1, 0, "C",1
   pdf.Cell 10, 5 , "REV 2", 1, 0, "C",1
   pdf.Cell 10, 5 , "REV 3", 1, 0, "C",1
   pdf.Cell 10, 5 , "REV 4", 1, 0, "C",1
   
  'Contemos el numero de requisitos de la norma seleccionada
  
    set ConexRegistrosNorma=Server.CreateObject("ADODB.Connection") 
	set reg_Norma = Server.CreateObject("ADODB.RecordSet")
	consulta = "SELECT count(*) as cuenta from reqT5Aplicacion where IDR = " & trim(request("IDR"))
	ConexRegistrosNorma.Open DBA_gestor
	reg_Norma.Open consulta, ConexRegistrosNorma, 1, 2
		CuentaRegistrosNorma=reg_Norma("cuenta") 
		'Asignamos la session para la apertura de ventanas.
		if CuentaRegistrosNorma="" or isnull(CuentaRegistrosNorma) then
		CuentaRegistrosNorma=0
		end if
		reg_Norma.close
	  	set reg_Norma = Nothing
		ConexRegistrosNorma.Close
	   	set ConexRegistrosNorma = Nothing









  pdf.Cell 0, 5 , "APLICACION / REQUISITOS , Nº registros: " & CuentaRegistrosNorma, 1, 1, "C",1				
  
	'Comenzamos con el bucle para sacar los registros de aplicacion del cliente.
		set conexionRegistro=Server.CreateObject("ADODB.Connection")  
 		set registro=Server.CreateObject("ADODB.RecordSet")  
		SQL = "SELECT * FROM REQT5APLICACION WHERE IDR = " & cstr(trim(Request("IDR")))
		conexionRegistro.Open DBA_gestor
 		registro.Open SQL, conexionRegistro,1, 2
		if not registro.EOF then
			registro.MoveFirst	
		end if
		 do while not registro.EOF	
  				
			if Pdf.getY() > 240 then
					 pdf.addpage()
					 cabecera() 
					 crearPie()
					 pdf.setX(x)
				     pdf.SetY(y_inicio)
					
			end if


				if (registro("APLIREQUISITO")= "") or ( isnull(registro("APLIREQUISITO"))) or ( isempty(registro("APLIREQUISITO")))then
				 	APLIREQUISITO = ""
				else
					APLIREQUISITO = rtrim(registro("APLIREQUISITO"))
				end if
				
'Primer Cuadro	
					'Almacenamos los registros

					  EVT1="" & trim(registro("EVT1"))
					  EVT2="" & trim(registro("EVT2"))
					  EVT3="" & trim(registro("EVT3"))
					  EVT4="" & trim(registro("EVT4"))
					

	'alto = escribe(alto, 80, rtrim(registro("APLIREQUISITO")) , 76, salto_linea)
					 if EVT1 = "I" then
					      pdf.SetFillColor 247, 44, 23
					 else
						    if EVT1 = "C" then 
						    	pdf.SetFillColor 15, 138, 71
					 	     else
						   		  if EVT1 = "T" then
								   pdf.SetFillColor 252, 160, 0
								   else
								     pdf.SetFillColor 215, 212, 207
							       end if
							end if
							
					 end if		
					 pdf.Cell 10, 5, EVT1, 1, 0, "C",1
  'Segundo Cuadro


					 if EVT2 = "I" then
					      pdf.SetFillColor 247, 44, 23
					 else
 						 if EVT2 = "C" then 
						    	pdf.SetFillColor 15, 138, 71
					 	     else
						   		  if EVT2 = "T" then
								   pdf.SetFillColor 252, 160, 0
								   else
								     pdf.SetFillColor 215, 212, 207
							       end if
						     end if						  

					 end if	
					  pdf.Cell 10, 5, evt2, 1, 0, "C",1


'Tercer Cuadro
					 
					 if EVT3 = "I" then
					      pdf.SetFillColor 247, 44, 23
					 else
						    if EVT3 = "C" then 
						    	pdf.SetFillColor 15, 138, 71
					 	     else
						   		  if EVT3 = "T" then
								   pdf.SetFillColor 252, 160, 0
								   else
								     pdf.SetFillColor 215, 212, 207
							       end if
							end if
					 end if	
					 pdf.Cell 10, 5, evt3, 1, 0, "C",1

'Cuarto Cuadro
					 
					 if EVT4 = "I" then
					      pdf.SetFillColor 247, 44, 23
					 else
						  if EVT4 = "C" then 
						    	pdf.SetFillColor 15, 138, 71
					 	     else
						   		  if EVT4 = "T" then
								   pdf.SetFillColor 252, 160, 0
								   else
								     pdf.SetFillColor 215, 212, 207
							       end if
							end if						 

					 end if	 
				
					pdf.Cell 10, 5, evt4, 1, 0, "C",1

pdf.SetFillColor 250, -1, -1
 
 'Fin de los cuadros
 					
					pdf.SetFont "Arial","",7
					
					posicion_y= Pdf.gety()
					posicion_x= Pdf.getx()	
					
					
				
					'Escribimos el valor del registro e intentamos calcular su posicion dinamicamente para ello usamos la funcion escribe.
					alto = escribe(pdf.Gety()+3, pdf.Getx()+2, "IDREQ: " & Registro("IDREQ") & "-> " & APLIREQUISITO, 134, salto_linea)

					pdf.Cell 0, alto- posicion_y+2 , "", 1, 1, "l"
					pdf.ln(1)
					pdf.SetFont "Arial","B",8

						registro.MoveNext
				
				
			loop
			registro.Close
 			conexionRegistro.Close
		SET registro = Nothing      
 		SET conexionRegistro = Nothing 
  	
 
 'Desconexión con la base de datos
 registroPDF.Close
 conexionPDF.Close
 SET registroPDF = Nothing      
 SET conexionPDF = Nothing 



'Cerramos el pdf
pdf.Close()
pdf.Output()
set pdf = nothing


'Fin  del if de la seguridad aplicada.

else


response.write "No posee permisos suficientes para generar el PDF o la session ha caducado."
end if

%> 


