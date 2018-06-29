<?php

	function db_conectar ()
	{
		$host = "localhost";
		$user = "root";
		$password = "root";
		$db = "clta_ferre";
		$coneccion = new mysqli($host,$user,$password,$db);
		mysqli_query($coneccion, "SET NAMES 'utf8'");
		return $coneccion;
	}

	function db_sessionValidarYES ()
	{
		session_start();
  		if (isset($_SESSION['users_id'])){ echo '<script>location.href = "control.php"</script>';}
	}

	function db_sessionValidarNO ()
	{
		session_start();
  		if (isset($_SESSION['users_id']) == false){ echo '<script>location.href = "index.php"</script>';}
	}

	function db_sessionDestroy ()
	{
		session_start();
		session_destroy();
		echo '<script>location.href = "/"</script>';
	}

	function AddLog($contenido)
	{
		session_start();
	  	$userid = $_SESSION['usuario'];
		$contenido = strtoupper($contenido);
		$date_time = date("Y-m-d H:i:s");
		mysql_query("insert into logs (user, fecha, registro) values ('$userid', '$date_time', '$contenido')");
	}

	function returnproducts ($departamento)
	{
		//Regesamos los ultimos 2 productos agregados
		$data = mysqli_query(db_conectar(),"SELECT p.id, p.nombre, p.foto0, p.oferta, p.precio_normal, p.precio_oferta FROM productos p WHERE p.departamento = '$departamento' ORDER by p.id desc LIMIT 0, 2 ");
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
	        $precio = "";
	        $oferta = "";
	        if ($row[3] == 1)
	        {
	        	$precio = $row[5];
	        	$oferta = "<strong style='color:#FF0000';>OFERTA!</strong> ";
	        }else
	        {
	        	$precio = $row[4];
	        }

	        $body = $body.'<li><a href="producto.php/?id='.$row[0].'"><img src = "images/'.$row[2].'" style="
	        	height: 40px;
			    width: 40px;
			    background-repeat: no-repeat;
			    background-position: 50%;
			    border-radius: 50%;
			    background-size: 100% auto;
			    "> '.$oferta.substr($row[1],0,28).' ... <strong>$ '.$precio.'</strong></a></li>';
	    }
		return $body;
	}

	function ReturnProductsOferta ()
	{
		//Regesamos los ultimos 2 productos agregados
		$data = mysqli_query(db_conectar(),"SELECT p.id, p.nombre, p.foto0, p.oferta, p.precio_normal, p.precio_oferta FROM productos p WHERE p.oferta = 1 ORDER by p.id desc LIMIT 0, 24");
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
	        $body = $body. "<ul class='single-mega-item'>";
	        $oferta = "<strong style='color:#1E90FF';>OFERTA!</strong> ";
	        $body = $body.'<li><a href="producto.php/?id='.$row[0].'"><img src = "images/'.$row[2].'" style="
	        	height: 40px;
			    width: 40px;
			    background-repeat: no-repeat;
			    background-position: 50%;
			    border-radius: 50%;
			    background-size: 100% auto;
			    "> '.$oferta.substr($row[1],0,28).' ... <strong style=color:#FF0000;>$ '.$row[5].'</strong> antes $'.$row[4].'</a></li>';
		    $body = $body."</ul>";
	    }
		return $body;
	}

	function ReturnNewsProductsList()
	{
		$data = mysqli_query(db_conectar(),"SELECT p.id, p.nombre, p.foto0, p.oferta, p.precio_normal, p.precio_oferta FROM productos p ORDER by p.id desc LIMIT 0, 4");
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
	        $precio = "";
	        $oferta = "";
	        if ($row[3] == 1)
	        {
	        	$precio = $row[5];
	        	$oferta = "<strong style='color:#FF0000';>OFERTA!</strong> ";
	        }else
	        {
	        	$precio = $row[4];
	        }

	        $body = $body.'<li><a href="producto.php/?id='.$row[0].'"><img src = "images/'.$row[2].'" style="
	        	height: 60px;
			    width: 60px;
			    background-repeat: no-repeat;
			    background-position: 50%;
			    border-radius: 50%;
			    background-size: 100% auto;
			    "> '.$oferta.substr($row[1],0,40).' ... <strong>$ '.$precio.'</strong></a></li>';
	    }
		return $body;
	}

	function Select_Almacen ()
	{
		$data = mysqli_query(db_conectar(),"SELECT id, nombre FROM almacen ORDER by nombre asc");
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
	        $body = $body.'<option value='.$row[0].'>'.$row[1].'</option>';
	    }
		return $body;
	}

	function Select_Departamento ()
	{
		$data = mysqli_query(db_conectar(),"SELECT id, nombre FROM departamentos ORDER by nombre asc");
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
	        $body = $body.'<option value='.$row[0].'>'.$row[1].'</option>';
	    }
		return $body;
	}
?>
