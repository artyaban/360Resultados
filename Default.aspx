<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Import Namespace="System.Data" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 5.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Mex-Q 360*</title>


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
	position: fixed; 
	background-color: #fff;


    }
 .image1{position:relative;height:90%; width:10%; text-align: left; float: left; }
 .image2{position:relative;height:80%; width:15%; text-align: right; float: right;}
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
center{background-color: #fff;}
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

<header class="col-xs-12">
<hr />

<img src="360.fw.png"   class="image1 img-responsive" >

<h1 align="center"style="position:fixed;height:auto;width:100%;" class="col-xs-8"><small>RESULTADOS EVALUACIÓN</small>  </h1>
<img id="img2" src="mexq.fw.png"  class="image2 img-responsive">
    <hr />

</header>
<br><br><br><br><br><br><br><br>
<!-- IMAGENES DEL FONDO MEXQ-->

    <br />  <br />  <br />  <br /><br />
    <div class="col-xs-4"></div>
<div class="col-xs-4" >
   
    <form runat="server">
      <h2 ><small>Elije la planta para ver los evaluados  :  </small>  <asp:DropDownList  class="form-control" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="planta" DataValueField="planta"></asp:DropDownList>
      </h2> <asp:Button ID="Button1" Class="btn btn-success" runat="server" Text="VER RESULTADOS" OnClick="Button1_Click1" />


        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:MEXQAppPrConnectionString %>' SelectCommand="select planta from evaluacion_empleados group by planta"></asp:SqlDataSource>
    </form>
</div>

 <div class="col-xs-4"></div>
	
</body>
</html>
