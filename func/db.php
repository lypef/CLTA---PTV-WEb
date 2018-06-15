<?php
	$host = "localhost";
	$user = "root";
	$password = "";
	$db = "clta_ferre";
	mysql_connect($host,$user,$password);
	mysql_select_db($db);

	function AddLog($contenido)
	{
		session_start();
	  $userid = $_SESSION['usuario'];
		$contenido = strtoupper($contenido);
		$date_time = date("Y-m-d H:i:s");
		mysql_query("insert into logs (user, fecha, registro) values ('$userid', '$date_time', '$contenido')");
	}


?>
