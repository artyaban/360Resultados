<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Siguiente.aspx.vb" Inherits="Siguiente" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Mex-Q 360*</title>




   <!--    =).......HOJA DE STYLOSS .....=)  -->
   
<style>

body{ /* For browsers that do not support gradients */

  /*  background: -webkit-linear-gradient(red, yellow);*/ /* For Safari 5.1 to 6.0 */
   /*  background: -o-linear-gradient(red, yellow); /* For Opera 11.1 to 12.0 */
   /*  background: -moz-linear-gradient(red, yellow); /* For Firefox 3.6 to 15 */
   /*  background: linear-gradient(#fff, #ddd); /* Standard syntax */
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
    
.flota2{position:fixed;height:5%; width:5%; left: 10%; top: 30%;opacity: .4;}
.flota3{position:fixed;height:5%; width:5%; left: 20%;  top: 40%;opacity: .4;}
.flota4{position:fixed;height:5%; width:5%; left: 30%;  top: 24%;opacity: .4;}
.flota5{position:fixed;height:5%; width:5%; left: 40%; top: 80%; opacity: .4;}
.flota6{position:fixed;height:5%; width:5%; left: 25%; top: 70%;opacity: .4; }
.flota7{position:fixed;height:5%; width:5%; left: 70%; top: 60%; opacity: .4;}
.flota8{position:fixed;height:5%; width:5%; left: 80%; top: 80%; opacity: .4;}
.flota9{position:fixed;height:5%; width:5%; left: 90%; top: 30%; opacity: .4;}
.flota10{position:fixed;height:5%; width:5%; left: 10%; top: 90%;opacity: .4; }

table{
	  background-color: #fff; 

	  height: 10%;
	width: 99%; 
}
td{
background-color: #fff; 
	


font-size:22px;
height: 10%;
width: 10%;
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
   <h2>Planta  : </h2> <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br /><br />   <br /><br />


<div class="col-xs-10" style="left:10%;">
      <!--    =)....... TABLA DE PERSONAS .....=)  -->
    <table class="table" >
          <!--    =).......ENCABEZADOS DE TABLA .....=)  -->
<tr class="table">
<td class="table">Nombre Evaluado </td>
<td class="table">Descargar Resultados</td>
<td class="table">Ver Resultados</td>
</tr>


<% 
    Dim planta As String
    planta = Request.QueryString("parametro")

    
    Dim connection As SqlConnection
    Dim command As SqlCommand
    Dim sql As String
    
    ' CONEXION DE BASE DE DATOS
    
    'CONSULTA PARA OBTENER LOS EMPLEADOS DE LA PLANTA SELECCIONADA POR EL USUARIO 
    sql = "SELECT NOMBRE FROM evaluacion_empleados where planta='" + planta + "';"
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
        Response.Write("<form action='verResultado.aspx' id='1' target='_blank' method='get' class='form-control'>")
       
        Dim i As Integer
        
        
        'LECTURA DE DATOS DE CONSULTA
        
        Do While sqlReader.Read()
            Dim nombre As String
            
            nombre = sqlReader.GetString(0)
            
            'generar PFD para Descarga de USUARIO.
            
            
          
            
            
' IMPRIMIR RESULTADOS DE LA PANATALLA     
            i = i + 1
        
            Response.Write(" <tr>   ")
          
            Response.Write("<td class='table'><input  class='form-control' placeholder='" + nombre + "'value='" + nombre + "'id='" + i.ToString + "'></input></td>") 'aki va el nombre 
   
        
        
            Response.Write("<td class='table'>")
       
            Response.Write("<Button class='btn btn-primary'><a target='_blank' href='verResultado.aspx?nombre=" + nombre + "'style='color:#fff;'>DESCARGAR PDF<a></button>")
      
            Response.Write("</td>")
    
            Response.Write("<td><Button class='btn btn-success'><a href='verResult.aspx?nombre="+nombre+"'style='color:#fff;'>VER RESULTADOS<a></button></td>")
           
            Response.Write(" </tr>   ")

        Loop
    End If
 Response.Write("</form>")
    %>



    </table>

        <!--    =).......FIN TABLA DE PERSONAS POR PLANTA .....=)  -->

</center>

        <!--    =)....... FIN DE CENTRO DE PAGINA (MAQUETACIÓN HTML5).....=)  -->

</div>
	
</body>
</html>
