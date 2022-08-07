<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
    <title>Gestion Market - Tarjeta Generada</title>
    
   
<style>

.tablalistado {
	display: table;
}

.tablatitulo {
	display: table-caption;
	text-align: left;
	font-weight: bold;
	font-size:large;
	font-family: "Segoe UI", "Segoe UI Web Regular", "Segoe UI Symbol",
		"Helvetica Neue", "BBAlpha Sans", "S60 Sans", Arial, sans-serif;
}

.tablaencabezado {
	display: table-row;
	font-weight: bold;
	text-align: center;
	font-family: "Segoe UI", "Segoe UI Web Regular", "Segoe UI Symbol",
		"Helvetica Neue", "BBAlpha Sans", "S60 Sans", Arial, sans-serif;
}

.tablafila {
	display: table-row;
	font-family: "Segoe UI", "Segoe UI Web Regular", "Segoe UI Symbol",
		"Helvetica Neue", "BBAlpha Sans", "S60 Sans", Arial, sans-serif;
	width:100%;
}

.tablacelda {
	display: table-cell;
	border: solid;
	border-width: thin;
	padding: 7px;
	border-left: none;
    border-right: none;
}

.inputclass{
	font-family: "Segoe UI", "Segoe UI Web Regular", "Segoe UI Symbol",
		"Helvetica Neue", "BBAlpha Sans", "S60 Sans", Arial, sans-serif;
	font-size:large;
	padding: 2px;
	width:75px;
}

.activado{
    background-color: white;
}
</style>
    
 </head>

<body>



	<%  
	  String textoencriptado = (String) request.getAttribute("textoencriptado");
	  String textoencriptadoanterior = (String) request.getAttribute("textoencriptadoanterior");
	  String numeroencriptado = (String) request.getAttribute("numeroencriptado");
	  String comercio = (String) request.getAttribute("comercio");
	  String textorecarga = (String) request.getAttribute("textorecarga");
	  String fecha = (String) request.getAttribute("fecha");
	%>

    
	<div class="tablalistado">
		<div  class="tablafila">        
	    	<div class="tablacelda" align="left" style="border: none;">
				<span style="font-size: 30px; float:left;margin-top:20px;">Gestion Market</span><span style="font-size: large; float:right;margin-top:20px;"><img src="<%=basePath %>/img/logo.jpg"/></span>
			</div>
		</div>
		<div  class="tablafila">        
	    	<div class="tablacelda" align="left" style="border: none;">
				 <span style="font-size: large; float:left;margin-top:20px;">Se genero la tarjeta para el comercio <b><%=comercio%></b></span>
			</div>
		</div>
		<div  class="tablafila">        
	    	<div class="tablacelda" align="left" style="border: none;">
				 <span style="font-size: large; float:left;"><%=textorecarga %></span>
			</div>
		</div>
		<div  class="tablafila">        
	    	<div class="tablacelda" align="left" style="border: none;">
				 <span style="font-size: large; float:left;">Fecha de emision &nbsp;&nbsp;<%=fecha %></span>
			</div>
		</div>
		<div  class="tablafila">        
	    	<div class="tablacelda" align="left" style="border: none;">
				 <span style="font-size: large; float:left;">V.A&nbsp;&nbsp;<%=textoencriptadoanterior %></span>
			</div>
		</div>
		<div  class="tablafila">        
	    	<div class="tablacelda" align="left" style="border: none;">
				 <span style="font-size: large; float:left;margin-top:40px;">Clave&nbsp;&nbsp;&nbsp;&nbsp;</span> <span style="font-size: xx-large; float:left;margin-top:25px;"><%=textoencriptado %></span>
			</div>
	
		</div>
		<div  class="tablafila">        
	    	<div class="tablacelda" align="left" style="border: none;">
				 <span style="font-size: large; float:left;margin-top:40px;">Clave numerica&nbsp;&nbsp;<%=numeroencriptado %></span>
			</div>
		</div>
		<div  class="tablafila">        
	    	<div class="tablacelda" align="left" style="border: none;">
				<img src="<%=basePath %>/output.png"/>
			</div>
		</div>
	</div>

 
</body>
</html>
