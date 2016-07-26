<%

'Agrega aqui tus funciones

'Emimina la ' de una cadena
function E_inyeccion(cadena)
   E_inyeccion = Replace(rtrim(cadena),"'","")
End function



'Funcion util para ver los campos enviados.
Sub imprimir_campos()
'on error resume next
For Each elemento In Request.form 

       Response.Write elemento & ": " & Request.form(elemento) & "<br>" 
Next 
'imprimir_campos=validado
end sub



%>