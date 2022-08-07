<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Gestion Market - Generador de Tarjetas</title>
    
    
<style>

.tablalistado {
	display: table;
}

.tablatitulo {
	display: table-caption;
	text-align: center;
	font-weight: bold;
	font-size:x-large;
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
	<h3>GESTION MARKET - generacion de tarjetas</h3>
	<br>
 	
 <script>

function enviar(){
	
	document.forms["forma"].submit();
}

</script>	
 	
	<form id="forma" name="forma" action="processAction" namespace="/analizador">
	    <label style="font-size:20px;">Ingrese nombre del comercio:</label>
	    <br><br>
	    <input type="text" name="comercio" id="comercio" style="font-size:20px;"/>
		<br><br>
		<label style="font-size:20px;">Ingrese clave de generacion:</label>
	    <br><br>
	    <input type="text"  name="clavecodigo" id="clavecodigo" style="font-size:20px;"/>
		<br><br>
		<select id="diastarjeta" name="diastarjeta" style="font-size:20px;">
			<option value="030" selected >30 dias</option>
			<option value="180" >180 dias</option>
			<option value="360" >360 dias</option>
		</select>
		<br><br>

 	</form>

	<input type="button"  onclick="javascript:enviar();" value="iniciar el proceso de generacion" style="font-size:20px;"/>

</body>
</html>
