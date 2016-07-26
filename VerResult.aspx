<%@ Page Language="VB" AutoEventWireup="false" CodeFile="VerResult.aspx.vb" Inherits="VerResult" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Mex-Q 360*</title>




   <!--    =).......HOJA DE STYLOSS .....=)  -->
   
<style>

body{

	height:1px;
	background-color: #fff;
}
h1{
	font-size: 100%;
	font-family: "Times New Roman", Georgia, Serif;
	font-size: 40px;
	color: #002369;
}
header{
	height: 10%;
	width: 98%; 
	
	background-color: #fff;


    }
    
 .image1{position:relative;height:90%; width:10%; text-align: left; float: left; }
 .image2{position:relative;height:90%; width:10%; text-align: right; float: right;}
.flota1{position:fixed;height:5%; width:5%; left: 2%; top:55%;opacity: .4;}
    .flota1:hover {
        left: 5%;
        top: 65%;
    }
    


table{
	  background-color: #fff; 

	
}

.div1{position:inherit;}
</style>

    <!--    =).......BOOTSTRAP.....=)  -->

    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    <link href="StyleSheet.css" rel="stylesheet" type="text/css" media="print">
   
</head>

<body>
       <!--    =).......ENCABEZADOO.....=)  -->
<header class="col-xs-12" style="background-color:#002369;">


<img src="360.fw.png"   class="image1 img-responsive"  >
<h1 align="center" class="col-xs-10"><small>RESULTADOS EVALUACION</small> </h1>
<img id="img2" src="mexq.fw.png"  class="image2 img-responsive">

</header>
       <!--    =).......FIN ENCABEZADO.....=)  -->

<br>

  


    <br />  <br />  <br />  <br /><br />

       <!--    =).......CENTRO DE PAGINA (MAQUETACIÓN HTML5).....=)  -->
<center>
  
    <br /><br />   <br /><br />


<div class="col-xs-12"  >
       <% Dim nombre As String = Request.QueryString("nombre")

           Dim connection As SqlConnection
           Dim command As SqlCommand
           Dim sql As String
           
           Dim connection2 As SqlConnection
           Dim command2 As SqlCommand
           Dim sql2 As String
           
           
           Dim connection3 As SqlConnection
           Dim command3 As SqlCommand
           Dim sql3 As String
           
           
           Dim connection4 As SqlConnection
           Dim command4 As SqlCommand
           Dim sql4 As String

           ' CONEXION DE BASE DE DATOS

           'CONSULTAS PARA OBTENER LOS EMPLEADOS DE LA PLANTA SELECCIONADA POR EL USUARIO 
           sql = "select habilidad,total from Evaluacion_Totales where  fecha='2015' and Nombre_Evaluado='" + nombre + "';"
           sql2 = "select habilidad,total from Evaluacion_Totales where  fecha='2015' and Nombre_Evaluado='" + nombre + "' and nombre_evaluador='" + nombre + "';"
           sql3 = "select habilidad,total from Evaluacion_Totales where  fecha='2015' and Nombre_Evaluado='" + nombre + "';"
           sql4 = "select habilidad,total from Evaluacion_Totales where  fecha='2015' and Nombre_Evaluado='" + nombre + "';"
           
           
           
           
           
           Dim sqlReader As SqlDataReader
           Dim sqlReader2 As SqlDataReader
           Dim sqlReader3 As SqlDataReader
           Dim sqlReader4 As SqlDataReader
           
           connection = New SqlConnection("Data source=MEXQ-SERVER4;Initial Catalog=MEXQAppPr;User ID=sa;Password=P@ssw0rd")
           connection2 = New SqlConnection("Data source=MEXQ-SERVER4;Initial Catalog=MEXQAppPr;User ID=sa;Password=P@ssw0rd")
           connection3 = New SqlConnection("Data source=MEXQ-SERVER4;Initial Catalog=MEXQAppPr;User ID=sa;Password=P@ssw0rd")
           connection4 = New SqlConnection("Data source=MEXQ-SERVER4;Initial Catalog=MEXQAppPr;User ID=sa;Password=P@ssw0rd")
           
           Try
               connection.Open()
               connection2.Open()
               connection3.Open()
               connection4.Open()
               
               
               command = New SqlCommand(sql, connection)
               command2 = New SqlCommand(sql2, connection2)
               command3 = New SqlCommand(sql3, connection3)
               command4 = New SqlCommand(sql4, connection4)
               
               sqlReader = command.ExecuteReader()
               sqlReader2 = command2.ExecuteReader()
               sqlReader3 = command3.ExecuteReader()
               sqlReader4 = command4.ExecuteReader()



           Catch ex As Exception
               MsgBox("Can not open connection ! ")
           End Try

           If sqlReader.HasRows <> False Then


               Dim i As Integer


               'LECTURA DE DATOS DE CONSULTA
               Response.Write(" <table class=' table-hover col-xs-12' >")
               Response.Write("<thead>")
               Response.Write("<tr>")
               Response.Write("<td  class='col-xs-2'style='color:#fff;background-color:#00246D;border-left:solid #000 1px;border-right:solid #fff 1px;border-top:solid #000 1px; text-align:center;' >Temas Evaluados</td>")
               Response.Write("<td  class=' col-xs-1'style='color:#fff;background-color:#00246D;border:solid #fff 1px;border-top:solid #000 1px;text-align:center;'>Autoevaluación</td>")
               Response.Write("<td  class=' col-xs-1'style='color:#fff;background-color:#00246D;border:solid #fff 1px;border-top:solid #000 1px;text-align:center;'>Jefe</td>")
               Response.Write("<td  class=' col-xs-1'style='color:#fff;background-color:#00246D;border:solid #fff 1px;border-top:solid #000 1px;text-align:center;'>Colaterales</td>")
               Response.Write("<td  class=' col-xs-1'style='color:#fff;background-color:#00246D;border:solid #fff 1px;border-top:solid #000 1px;text-align:center;'>Colaboradores</td>")
               Response.Write("<td  class=' col-xs-1'style='color:#fff;background-color:#00246D;border:solid #fff 1px;border-top:solid #000 1px;text-align:center;'>Promedio por habilidad</td>")
               Response.Write("</tr>")
               Response.Write("</thead>")
               Response.Write("<tbody>")
               Do While sqlReader.Read() Or sqlReader2.Read() Or sqlReader3.Read() Or sqlReader4.Read()
                   
                   Dim habilidad As String
                   Dim total As String
                   Dim autoevaluacion As String
                   Dim jefe As String
                   Dim colaterales As String
                   '   Dim colaboradores As String
                   habilidad = sqlReader.GetString(0)
                   total = sqlReader.GetInt32(1)
                   
                  
                   '   If sqlReader2.GetInt32(1) <> False Then
                   'autoevaluacion = sqlReader2.GetInt32(1)
                   'End If
                   
           ' If sqlReader3.HasRows = True Then
           'jefe = sqlReader3.GetString(0)
           ' End If
                   
           'If sqlReader4.HasRows = True Then
           'colaterales = sqlReader4.GetString(0)
           '  End If
                   
                   
                   
           Response.Write("<tr>")
           Response.Write("<td style='border:solid #000 1px;' class='col-xs-2'>" + habilidad + "</td>")
                    
           Response.Write("<td style='border:solid #000 1px;text-align:center;' class=' col-xs-1'>" + autoevaluacion + "</td>")
           Response.Write("<td style='border:solid #000 1px;text-align:center;' class=' col-xs-1'>" + jefe + "</td>")
           Response.Write("<td style='border:solid #000 1px;text-align:center;' class=' col-xs-1'>" + colaterales + "</td>")
           Response.Write("<td style='border:solid #000 1px;text-align:center;' class=' col-xs-1'>" + total + "</td>")
           Response.Write("<td style='border:solid #000 1px;text-align:center;' class=' col-xs-1'>" + total + "</td>")
                 
           Response.Write("</tr>")
                   
               Loop
           End If
           Response.Write("</tbody>")
           Response.Write(" </table>")
           %>
  
</center>

        <!--    =)....... FIN DE CENTRO DE PAGINA (MAQUETACIÓN HTML5).....=)  -->
<a style="text-align:justify;"></a><p> <br /><br /> &nbsp;&nbsp;&nbsp;</p><img src="untitled.png" class="col-xs-12" /></div >
	
</body>
</html>
