<%@ Page Language="VB" AutoEventWireup="false" CodeFile="verResultado.aspx.vb" Inherits="verResultado" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  
    <script language="javascript">

        function pdf() {
            print();
            setTimeout("self.close();", 50)
  }

      
</script>

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

<body onload="pdf()";>
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

           ' CONEXION DE BASE DE DATOS

           'CONSULTA PARA OBTENER LOS EMPLEADOS DE LA PLANTA SELECCIONADA POR EL USUARIO 
           sql = "select habilidad,total from Evaluacion_Totales where  fecha='2015' and Nombre_Evaluado='" + nombre + "';"
           Dim sqlReader As SqlDataReader
           connection = New SqlConnection("Data source=MEXQ-SERVER4;Initial Catalog=MEXQAppPr;User ID=sa;Password=P@ssw0rd")
           Try
               connection.Open()

               command = New SqlCommand(sql, connection)
               sqlReader = command.ExecuteReader()



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
               Do While sqlReader.Read()
                   Dim habilidad As String
                   Dim total As String
                   habilidad = sqlReader.GetString(0)
                   total = sqlReader.GetInt32(1)
                   Response.Write("<tr>")
                   Response.Write("<td style='border:solid #000 1px;' class='col-xs-2'>" + habilidad + "</td>")
                    
                   Response.Write("<td style='border:solid #000 1px;text-align:center;' class=' col-xs-1'>" + total + "</td>")
                   Response.Write("<td style='border:solid #000 1px;text-align:center;' class=' col-xs-1'>" + total + "</td>")
                   Response.Write("<td style='border:solid #000 1px;text-align:center;' class=' col-xs-1'>" + total + "</td>")
                   Response.Write("<td style='border:solid #000 1px;text-align:center;' class=' col-xs-1'>" + total + "</td>")
                   Response.Write("<td style='border:solid #000 1px;text-align:center;' class=' col-xs-1'>" +total + "</td>")
                 
                   Response.Write("</tr>")
                   
               Loop
           End If
              Response.Write("</tbody>")
           Response.Write(" </table>")
           %>
   
</center>

        <!--    =)....... FIN DE CENTRO DE PAGINA (MAQUETACIÓN HTML5).....=)  -->
    <a style="text-align:justify;"></a>
</div >
	
</body>
</html>