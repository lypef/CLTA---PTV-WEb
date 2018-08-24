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
  		if (isset($_SESSION['users_id'])){ echo '<script>location.href = "products.php"</script>';}
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

	function db_sessionDestroy_login ()
	{
		session_start();
		session_destroy();
		echo '<script>location.href = "/login.php"</script>';
	}

	function AddLog($contenido)
	{
		session_start();
	  	$userid = $_SESSION['usuario'];
		$contenido = strtoupper($contenido);
		$date_time = date("Y-m-d H:i:s");
		mysql_query("insert into logs (user, fecha, registro) values ('$userid', '$date_time', '$contenido')");
	}

	function DescontarProductosStock ($id, $unidades)
	{
		mysqli_query(db_conectar(),"UPDATE `productos` SET stock = stock - '$unidades' WHERE id = $id;");
	}

	function DescontarProductosStock_hijo ($id, $unidades)
	{
		mysqli_query(db_conectar(),"UPDATE `productos_sub` SET stock = stock - '$unidades' WHERE id = $id;");
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

	        $body = $body.'<li><a href="products_detail.php?id='.$row[0].'"><img src = "images/'.$row[2].'" style="
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
	        $body = $body.'<li><a href="products_detail.php?id='.$row[0].'"><img src = "images/'.$row[2].'" style="
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

	        $body = $body.'<li><a href="products_detail.php?id='.$row[0].'" target="_blank"><img src = "images/'.$row[2].'" style="
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

	function Almacen_ubicacion_p_sub ($id)
	{
		$data = mysqli_query(db_conectar(),"SELECT a.nombre , p.ubicacion FROM productos_sub p, almacen a where p.almacen = a.id and p.id = $id ");
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
	        $body = substr($row[0],0,3) . ', ' . $row[1];
	    }
		return $body;
	}
	
	function Select_Almacen ()
	{
		$data = mysqli_query(db_conectar(),"SELECT id, nombre FROM almacen ORDER by nombre asc");
		$body = "<option value='0'>LISTA DE ALMACENES</option>";
		while($row = mysqli_fetch_array($data))
	    {
	        $body = $body.'<option value='.$row[0].'>'.$row[1].'</option>';
	    }
		return $body;
	}

	function validateFolioVenta ($folio)
	{
		$data = mysqli_query(db_conectar(),"SELECT pedido FROM folio_venta WHERE folio = '$folio'");
		while($row = mysqli_fetch_array($data))
		{
			$value = $row[0];
		}
		if ($value)
		{
			echo '<script>location.href = "/sale_order.php?pagina=1?folio='.$folio.'"</script>';
		}
	}

	function validateFolioVentaBack ($folio)
	{
		$data = mysqli_query(db_conectar(),"SELECT pedido FROM folio_venta WHERE folio = '$folio'");
		while($row = mysqli_fetch_array($data))
		{
			$value = $row[0];
		}
		if (!$value)
		{
			echo '<script>location.href = "/products.php?pagina=1"</script>';
		}
	}

	function validateFolioVentaBack_cot ($folio)
	{
		$data = mysqli_query(db_conectar(),"SELECT cotizacion FROM folio_venta WHERE folio = '$folio'");
		while($row = mysqli_fetch_array($data))
		{
			$value = $row[0];
		}
		if (!$value)
		{
			echo '<script>location.href = "/products.php?pagina=1"</script>';
		}
	}

	function Select_Almacen_cero ()
	{
		$data = mysqli_query(db_conectar(),"SELECT id, nombre FROM almacen ORDER by nombre asc");
		$body = "<option value=''>LISTA DE ALMACENES</option>";
		while($row = mysqli_fetch_array($data))
	    {
	        $body = $body.'<option value='.$row[0].'>'.$row[1].'</option>';
	    }
		return $body;
	}

	function Select_Almacen_ALL ()
	{
		$data = mysqli_query(db_conectar(),"SELECT id, nombre FROM almacen ORDER by nombre asc");
		$body = "<option value=''>TODOS LOS ALMACENES</option>";
		while($row = mysqli_fetch_array($data))
	    {
	        $body = $body.'<option value='.$row[0].'>'.$row[1].'</option>';
	    }
		return $body;
	}

	function Select_Marca ()
	{
		$data = mysqli_query(db_conectar(),"SELECT DISTINCT marca FROM `productos` ORDER BY marca ASC");
		$body = "<option value=''>TODAS LAS MARCAS</option>";
		while($row = mysqli_fetch_array($data))
	    {
			if ($row[0])
			{
				$body = $body.'<option value='.$row[0].'>'.$row[0].'</option>';
			}
	    }
		return $body;
	}

	function Select_Proveedor ()
	{
		$data = mysqli_query(db_conectar(),"SELECT DISTINCT proveedor FROM `productos` ORDER BY marca ASC");
		$body = "<option value=''>TODOS LOS PROVEEDORES</option>";
		while($row = mysqli_fetch_array($data))
	    {
			if ($row[0])
			{
				$body = $body.'<option value='.$row[0].'>'.$row[0].'</option>';
			}
	    }
		return $body;
	}

	function Return_NombreAlmacen ($id)
	{
		$data = mysqli_query(db_conectar(),"SELECT nombre FROM almacen where id = $id ");
		while($row = mysqli_fetch_array($data))
	    {
			$body = $row[0];
	    }
		return $body;
	}

	function Return_NombreProduct ($id)
	{
		$data = mysqli_query(db_conectar(),"SELECT nombre FROM productos where id = $id ");
		while($row = mysqli_fetch_array($data))
	    {
			$body = $row[0];
	    }
		return $body;
	}

	function Select_products ()
	{
		$data = mysqli_query(db_conectar(),"SELECT id, nombre, `no. De parte` FROM productos ORDER by nombre asc");
		$body = "<option value='0'>LISTA DE PRODUCTOS</option>";
		while($row = mysqli_fetch_array($data))
	    {
	        $body = $body.'<option value='.$row[0].'>'.$row[1].' | NO. PARTE: '.$row[2].'</option>';
	    }
		return $body;
	}
	
	function Select_Usuarios ()
	{
		$data = mysqli_query(db_conectar(),"SELECT id, nombre FROM users ORDER by nombre asc");
		$body = "<option value='0'>LISTA DE USUARIOS</option>";
		while($row = mysqli_fetch_array($data))
	    {
	        $body = $body.'<option value='.$row[0].'>'.$row[1].'</option>';
	    }
		return $body;
	}

	function Select_sucursales ()
	{
		$data = mysqli_query(db_conectar(),"SELECT id, nombre FROM sucursales ORDER by nombre asc");
		$body = "<option value='0'>LISTA DE SUCURSALES</option>";
		while($row = mysqli_fetch_array($data))
	    {
	        $body = $body.'<option value='.$row[0].'>'.$row[1].'</option>';
	    }
		return $body;
	}

	function Select_sucursales_Add_user ()
	{
		$data = mysqli_query(db_conectar(),"SELECT id, nombre FROM sucursales ORDER by nombre asc");
		$body = "<option value=''>LISTA DE SUCURSALES</option>";
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

	function _getProducts ($pagina)
	{
		$login = false;
		$icons_edit = "";

		if (isset($_SESSION['users_id'])){ $login = true;}
		
		$TAMANO_PAGINA = 16;

		if (!$pagina) {
			$inicio = 0;
			$pagina = 1;
		}
		else {
			$inicio = ($pagina - 1) * $TAMANO_PAGINA;
		}
		
		
		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id, `no. De parte` FROM productos order by id asc LIMIT $inicio, $TAMANO_PAGINA");
		$datatmp = mysqli_query(db_conectar(),"SELECT id FROM productos");

		$pagination = '<div class="row">
						<div class="col-md-12">
						<div class="shop-pagination p-10 text-center">
							<ul>';

		
		$num_total_registros = mysqli_num_rows($datatmp);
		$total_paginas = ceil($num_total_registros / $TAMANO_PAGINA);

		if ($pagina > 1)
		{
			$pagination = $pagination . '<li><a href="?pagina='.($pagina - 1 ).'" ><i class="zmdi zmdi-chevron-left"></i></a></li>';
		}
	
		if ($total_paginas > 1) {

			for ($i=1;$i<=$total_paginas;$i++) {
				if ($pagina == $i)
					$pagination = $pagination . '<li><a href="#">...</a></li>';
				else
					$pagination = $pagination . '<li><a href="?pagina='.$i.'">'.$i.'</a></li>';
			}
		}
		if ($pagina < $total_paginas)
		{
			$pagination = $pagination . '<li><a href="?pagina='.($pagina + 1 ).'" ><i class="zmdi zmdi-chevron-right"></i></a></li>';
		}
		
		$pagination = $pagination . '</ul>
									</div>
									</div>
									</div><p>';
		$body = '<div class="row">
					<div class="col-md-12">
						<div class="section-title-2 text-uppercase mb-40 text-center">
							<h4>LISTA DE PRODUCTOS</h4>
						</div>
					</div>
				</div>';
		$body = $body . $pagination;

		while($row = mysqli_fetch_array($data))
	    {
		  if ($login)
		  {
			if ($_SESSION['product_gest'] == 1)
			{
				$icons_edit = 
				'<a href="#" title="Edicion rapida" data-toggle="modal" data-target="#edit_flash'.$row[9].'">
					<i class="zmdi zmdi-flash"></i>
				</a>
				<a href="/products_edit.php?id='.$row[9].'&url='.$_SERVER['REQUEST_URI'].'" title="Editar">
					<i class="zmdi zmdi-edit"></i>
				</a>
				';
			}else {$icons_edit = '';}

		  }

		  $precio = $row[3];
			$msg_oferta = "";
			$_stock = '<p>Stock: '.$row[1].' UD</p>';

			if ($row[2] == 1)
			{
				$precio = $row[4];
				$msg_oferta = '<span class="new-label red-color text-uppercase">off</span>';
				$_stock = '<p>Stock: '.$row[1].' UD  | Antes $ '.$row[3].' MXN</p>';
			}

	        $body = $body.'<div class="col-md-3">
                                    
			<div class="single-product mb-40">
				<div class="product-img-content mb-20">
					<div class="product-img">
						<a href="/products_detail.php?id='.$row[9].'">
							<img src="../images/'.$row[5].'" alt="">
						</a>
					</div>
					'.$msg_oferta.'
					<div class="product-action text-center">
						<a href="#" title="Ver detalles" data-toggle="modal" data-target="#viewM'.$row[9].'">
							<i class="zmdi zmdi-eye"></i>
						</a>
						'.$icons_edit.'
					</div>
				</div>
				<div class="product-content text-center text-uppercase">
					<a href="/products_detail.php?id='.$row[9].'" title="'.$row[0].'">Parte NO: '.$row[10].'<br>'.substr($row[0], 0, 25).'.</a>
					<div class="rating-icon">
						'.$_stock.'
					</div>
					<div class="product-price">
						<span class="new-price">$ '.$precio.' MXN</span>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		';
		}
		$body = $body . $pagination;
		return $body;
	}

	function _getProducts_sale ($pagina, $folio)
	{
		$login = false;
		$icons_edit = "";

		if (isset($_SESSION['users_id'])){ $login = true;}
		
		$TAMANO_PAGINA = 16;

		if (!$pagina) {
			$inicio = 0;
			$pagina = 1;
		}
		else {
			$inicio = ($pagina - 1) * $TAMANO_PAGINA;
		}
		
		
		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id, `no. De parte` FROM productos order by id asc LIMIT $inicio, $TAMANO_PAGINA");
		$datatmp = mysqli_query(db_conectar(),"SELECT id FROM productos");

		$pagination = '<div class="row">
						<div class="col-md-12">
						<div class="shop-pagination p-10 text-center">
							<ul>';

		
		$num_total_registros = mysqli_num_rows($datatmp);
		$total_paginas = ceil($num_total_registros / $TAMANO_PAGINA);

		if ($pagina > 1)
		{
			$pagination = $pagination . '<li><a href="?folio='.$folio.'&?pagina='.($pagina - 1 ).'" ><i class="zmdi zmdi-chevron-left"></i></a></li>';
		}
	
		if ($total_paginas > 1) {

			for ($i=1;$i<=$total_paginas;$i++) {
				if ($pagina == $i)
					$pagination = $pagination . '<li><a href="#">...</a></li>';
				else
					$pagination = $pagination . '<li><a href="?folio='.$folio.'&pagina='.$i.'">'.$i.'</a></li>';
			}
		}
		if ($pagina < $total_paginas)
		{
			$pagination = $pagination . '<li><a href="?folio='.$folio.'&pagina='.($pagina + 1 ).'" ><i class="zmdi zmdi-chevron-right"></i></a></li>';
		}
		
		$pagination = $pagination . '</ul>
									</div>
									</div>
									</div><p>';
		$body = '<div class="row">
		<div class="col-md-12">
		<div class="section-title-2 text-uppercase mb-40 text-center">
		<h4>AGREGUE PRODUCTOS A SU VENTA: '.$folio.'</h4>
		</div>
	</div>
	<div class="col-md-12">
		<div class="col-md-8">
			<form class="header-search-box" action="sale.php">
			<div>
				<input type="text" placeholder="Buscar" name="search" autocomplete="off">
				<input type="hidden" id="folio" name="folio" value="'.$folio.'">
			</div>
			
		</div>
		<div class="col-md-4">
			<button class="submit-btn" type="submit">Buscar</button>
			<a href="#" title="Agregar producto generico" data-toggle="modal" data-target="#add_car_generic">
				<button class="submit-btn" type="submit">+ Producto generico</button>
			</a>
			</form>
		</div>
	</div>';
		$body = $body . $pagination;

		while($row = mysqli_fetch_array($data))
	    {
		  $precio = $row[3];
			$msg_oferta = "";
			$_stock = '<p>Stock: '.$row[1].' UD</p>';

			if ($row[2] == 1)
			{
				$precio = $row[4];
				$msg_oferta = '<span class="new-label red-color text-uppercase">off</span>';
				$_stock = '<p>Stock: '.$row[1].' UD  | Antes $ '.$row[3].' MXN</p>';
			}

	        $body = $body.'<div class="col-md-3">
                                    
			<div class="single-product mb-40">
				<div class="product-img-content mb-20">
					<div class="product-img">
						<a href="/products_detail.php?id='.$row[9].'">
							<img src="../images/'.$row[5].'" alt="">
						</a>
					</div>
					'.$msg_oferta.'
					<div class="product-action text-center">
						<a href="#" title="Ver detalles" data-toggle="modal" data-target="#add_car'.$row[9].'">
							<i class="zmdi zmdi-shopping-cart"></i>
						</a>
						<a href="#" title="Ver detalles" data-toggle="modal" data-target="#viewM'.$row[9].'">
							<i class="zmdi zmdi-eye"></i>
						</a>
					</div>
				</div>
				<div class="product-content text-center text-uppercase">
					<a href="product-details.html" title="'.$row[0].'">Parte NO: '.$row[10].'<br>'.substr($row[0], 0, 25).'.</a>
					<div class="rating-icon">
						'.$_stock.'
					</div>
					<div class="product-price">
						<span class="new-price">$ '.$precio.' MXN</span>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		';
		}
		$body = $body . $pagination;
		return $body;
	}

	function _getProducts_cot ($pagina, $folio)
	{
		$login = false;
		$icons_edit = "";

		if (isset($_SESSION['users_id'])){ $login = true;}
		
		$TAMANO_PAGINA = 16;

		if (!$pagina) {
			$inicio = 0;
			$pagina = 1;
		}
		else {
			$inicio = ($pagina - 1) * $TAMANO_PAGINA;
		}
		
		
		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id, `no. De parte` FROM productos order by id asc LIMIT $inicio, $TAMANO_PAGINA");
		$datatmp = mysqli_query(db_conectar(),"SELECT id FROM productos");

		$pagination = '<div class="row">
						<div class="col-md-12">
						<div class="shop-pagination p-10 text-center">
							<ul>';

		
		$num_total_registros = mysqli_num_rows($datatmp);
		$total_paginas = ceil($num_total_registros / $TAMANO_PAGINA);

		if ($pagina > 1)
		{
			$pagination = $pagination . '<li><a href="?folio='.$folio.'&?pagina='.($pagina - 1 ).'" ><i class="zmdi zmdi-chevron-left"></i></a></li>';
		}
	
		if ($total_paginas > 1) {

			for ($i=1;$i<=$total_paginas;$i++) {
				if ($pagina == $i)
					$pagination = $pagination . '<li><a href="#">...</a></li>';
				else
					$pagination = $pagination . '<li><a href="?folio='.$folio.'&pagina='.$i.'">'.$i.'</a></li>';
			}
		}
		if ($pagina < $total_paginas)
		{
			$pagination = $pagination . '<li><a href="?folio='.$folio.'&pagina='.($pagina + 1 ).'" ><i class="zmdi zmdi-chevron-right"></i></a></li>';
		}
		
		$pagination = $pagination . '</ul>
									</div>
									</div>
									</div><p>';
		$body = '<div class="row">
					<div class="col-md-12">
						<div class="section-title-2 text-uppercase mb-40 text-center">
							<h4>AGREGUE PRODUCTOS A SU COTIZACION: '.$folio.'</h4>
						</div>
					</div>
					<div class="col-md-12">
						<div class="col-md-8 text-center">
							<form class="header-search-box" action="sale_cot.php">
							<div>
								<input type="text" placeholder="Buscar" name="search" autocomplete="off">
								<input type="hidden" id="folio" name="folio" value="'.$folio.'">
							</div>
							
						</div>
						<div class="col-md-4 text-right">
							<button class="submit-btn" type="submit">Buscar</button>
							<a href="#" title="Agregar producto generico" data-toggle="modal" data-target="#add_car_generic">
								<button class="submit-btn" type="submit">+ Producto generico</button>
							</a>
							</form>
						</div>
					</div>
				</div>';
		$body = $body . $pagination;

		while($row = mysqli_fetch_array($data))
	    {
		  $precio = $row[3];
			$msg_oferta = "";
			$_stock = '<p>Stock: '.$row[1].' UD</p>';

			if ($row[2] == 1)
			{
				$precio = $row[4];
				$msg_oferta = '<span class="new-label red-color text-uppercase">off</span>';
				$_stock = '<p>Stock: '.$row[1].' UD  | Antes $ '.$row[3].' MXN</p>';
			}

	        $body = $body.'<div class="col-md-3">
                                    
			<div class="single-product mb-40">
				<div class="product-img-content mb-20">
					<div class="product-img">
						<a href="/products_detail.php?id='.$row[9].'">
							<img src="../images/'.$row[5].'" alt="">
						</a>
					</div>
					'.$msg_oferta.'
					<div class="product-action text-center">
						<a href="#" title="Ver detalles" data-toggle="modal" data-target="#add_car'.$row[9].'">
							<i class="zmdi zmdi-shopping-cart"></i>
						</a>
						<a href="#" title="Ver detalles" data-toggle="modal" data-target="#viewM'.$row[9].'">
							<i class="zmdi zmdi-eye"></i>
						</a>
					</div>
				</div>
				<div class="product-content text-center text-uppercase">
					<a href="product-details.html" title="'.$row[0].'">Parte NO: '.$row[10].'<br>'.substr($row[0], 0, 25).'.</a>
					<div class="rating-icon">
						'.$_stock.'
					</div>
					<div class="product-price">
						<span class="new-price">$ '.$precio.' MXN</span>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		';
		}
		$body = $body . $pagination;
		return $body;
	}

	function _getProducts_sale_order ($pagina, $folio)
	{
		$login = false;
		$icons_edit = "";

		if (isset($_SESSION['users_id'])){ $login = true;}
		
		$TAMANO_PAGINA = 16;

		if (!$pagina) {
			$inicio = 0;
			$pagina = 1;
		}
		else {
			$inicio = ($pagina - 1) * $TAMANO_PAGINA;
		}
		
		
		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id, `no. De parte` FROM productos order by id asc LIMIT $inicio, $TAMANO_PAGINA");
		$datatmp = mysqli_query(db_conectar(),"SELECT id FROM productos");

		$pagination = '<div class="row">
						<div class="col-md-12">
						<div class="shop-pagination p-10 text-center">
							<ul>';

		
		$num_total_registros = mysqli_num_rows($datatmp);
		$total_paginas = ceil($num_total_registros / $TAMANO_PAGINA);

		if ($pagina > 1)
		{
			$pagination = $pagination . '<li><a href="?folio='.$folio.'&?pagina='.($pagina - 1 ).'" ><i class="zmdi zmdi-chevron-left"></i></a></li>';
		}
	
		if ($total_paginas > 1) {

			for ($i=1;$i<=$total_paginas;$i++) {
				if ($pagina == $i)
					$pagination = $pagination . '<li><a href="#">...</a></li>';
				else
					$pagination = $pagination . '<li><a href="?folio='.$folio.'&pagina='.$i.'">'.$i.'</a></li>';
			}
		}
		if ($pagina < $total_paginas)
		{
			$pagination = $pagination . '<li><a href="?folio='.$folio.'&pagina='.($pagina + 1 ).'" ><i class="zmdi zmdi-chevron-right"></i></a></li>';
		}
		
		$pagination = $pagination . '</ul>
									</div>
									</div>
									</div><p>';
		$body = '<div class="row">
		<div class="col-md-12">
		<div class="section-title-2 text-uppercase mb-40 text-center">
			<h4>AGREGUE PRODUCTOS A PEDIR, FOLIO: '.$folio.'</h4>
		</div>
	</div>
	<div class="col-md-12">
		<div class="col-md-8">
			<form class="header-search-box" action="sale_order.php">
			<div>
				<input type="text" placeholder="Buscar" name="search" autocomplete="off">
				<input type="hidden" id="folio" name="folio" value="'.$folio.'">
			</div>
			
		</div>
		<div class="col-md-4">
			<button class="submit-btn" type="submit">Buscar</button>
			<a href="#" title="Agregar producto generico" data-toggle="modal" data-target="#add_car_generic">
				<button class="submit-btn" type="submit">+ Producto generico</button>
			</a>
			</form>
		</div>
	</div>
				</div>';
		$body = $body . $pagination;

		while($row = mysqli_fetch_array($data))
	    {
		    $precio = $row[3];
			$msg_oferta = "";
			$_stock = '<p>Stock: '.$row[1].' UD</p>';

			if ($row[2] == 1)
			{
				$precio = $row[4];
				$msg_oferta = '<span class="new-label red-color text-uppercase">off</span>';
				$_stock = '<p>Stock: '.$row[1].' UD  | Antes $ '.$row[3].' MXN</p>';
			}

	        $body = $body.'<div class="col-md-3">
                                    
			<div class="single-product mb-40">
				<div class="product-img-content mb-20">
					<div class="product-img">
						<a href="/products_detail.php?id='.$row[9].'">
							<img src="../images/'.$row[5].'" alt="">
						</a>
					</div>
					'.$msg_oferta.'
					<div class="product-action text-center">
						<a href="#" title="Ver detalles" data-toggle="modal" data-target="#add_car'.$row[9].'">
							<i class="zmdi zmdi-shopping-cart"></i>
						</a>
						<a href="#" title="Ver detalles" data-toggle="modal" data-target="#viewM'.$row[9].'">
							<i class="zmdi zmdi-eye"></i>
						</a>
					</div>
				</div>
				<div class="product-content text-center text-uppercase">
					<a href="product-details.html" title="'.$row[0].'">Parte NO: '.$row[10].'<br>'.substr($row[0], 0, 25).'.</a>
					<div class="rating-icon">
						'.$_stock.'
					</div>
					<div class="product-price">
						<span class="new-price">$ '.$precio.' MXN</span>
					</div>
				</div>
			</div>
		</div>
		';
		}
		$body = $body . $pagination;
		return $body;
	}

	function _getProducts_saleSearch ($txt, $folio)
	{
		
		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id, `no. De parte` FROM productos where `no. De parte` like '%$txt%' or nombre like '%$txt%' or descripcion like '%$txt%' or marca like '%$txt%'or proveedor like '%$txt%' ORDER by id desc");
		
		$body = '<div class="row">
		<div class="col-md-12">
		<div class="section-title-2 text-uppercase mb-40 text-center">
		<h4>AGREGUE PRODUCTOS A SU VENTA: '.$folio.'</h4>
		</div>
	</div>
	<div class="col-md-12">
		<div class="col-md-8">
			<form class="header-search-box" action="sale.php">
			<div>
				<input type="text" placeholder="Buscar" name="search" autocomplete="off">
				<input type="hidden" id="folio" name="folio" value="'.$folio.'">
			</div>
			
		</div>
		<div class="col-md-4">
			<button class="submit-btn" type="submit">Buscar</button>
			<a href="#" title="Agregar producto generico" data-toggle="modal" data-target="#add_car_generic">
				<button class="submit-btn" type="submit">+ Producto generico</button>
			</a>
			<br><br><br><br>
			</form>
		</div>
	</div>';
		

		while($row = mysqli_fetch_array($data))
	    {
		  $precio = $row[3];
			$msg_oferta = "";
			$_stock = '<p>Stock: '.$row[1].' UD</p>';

			if ($row[2] == 1)
			{
				$precio = $row[4];
				$msg_oferta = '<span class="new-label red-color text-uppercase">off</span>';
				$_stock = '<p>Stock: '.$row[1].' UD  | Antes $ '.$row[3].' MXN</p>';
			}

	        $body = $body.'<div class="col-md-3">
                                    
			<div class="single-product mb-40">
				<div class="product-img-content mb-20">
					<div class="product-img">
						<a href="/products_detail.php?id='.$row[9].'">
							<img src="../images/'.$row[5].'" alt="">
						</a>
					</div>
					'.$msg_oferta.'
					<div class="product-action text-center">
						<a href="#" title="Ver detalles" data-toggle="modal" data-target="#add_car'.$row[9].'">
							<i class="zmdi zmdi-shopping-cart"></i>
						</a>
						<a href="#" title="Ver detalles" data-toggle="modal" data-target="#viewM'.$row[9].'">
							<i class="zmdi zmdi-eye"></i>
						</a>
					</div>
				</div>
				<div class="product-content text-center text-uppercase">
					<a href="product-details.html" title="'.$row[0].'">Parte NO: '.$row[10].'<br>'.substr($row[0], 0, 25).'.</a>
					<div class="rating-icon">
						'.$_stock.'
					</div>
					<div class="product-price">
						<span class="new-price">$ '.$precio.' MXN</span>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		';
		}
		$body = $body . $pagination;
		return $body;
	}

	function _getProducts_CotSearch ($txt, $folio)
	{
		
		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id, `no. De parte` FROM productos where `no. De parte` like '%$txt%' or nombre like '%$txt%' or descripcion like '%$txt%' or marca like '%$txt%'or proveedor like '%$txt%' ORDER by id desc");
		
		$body = '<div class="row">
		<div class="col-md-12">
		<div class="section-title-2 text-uppercase mb-40 text-center">
			<h4>AGREGUE PRODUCTOS A SU COTIZACION: '.$folio.'</h4>
		</div>
	</div>
	<div class="col-md-12">
		<div class="col-md-8 text-right">
			<form class="header-search-box" action="sale_cot.php">
			<div>
				<input type="text" placeholder="Buscar" name="search" autocomplete="off">
				<input type="hidden" id="folio" name="folio" value="'.$folio.'">
			</div>
			
		</div>
		<div class="col-md-4 text-center">
			<button class="submit-btn" type="submit">Buscar</button>
			<a href="#" title="Agregar producto generico" data-toggle="modal" data-target="#add_car_generic">
				<button class="submit-btn" type="submit">+ Producto generico</button>
			</a>
			</form>
		</div>
	</div>
</div>';
		

		while($row = mysqli_fetch_array($data))
	    {
		  $precio = $row[3];
			$msg_oferta = "";
			$_stock = '<p>Stock: '.$row[1].' UD</p>';

			if ($row[2] == 1)
			{
				$precio = $row[4];
				$msg_oferta = '<span class="new-label red-color text-uppercase">off</span>';
				$_stock = '<p>Stock: '.$row[1].' UD  | Antes $ '.$row[3].' MXN</p>';
			}

	        $body = $body.'<div class="col-md-3">
                                    
			<div class="single-product mb-40">
				<div class="product-img-content mb-20">
					<div class="product-img">
						<a href="/products_detail.php?id='.$row[9].'">
							<img src="../images/'.$row[5].'" alt="">
						</a>
					</div>
					'.$msg_oferta.'
					<div class="product-action text-center">
						<a href="#" title="Ver detalles" data-toggle="modal" data-target="#add_car'.$row[9].'">
							<i class="zmdi zmdi-shopping-cart"></i>
						</a>
						<a href="#" title="Ver detalles" data-toggle="modal" data-target="#viewM'.$row[9].'">
							<i class="zmdi zmdi-eye"></i>
						</a>
					</div>
				</div>
				<div class="product-content text-center text-uppercase">
					<a href="product-details.html" title="'.$row[0].'">Parte NO: '.$row[10].'<br>'.substr($row[0], 0, 25).'.</a>
					<div class="rating-icon">
						'.$_stock.'
					</div>
					<div class="product-price">
						<span class="new-price">$ '.$precio.' MXN</span>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		';
		}
		$body = $body . $pagination;
		return $body;
	}

	function _getProducts_saleSearch_order ($txt, $folio)
	{
		
		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id, `no. De parte` FROM productos where `no. De parte` like '%$txt%' or  nombre like '%$txt%' or descripcion like '%$txt%' or marca like '%$txt%'or proveedor like '%$txt%' ORDER by id desc");
		
		$body = '<div class="row">
		<div class="col-md-12">
		<div class="section-title-2 text-uppercase mb-40 text-center">
			<h4>AGREGUE PRODUCTOS A PEDIR, FOLIO: '.$folio.'</h4>
		</div>
	</div>
	<div class="col-md-12">
		<div class="col-md-8">
			<form class="header-search-box" action="sale_order.php">
			<div>
				<input type="text" placeholder="Buscar" name="search" autocomplete="off">
				<input type="hidden" id="folio" name="folio" value="'.$folio.'">
			</div>
			
		</div>
		<div class="col-md-4">
			<button class="submit-btn" type="submit">Buscar</button>
			<a href="#" title="Agregar producto generico" data-toggle="modal" data-target="#add_car_generic">
				<button class="submit-btn" type="submit">+ Producto generico</button>
			</a>
			</form>
		</div>
	</div>
				</div>';
		

		while($row = mysqli_fetch_array($data))
	    {
		  $precio = $row[3];
			$msg_oferta = "";
			$_stock = '<p>Stock: '.$row[1].' UD</p>';

			if ($row[2] == 1)
			{
				$precio = $row[4];
				$msg_oferta = '<span class="new-label red-color text-uppercase">off</span>';
				$_stock = '<p>Stock: '.$row[1].' UD  | Antes $ '.$row[3].' MXN</p>';
			}

	        $body = $body.'<div class="col-md-3">
                                    
			<div class="single-product mb-40">
				<div class="product-img-content mb-20">
					<div class="product-img">
						<a href="/products_detail.php?id='.$row[9].'">
							<img src="../images/'.$row[5].'" alt="">
						</a>
					</div>
					'.$msg_oferta.'
					<div class="product-action text-center">
						<a href="#" title="Ver detalles" data-toggle="modal" data-target="#add_car'.$row[9].'">
							<i class="zmdi zmdi-shopping-cart"></i>
						</a>
						<a href="#" title="Ver detalles" data-toggle="modal" data-target="#viewM'.$row[9].'">
							<i class="zmdi zmdi-eye"></i>
						</a>
					</div>
				</div>
				<div class="product-content text-center text-uppercase">
					<a href="product-details.html" title="'.$row[0].'">Parte NO: '.$row[10].'<br>'.substr($row[0], 0, 25).'.</a>
					<div class="rating-icon">
						'.$_stock.'
					</div>
					<div class="product-price">
						<span class="new-price">$ '.$precio.' MXN</span>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		';
		}
		$body = $body . $pagination;
		return $body;
	}

	function _getProductsDepartment ($departamento)
	{
		$login = false;
		$icons_edit = "";

		if (isset($_SESSION['users_id'])){ $login = true;}
		
		
		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id, `no. De parte` FROM productos where departamento = $departamento order by id desc ");
				
		$body = '<div class="row">
					<div class="col-md-12">
						<div class="section-title-2 text-uppercase mb-40 text-center">
							<h4>LISTA DE PRODUCTOS: '.DepartamentosReturnNombre($departamento).' </h4>
						</div>
					</div>
				</div>';
		

		while($row = mysqli_fetch_array($data))
	    {
		  if ($login)
		  {
			if ($_SESSION['product_gest'] == 1)
			{
				$icons_edit = 
				'<a href="#" title="Edicion rapida" data-toggle="modal" data-target="#edit_flash'.$row[9].'">
					<i class="zmdi zmdi-flash"></i>
				</a>
				<a href="/products_edit.php?id='.$row[9].'&url='.$_SERVER['REQUEST_URI'].'" title="Editar">
					<i class="zmdi zmdi-edit"></i>
				</a>';
			}else {$icons_edit = '';}
		  }

		  $precio = $row[3];
			$msg_oferta = "";
			$_stock = '<p>Stock: '.$row[1].' UD</p>';

			if ($row[2] == 1)
			{
				$precio = $row[4];
				$msg_oferta = '<span class="new-label red-color text-uppercase">off</span>';
				$_stock = '<p>Stock: '.$row[1].' UD  | Antes $ '.$row[3].' MXN</p>';
			}

	        $body = $body.'<div class="col-md-3">
                                    
			<div class="single-product mb-40">
				<div class="product-img-content mb-20">
					<div class="product-img">
						<a href="/products_detail.php?id='.$row[9].'">
							<img src="../images/'.$row[5].'" alt="">
						</a>
					</div>
					'.$msg_oferta.'
					<div class="product-action text-center">
						<a href="#" title="Ver detalles" data-toggle="modal" data-target="#viewM'.$row[9].'">
							<i class="zmdi zmdi-eye"></i>
						</a>
						'.$icons_edit.'
					</div>
				</div>
				<div class="product-content text-center text-uppercase">
					<a href="/products_detail.php?id='.$row[9].'" title="'.$row[0].'">Parte NO: '.$row[10].'<br>'.substr($row[0], 0, 25).'.</a>
					<div class="rating-icon">
						'.$_stock.'
					</div>
					<div class="product-price">
						<span class="new-price">$ '.$precio.' MXN</span>
					</div>
				</div>
			</div>
		</div>
		';
		}
		$body = $body . $pagination;
		return $body;
	}

	function _getProductsAlmacen ($almacen)
	{
		$login = false;
		$icons_edit = "";

		if (isset($_SESSION['users_id'])){ $login = true;}
		
		
		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id, `no. De parte` FROM productos where almacen = $almacen order by id desc ");
				
		$body = '<div class="row">
					<div class="col-md-12">
						<div class="section-title-2 text-uppercase mb-40 text-center">
							<h4>LISTA DE PRODUCTOS: '.AlmacenReturnNombre($almacen).' </h4>
						</div>
					</div>
				</div>';
		

		while($row = mysqli_fetch_array($data))
	    {
		  if ($login)
		  {
			if ($_SESSION['product_gest'] == 1)
			{
				$icons_edit = 
				'<a href="#" title="Edicion rapida" data-toggle="modal" data-target="#edit_flash'.$row[9].'">
					<i class="zmdi zmdi-flash"></i>
				</a>
				<a href="/products_edit.php?id='.$row[9].'&url='.$_SERVER['REQUEST_URI'].'" title="Editar">
					<i class="zmdi zmdi-edit"></i>
				</a>';
			}else {$icons_edit = '';}
		  }

		  $precio = $row[3];
			$msg_oferta = "";
			$_stock = '<p>Stock: '.$row[1].' UD</p>';

			if ($row[2] == 1)
			{
				$precio = $row[4];
				$msg_oferta = '<span class="new-label red-color text-uppercase">off</span>';
				$_stock = '<p>Stock: '.$row[1].' UD  | Antes $ '.$row[3].' MXN</p>';
			}

	        $body = $body.'<div class="col-md-3">
                                    
			<div class="single-product mb-40">
				<div class="product-img-content mb-20">
					<div class="product-img">
						<a href="/products_detail.php?id='.$row[9].'">
							<img src="../images/'.$row[5].'" alt="">
						</a>
					</div>
					'.$msg_oferta.'
					<div class="product-action text-center">
						<a href="#" title="Ver detalles" data-toggle="modal" data-target="#viewM'.$row[9].'">
							<i class="zmdi zmdi-eye"></i>
						</a>
						'.$icons_edit.'
					</div>
				</div>
				<div class="product-content text-center text-uppercase">
					<a href="product-details.html" title="'.$row[0].'">Parte NO: '.$row[10].'<br>'.substr($row[0], 0, 25).'.</a>
					<div class="rating-icon">
						'.$_stock.'
					</div>
					<div class="product-price">
						<span class="new-price">$ '.$precio.' MXN</span>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		';
		}
		$body = $body . $pagination;
		return $body;
	}

	function _getProductsSearch ($txt)
	{
		$contador = 0;
		$login = false;
		$icons_edit = "";

		if (isset($_SESSION['users_id'])){ $login = true;}
		
		
		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id, `no. De parte` FROM productos where `no. De parte` like '%$txt%' or nombre like '%$txt%' or descripcion like '%$txt%' or marca like '%$txt%'or proveedor like '%$txt%' ORDER by id desc");
				
		$body = '<div class="row">
					<div class="col-md-12">
						<div class="section-title-2 text-uppercase mb-40 text-center">
							<h4>LISTA DE PRODUCTOS : '.$txt.' </h4>
						</div>
					</div>
				</div>';
		

		while($row = mysqli_fetch_array($data))
	    {
		  $contador = $contador + 1;
		  if ($login)
		  {
			if ($_SESSION['product_gest'] == 1)
			{
				$icons_edit = 
				'<a href="#" title="Edicion rapida" data-toggle="modal" data-target="#edit_flash'.$row[9].'">
					<i class="zmdi zmdi-flash"></i>
				</a>
				<a href="/products_edit.php?id='.$row[9].'&url='.$_SERVER['REQUEST_URI'].'" title="Editar">
					<i class="zmdi zmdi-edit"></i>
				</a>';
			}else {$icons_edit = '';}
		  }

		  $precio = $row[3];
			$msg_oferta = "";
			$_stock = '<p>Stock: '.$row[1].' UD</p>';

			if ($row[2] == 1)
			{
				$precio = $row[4];
				$msg_oferta = '<span class="new-label red-color text-uppercase">off</span>';
				$_stock = '<p>Stock: '.$row[1].' UD  | Antes $ '.$row[3].' MXN</p>';
			}

	        $body = $body.'<div class="col-md-3">
                                    
			<div class="single-product mb-40">
				<div class="product-img-content mb-20">
					<div class="product-img">
						<a href="/products_detail.php?id='.$row[9].'">
							<img src="../images/'.$row[5].'" alt="">
						</a>
					</div>
					'.$msg_oferta.'
					<div class="product-action text-center">
						<a href="#" title="Ver detalles" data-toggle="modal" data-target="#viewM'.$row[9].'">
							<i class="zmdi zmdi-eye"></i>
						</a>
						'.$icons_edit.'
					</div>
				</div>
				<div class="product-content text-center text-uppercase">
					<a href="/products_detail.php?id='.$row[9].'" title="'.$row[0].'">Parte NO: '.$row[10].'<br>'.substr($row[0], 0, 25).'.</a>
					<div class="rating-icon">
						'.$_stock.'
					</div>
					<div class="product-price">
						<span class="new-price">$ '.$precio.' MXN</span>
					</div>
				</div>
			</div>
		</div>
		
		';
		}
		$body = $body . $pagination;

		if ($contador <= 0)
		{
			$body = '<center><p>
				<h3>NO CONTAMOS POR EL MOMENTO CON ESTE PRODUCTO</h3>
				<br>
				<h4>
				'.$_SESSION["empresa_nombre"].'
				<br>
				TELEFONOS: '.$_SESSION["empresa_telefono"].'
				<br>
				<br>
				'.$_SESSION["empresa_correo"].'
				</h3>
				<br>
				<br>
			</p></center>';
		}

		return $body;
	}

	function _getProductsID ($id)
	{
		
		$con = db_conectar();

		$data = mysqli_query($con,"SELECT `no. De parte`, nombre, precio_normal, precio_oferta, stock, `tiempo de entrega`, descripcion, almacen, departamento, loc_almacen, marca, proveedor, oferta, id, foto0, foto1, foto2, foto3, stock_min, stock_max, precio_costo FROM productos where id = $id ");

		while($row = mysqli_fetch_array($data))
	    {
		  	$body = '
		  	<form id="contact-form" action="func/product_update.php" method="post" enctype="multipart/form-data">
	          <div class="row">
	          	  <input type="hidden" id="id" name="id" value="'.$row[13].'">
				  <input type="hidden" id="url" name="url" value="'.$_GET['url'].'">

	              <div class="col-md-12">
	                  <div class="section-title text-uppercase mb-40">
	                      <h4>Editar producto '.$row[1].'</h4>
	                  </div>
	              </div>
	              <div class="col-md-6">
	                <label>Numero de parte</label>
	                <input type="text" name="parte" id="parte" placeholder="AEF594-S" value='.$row[0].'>
	              </div>
	              <div class="col-md-6">
	                <label>Nombre del producto</label>
	                <input type="text" name="name" id="name" placeholder="Nombre producto" value="'.$row[1].'">
	              </div>
	              
	              <div class="col-md-6">
	                <label>Stock minimo<span class="required">*</span></label>
	                <input type="number" name="stock_minimo" id="stock_minimo" placeholder="Stock minimo" value="'.$row[18].'">
				  </div>
				  
				  <div class="col-md-6">
				  <label>Stock maximo<span class="required">*</span></label>
				  <input type="number" name="stock_maximo" id="stock_maximo" placeholder="Stock minimo" value="'.$row[19].'">
				 </div>
				
				<div class="col-md-6">
	                <label>Precio normal<span class="required">*</span></label>
	                <input type="text" name="precio" id="precio" placeholder="Precio al publico" value="'.$row[2].'">
				  </div>

				<div class="col-md-6">
					<label>Precio de costo<span class="required">*</span></label>
					<input type="text" name="precio_costo" id="precio_costo" placeholder="Precio de costo" value="'.$row[20].'">
				</div>

	            <div class="col-md-6">
	                <label>Precio oferta<span class="required">*</span></label>
	                <input type="text" name="p_oferta" id="p_oferta" placeholder="Precio con oferta al publico" value="'.$row[3].'">
	            </div>

	            <div class="col-md-6">
	                <label>Unidades existentes<span class="required">*</span></label>
	                <input type="text" name="stock" id="stock" placeholder="Stock" value="'.$row[4].'">
	            </div>

	            <div class="col-md-6">
	                <label>Tiempo de entrega</label>
	                <input type="text" name="t_entrega" id="t_entrega" placeholder="1 Dia habil" value="'.$row[5].'">
	            </div>

				<div class="country-select shop-select col-md-6">
	                <label> Usar precio de oferta ? <span class="required">*</span></label>
	                <select id="use_oferta" name = "use_oferta" id="use_oferta">
	                    <option value="1">Si usar</option>
	                    <option value="0">No usar</option>
	                </select>                                       
				</div>
				
	              <div class="col-md-12">
	              <label>Ingrese  una descripcion o caracteristicas del producto</label>
	              <textarea placeholder="..." name="descripcion" id="descripcion" class="custom-textarea">'.$row[6].'</textarea>
	              </div>

	              <div class="country-select shop-select col-md-6">
	                <label> Seleccione Almacen <span class="required">*</span></label>
	                <select id="almacen" name="almacen">
	                    '.Select_Almacen().'
	                </select>                                       
	            </div>
	            
	            <div class="country-select shop-select col-md-6">
	                <label> Seleccione Departamento <span class="required">*</span></label>
	                <select id="departamento" name = "departamento">
	                    '.Select_Departamento().'
	                </select>                                       
	            </div>
	            <div class="col-md-12">
	                <br>
	                <label>Especifique ubicacion exacta en almacen</label>
	                <textarea placeholder="Anaquel b-15" name="ubicacion" id="ubicacion" class="custom-textarea">'.$row[9].'</textarea>
	            </div>
	            <div class="col-md-6">
	                <br><label>Ingres la marca del producto</label>
	                <input type="text" name="marca" id="marca" placeholder="Marca" value="'.$row[10].'">
	            </div>
	            <div class="col-md-6">
	                <br><label>Ingrese proveedor</label>
	                <input type="text" name="proveedor" id="proveedor" placeholder="Proveedor" value="'.$row[11].'">
	            </div>


	            <div class="row">
			    <div class="col-md-3">
			      <div class="thumbnail">
			        <a href="images/'.$row[14].'" target="_blank">
			          <img src="images/'.$row[14].'" alt="Imagen 1" style="width:100%" id="_img1" name="_img1">
			        </a>
			      </div>
			    </div>
			    <div class="col-md-3">
			      <div class="thumbnail">
			        <a href="images/'.$row[15].'" target="_blank">
			          <img src="images/'.$row[15].'" alt="Imagen 2" style="width:100%" id="_img2" name="_img2">
			        </a>
			      </div>
			    </div>
			    <div class="col-md-3">
			      <div class="thumbnail">
			        <a href="images/'.$row[16].'" target="_blank">
			          <img src="images/'.$row[16].'" alt="Imagen 3" style="width:100%" id="_img3" name="_img3">
			        </a>
			      </div>
			    </div>
			    
			    <div class="col-md-3">
			      <div class="thumbnail">
			        <a href="images/'.$row[17].'" target="_blank">
			          <img src="images/'.$row[17].'" alt="Imagen 4" style="width:100%" id="_img4" name="_img4">
			        </a>
			      </div>
			    </div>
			  </div>
			</div>


	            <div class="country-select shop-select col-md-6">
	                <label>Seleccione una Imagen si desea actualiza la imagen 1 <span class="required">*</span></label>
	                <input type="file" name="imagen0" id="imagen0" accept="image/jpeg,image/jpg" onclick="chargeImg(1)">
	            </div>

	            <div class="country-select shop-select col-md-6">
	                <label>Seleccione una Imagen si desea actualiza la imagen 2 <span class="required">*</span></label>
	                <input type="file" id="imagen1" name="imagen1" accept="image/jpeg,image/jpg" >
	            </div>

	            <div class="country-select shop-select col-md-6">
	                <label>Seleccione una Imagen si desea actualiza la imagen 3 <span class="required">*</span></label>
	                <input type="file" name="imagen2" id="imagen2" accept="image/jpeg,image/jpg" >
	            </div>

	            <div class="country-select shop-select col-md-6">
	                <label>Seleccione una Imagen si desea actualiza la imagen 4 <span class="required">*</span></label>
	                <input type="file" name="imagen3" id="imagen3" accept="image/jpeg,image/jpg" >
	            </div>

	            <script>
	            	document.getElementById("almacen").value = "'.$row[7].'";    
	            	document.getElementById("departamento").value = "'.$row[8].'";    
	            	document.getElementById("use_oferta").value = "'.$row[12].'";    
	            </script>
	            <div class="country-select shop-select col-md-12 text-center">
	                <button class="submit-btn mt-20" type="submit">Actualizar</button>
				</div>

	          </div>
		  </form>
		  ';
		}
		$body .= '
		<div class="col-md-12">
			<div class="section-title text-uppercase mb-20">
				<h4>Agregar afiliado</h4>
			</div>
		</div>
		
		<div class="col-md-12">
			<form id="contact-form" action="func/product_add_sub.php" method="post" enctype="multipart/form-data">
			<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
			<div class="row">
					<br><input type="hidden" id="padre" name="padre" value="'.$id.'">
					<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
					

					<div class="col-md-3">
						<label> Seleccione Almacen <span class="required">*</span></label>
						<select id="almacen" name="almacen" required>
							'.Select_Almacen_cero().'
						</select>                                       
					</div>
					
					<div class="col-md-3">
						<label>Unidades</label>
						<input type="number" name="stock" id="stock" placeholder="Stock" value="1" required>
					</div>
					<div class="col-md-3">
						<label>Ubicacion de fisica</label>
						<input type="text" name="ubicacion" id="ubicacion" placeholder="...">
					</div>

					<div class="col-md-3 text-center">
						<button class="submit-btn mt-20" type="submit">Agregar</button>
					</div>
				</div>
			</form>
		</div>
		';

		$sub = mysqli_query($con,"SELECT p.id, a.nombre, p.stock, p.ubicacion FROM productos_sub p, almacen a where p.almacen = a.id and p.padre = $id ");

		$body .= '
		<div class="col-md-12">
			<div class="section-title text-uppercase mb-40">
			<br><br><br><h4>Afiliados</h4>
			</div>
		</div>
		<div class="row">';
		while($row = mysqli_fetch_array($sub))
	    {
			$body .= '
				<div class="col-md-6">
					<form id="contact-form" action="func/product_update_sub.php" method="post">
					<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
					<div class="row">
							<br><input type="hidden" id="id" name="id" value="'.$row[0].'">
							<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">

							<div class="col-md-12">
								<div class="section-title text-uppercase mb-10">
									<h4>'.$row[1].'</h4>
								</div>
							</div>
							<div class="col-md-4 ">
								<label>Existencia</label>
								<input type="number" name="stock" id="stock" placeholder="Stock" value='.$row[2].'>
							</div>
							<div class="col-md-4 text-right">
								<button class="submit-btn mt-20" type="submit">Actualizar</button>
							</div>
							<div class="col-md-4 text-left">
								<a href="#" data-toggle="modal" data-target="#delete_hijo'.$row[0].'" >
									<button class="submit-btn mt-20" type="submit">Eliminar</button>
								</a>
							</div>
							<div class="col-md-12 ">
								<br>
								<label>Ubicacion</label>
								<input type="text" name="ubicacion" id="ubicacion" placeholder="..." value="'.$row[3].'">
							</div>
							</form>
						</div>
				</div>
			';
		}
		$body .= '</div>';

		return $body;
	}
	
	function ModelProductHijosDelete ($id)
	{
		$data = mysqli_query(db_conectar(),"SELECT * FROM `productos_sub` WHERE padre = '$id' ");

		while($row = mysqli_fetch_array($data))
	    {
		  	
			$body .= '
			<div class="modal fade" id="delete_hijo'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">ELIMINAR SUB PRODUCTO ACTUAL?</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Esta seguro de eliminar el su producto? despues de esta accion no abra posibilidad de recuperar el sub producto.</p>
				</div>
				<div class="modal-footer">
					<form action="func/product_delete_sub.php" method="post">
						<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
						<input type="hidden" id="id" name="id" value="'.$row[0].'">
						<button type="button" name="no" id="no" class="btn btn-secondary" data-dismiss="modal">NO</button>
						<button type="submit" class="btn btn-danger">SI</button>
					</form>
				</div>
				</div>
			</div>
			</div>
			';
		}
		return $body;
	}
	
	function _getProductsModal ($pagina)
	{
		$TAMANO_PAGINA = 16;

		if (!$pagina) {
			$inicio = 0;
			$pagina = 1;
		}
		else {
			$inicio = ($pagina - 1) * $TAMANO_PAGINA;
		}
		
		
		$data = mysqli_query(db_conectar(),"SELECT p.nombre, p.stock, p.oferta, p.precio_normal, p.precio_oferta, p.foto0, p.foto1, p.foto2, p.foto3, p.id, p.descripcion, p.`tiempo de entrega`, p.`no. De parte`, a.nombre, d.nombre, p.marca, p.loc_almacen FROM productos p, almacen a, departamentos d where p.almacen = a.id and p.departamento = d.id order by p.id asc LIMIT $inicio, $TAMANO_PAGINA");
		
		$con_hijos  = db_conectar();

		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			// Add hijos
			$stock = $row[1];
			$almacen = '<option value='.$row[9].'>'.$row[13].' | '.$row[1].' UDS</option>';
			

			$hijos = mysqli_query($con_hijos,"SELECT s.id, s.padre, a.nombre, s.stock FROM productos_sub s, almacen a where s.almacen = a.id and padre = '$row[9]' ");
			
			while($item = mysqli_fetch_array($hijos))
			{
				$stock = $stock + $item[3];
				$almacen .= '<option value='.$item[0].'>'.$item[2].' | '.$item[3].' UDS</option>';
			} //Finaliza hijos

			
			$precio = '<span class="new-price">$ '.$row[3].' MXN</span>';
			
			if ($row[2] == 1)
			{
				$precio = '<span class="new-price">$ '.$row[4].' MXN</span>';
				$precio = $precio . ' <span class="old-price">$ '.$row[3].' MXN</span>';
			}
			
			if ($row[2] == 1)
        	{
        		$select = '<option value="1" selected>Si usar</option>
            	 <option value="0">No usar</option>';
        	}
        	else
        	{
        		$select = '<option value="1">Si usar</option>
            	 <option value="0" selected>No usar</option>';
        	}

			$body = $body.'<!--Quickview Product Start -->
			
						<!-- Modal -->
						<div class="modal fade" id="viewM'.$row[9].'" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<div class="modal-body">
										<div class="modal-product">
											<div class="single-product-image">
												<div id="product-img-content">
													<div id="my-tab-content" class="tab-content mb-20">
														<div class="tab-pane b-img active" id="'.$row[9].'view1">
															<a class="venobox" href="images/'.$row[5].'" data-gall="gallery" title=""><img src="images/'.$row[5].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view2">
															<a class="venobox" href="images/'.$row[6].'" data-gall="gallery" title=""><img src="images/'.$row[6].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view3">
															<a class="venobox" href="images/'.$row[7].'" data-gall="gallery" title=""><img src="images/'.$row[7].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view4">
															<a class="venobox" href="images/'.$row[8].'" data-gall="gallery" title=""><img src="images/'.$row[8].'" alt=""></a>
														</div>
													</div>
													<div id="viewproduct" class="nav nav-tabs product-view bxslider" data-tabs="tabs">
														<div class="pro-view b-img active"><a href="#'.$row[9].'view1" data-toggle="tab"><img src="images/'.$row[5].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view2" data-toggle="tab"><img src="images/'.$row[6].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view3" data-toggle="tab"><img src="images/'.$row[7].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view4" data-toggle="tab"><img src="images/'.$row[8].'" alt=""></a></div>
													</div>
												</div>
											</div>
											<div class="product-details-content">
												<div class="product-content text-uppercase">
													<p>Parte NO: '.$row[12].' | '.$row[0].'</p>
													<div class="rating-icon pb-20 mt-10">
														<p>Unidades disponibles: '.$stock.' UDS</>
													</div>
													<div class="product-price pb-20">
														'.$precio.'
													</div>
												</div>
												<div class="product-view pb-20">
													<h4 class="product-details-tilte text-uppercase">Descripcion</h4>
													<p>'.$row[10].'</p>
												</div>
												<div class="product-attributes clearfix">
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Departamento</h4>
														<p>'.$row[14].'</p>
													</div>
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Marca</h4>
														<p>'.$row[15].'</p>
													</div>
												</div>
												<div class="product-attributes clearfix">
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Ubicacion</h4>
														<p>'.$row[16].'</p>
													</div>
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">T. Entrega</h4>
													'.$row[11].'
													</div>
												</div>
												<div class="country-select shop-select col-md-12">
													<label> Existencias</label>
													<select>
														'.$almacen.'
													</select>                                       
												</div>
											</div>
											<!-- .product-info -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--End of Quickview Product-->
				<div class="modal fade" id="edit_flash'.$row[9].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLongTitle">EDIDICION RAPIDA: '.$row[0].'</h5>
				        </button>
				      </div>
				      <div class="modal-body">
				        


				        <form id="contact-form" action="func/product_update_flash.php" method="post" enctype="multipart/form-data">
	          <div class="row">
	          	  <input type="hidden" id="id" name="id" value="'.$row[9].'">
				  <input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">

	              <div class="col-md-6">
	                <label>Numero de parte</label>
	                <input type="text" name="parte" id="parte" placeholder="AEF594-S" value='.$row[12].'>
	              </div>
	              <div class="col-md-6">
	                <label>Nombre del producto</label>
	                <input type="text" name="name" id="name" placeholder="Nombre producto" value="'.$row[0].'">
	              </div>
	              
	              <div class="col-md-6">
	                <label>Precio normal<span class="required">*</span></label>
	                <input type="text" name="precio" id="precio" placeholder="Precio al publico" value="'.$row[3].'">
	            </div>

	            <div class="col-md-6">
	                <label>Precio oferta<span class="required">*</span></label>
	                <input type="text" name="p_oferta" id="p_oferta" placeholder="Precio con oferta al publico" value="'.$row[4].'">
	            </div>

	            <div class="col-md-6">
	                <label>Unidades existentes<span class="required">*</span></label>
	                <input type="text" name="stock" id="stock" placeholder="Stock" value="'.$row[1].'">
	            </div>

	            <div class="country-select shop-select col-md-6">
	                <label> Usar precio de oferta ? <span class="required">*</span></label>
	                <select id="use_oferta" name="use_oferta">
	                	'.$select.'
	                </select>                                       
	            </div>
	            
	          </div>
  		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary">Guardar</button>
		        </form>
		      </div>
		    </div>
		  </div>
		  </div>';
		}
		
		return $body;
	}

	function _getProductsModal_sale ($pagina, $folio)
	{
		$TAMANO_PAGINA = 16;

		if (!$pagina) {
			$inicio = 0;
			$pagina = 1;
		}
		else {
			$inicio = ($pagina - 1) * $TAMANO_PAGINA;
		}
		
		
		$data = mysqli_query(db_conectar(),"SELECT p.nombre, p.stock, p.oferta, p.precio_normal, p.precio_oferta, p.foto0, p.foto1, p.foto2, p.foto3, p.id, p.descripcion, p.`tiempo de entrega`, p.`no. De parte`, a.nombre, d.nombre, p.marca, p.loc_almacen FROM productos p, almacen a, departamentos d where p.almacen = a.id and p.departamento = d.id order by p.id asc LIMIT $inicio, $TAMANO_PAGINA");
		$con_hijos  = db_conectar();

		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$precio = '<span class="new-price">$ '.$row[3].' MXN</span>';
			$precio_ = $row[3];

			if ($row[2] == 1)
			{
				$precio = '<span class="new-price">$ '.$row[4].' MXN</span>';
				$precio = $precio . ' <span class="old-price">$ '.$row[3].' MXN</span>';
				$precio_ = $row[4];
			}
			
			// Add hijos
			$stock = $row[1];
			$almacen = '<option value='.$row[9].'>'.$row[13].' | '.$row[1].' UDS</option>';
			
			$exist = '
			<tr>
				<td class="item-des"><p>'.$row[13].'</p></td>
				<td class="item-des"><p>'.$row[1].' UDS</p></td>
				<td class="item-des"><p>
					<div class="col-md-12">
						<form action="func/producst_add_sale.php" autocomplete="off" method="post">
							<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
							<input type="hidden" id="product" name="product" value="'.$row[9].'">
							<input type="hidden" id="costo" name="costo" value="'.$precio_.'">
							<input type="hidden" id="folio" name="folio" value="'.$folio.'">
							<input type="hidden" id="hijo" name="hijo" value="0">
							
							<div class="col-md-6">
								<input type="number" id="unidades" name="unidades" placeholder="0" value ="1" min="1" max="'.$row[1].'" /></p>		
							</div>

							<div class="col-md-6">
								<button type="submit" class="btn btn-primary">Agregar</button>
							</div>
						</form>
					</div>
				</td>
			</tr>
			';

			$hijos = mysqli_query($con_hijos,"SELECT s.id, s.padre, a.nombre, s.stock FROM productos_sub s, almacen a where s.almacen = a.id and padre = '$row[9]' ");
			
			while($item = mysqli_fetch_array($hijos))
			{
				$stock = $stock + $item[3];
				$almacen .= '<option value='.$item[0].'>'.$item[2].' | '.$item[3].' UDS</option>';

				$exist .= '
				<tr>
					<td class="item-des"><p>'.$item[2].'</p></td>
					<td class="item-des"><p>'.$item[3].' UDS</p></td>
					<td class="item-des">
					<div class="col-md-12">
						<form action="func/producst_add_sale.php" autocomplete="off" method="post">
							<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
							<input type="hidden" id="product" name="product" value="'.$row[9].'">
							<input type="hidden" id="costo" name="costo" value="'.$precio_.'">
							<input type="hidden" id="folio" name="folio" value="'.$folio.'">
							<input type="hidden" id="hijo" name="hijo" value="'.$item[0].'">
							
							<div class="col-md-6">
							<input type="number" id="unidades" name="unidades" placeholder="0" value ="1" min="1" max="'.$item[3].'" /></p>		
							</div>

							<div class="col-md-6">
								<button type="submit" class="btn btn-primary">Agregar</button>
							</div>
						</form>
					</div>
					</td>
				</tr>
				';

			} //Finaliza hijos
			
			
			$body = $body.'<!--Quickview Product Start -->
			
						<!-- Modal -->
						<div class="modal fade" id="viewM'.$row[9].'" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<div class="modal-body">
										<div class="modal-product">
											<div class="single-product-image">
												<div id="product-img-content">
													<div id="my-tab-content" class="tab-content mb-20">
														<div class="tab-pane b-img active" id="'.$row[9].'view1">
															<a class="venobox" href="images/'.$row[5].'" data-gall="gallery" title=""><img src="images/'.$row[5].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view2">
															<a class="venobox" href="images/'.$row[6].'" data-gall="gallery" title=""><img src="images/'.$row[6].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view3">
															<a class="venobox" href="images/'.$row[7].'" data-gall="gallery" title=""><img src="images/'.$row[7].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view4">
															<a class="venobox" href="images/'.$row[8].'" data-gall="gallery" title=""><img src="images/'.$row[8].'" alt=""></a>
														</div>
													</div>
													<div id="viewproduct" class="nav nav-tabs product-view bxslider" data-tabs="tabs">
														<div class="pro-view b-img active"><a href="#'.$row[9].'view1" data-toggle="tab"><img src="images/'.$row[5].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view2" data-toggle="tab"><img src="images/'.$row[6].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view3" data-toggle="tab"><img src="images/'.$row[7].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view4" data-toggle="tab"><img src="images/'.$row[8].'" alt=""></a></div>
													</div>
												</div>
											</div>
											<div class="product-details-content">
												<div class="product-content text-uppercase">
													<p>Parte NO: '.$row[12].' | '.$row[0].'</p>
													<div class="rating-icon pb-20 mt-10">
														<p>Unidades disponibles: '.$stock.' UDS</>
													</div>
													<div class="product-price pb-20">
														'.$precio.'
													</div>
												</div>
												<div class="product-view pb-20">
													<h4 class="product-details-tilte text-uppercase">Descripcion</h4>
													<p>'.$row[10].'</p>
												</div>
												<div class="product-attributes clearfix">
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Departamento</h4>
														<p>'.$row[14].'</p>
													</div>
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Marca</h4>
														<p>'.$row[15].'</p>
													</div>
												</div>
												<div class="product-attributes clearfix">
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Ubicacion</h4>
														<p>'.$row[16].'</p>
													</div>
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">T. Entrega</h4>
														'.$row[11].'
													</div>
												</div>
												<div class="country-select shop-select col-md-12">
													<label> Existencias</label>
													<select>
														'.$almacen.'
													</select>                                       
												</div>
											</div>
											<!-- .product-info -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!--Agragar producto a venta-->
					<div class="modal fade" id="add_car'.$row[9].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLongTitle">AGREGAR: '.$row[0].'</h5>
				        </button>
				      </div>
				      <div class="modal-body">
				        


				        
	          <div class="row">
				 <div class="col-md-12">
					<div class="country-select shop-select col-md-6">
						<p>Precio: '.$precio.'</p>
					</div>
					
					<div class="country-select shop-select col-md-6">
					 <p>Unidades disponibles: '.$stock.' UDS</>
				  	</div>
						<div class="col-md-12">
							<div class="section-title-2 text-uppercase mb-40 text-center">
								<h4>EXISTENCIAS</h4>
							</div>
						</div>
						
						<table class="cart table">
						<thead>
							<tr>
								<th class="table-head th-name uppercase">ALMACEN</th>
								<th class="table-head th-name uppercase">STOCK</th>
								<th class="table-head th-name uppercase">AGREGAR</th>
							</tr>
						</thead>
						<tbody>
							'.$exist.'
						</tbody>
						</table>
						
				</div>
	          </div>
  		      </div>
		      <div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">X</button>
		      </div>
		    </div>
		  </div>
		  </div>';
		}
		
		return $body;
	}

	function _getProductsModal_sale_order ($pagina, $folio)
	{
		$TAMANO_PAGINA = 16;

		if (!$pagina) {
			$inicio = 0;
			$pagina = 1;
		}
		else {
			$inicio = ($pagina - 1) * $TAMANO_PAGINA;
		}
		
		
		$data = mysqli_query(db_conectar(),"SELECT p.nombre, p.stock, p.oferta, p.precio_normal, p.precio_oferta, p.foto0, p.foto1, p.foto2, p.foto3, p.id, p.descripcion, p.`tiempo de entrega`, p.`no. De parte`, a.nombre, d.nombre, p.marca, p.loc_almacen FROM productos p, almacen a, departamentos d where p.almacen = a.id and p.departamento = d.id  order by p.id asc LIMIT $inicio, $TAMANO_PAGINA");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$precio = '<span class="new-price">$ '.$row[3].' MXN</span>';
			$precio_ = $row[3];

			if ($row[2] == 1)
			{
				$precio = '<span class="new-price">$ '.$row[4].' MXN</span>';
				$precio = $precio . ' <span class="old-price">$ '.$row[3].' MXN</span>';
				$precio_ = $row[4];
			}
			
			
			$body = $body.'<!--Quickview Product Start -->
			
						<!-- Modal -->
						<div class="modal fade" id="viewM'.$row[9].'" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<div class="modal-body">
										<div class="modal-product">
											<div class="single-product-image">
												<div id="product-img-content">
													<div id="my-tab-content" class="tab-content mb-20">
														<div class="tab-pane b-img active" id="'.$row[9].'view1">
															<a class="venobox" href="images/'.$row[5].'" data-gall="gallery" title=""><img src="images/'.$row[5].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view2">
															<a class="venobox" href="images/'.$row[6].'" data-gall="gallery" title=""><img src="images/'.$row[6].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view3">
															<a class="venobox" href="images/'.$row[7].'" data-gall="gallery" title=""><img src="images/'.$row[7].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view4">
															<a class="venobox" href="images/'.$row[8].'" data-gall="gallery" title=""><img src="images/'.$row[8].'" alt=""></a>
														</div>
													</div>
													<div id="viewproduct" class="nav nav-tabs product-view bxslider" data-tabs="tabs">
														<div class="pro-view b-img active"><a href="#'.$row[9].'view1" data-toggle="tab"><img src="images/'.$row[5].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view2" data-toggle="tab"><img src="images/'.$row[6].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view3" data-toggle="tab"><img src="images/'.$row[7].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view4" data-toggle="tab"><img src="images/'.$row[8].'" alt=""></a></div>
													</div>
												</div>
											</div>
											<div class="product-details-content">
												<div class="product-content text-uppercase">
													<p>Parte NO: '.$row[12].' | '.$row[0].'</p>
													<div class="rating-icon pb-20 mt-10">
														<p>Unidades disponibles: '.$stock.' UDS</>
													</div>
													<div class="product-price pb-20">
														'.$precio.'
													</div>
												</div>
												<div class="product-view pb-20">
													<h4 class="product-details-tilte text-uppercase">Descripcion</h4>
													<p>'.$row[10].'</p>
												</div>
												<div class="product-attributes clearfix">
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Departamento</h4>
														<p>'.$row[14].'</p>
													</div>
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Marca</h4>
														<p>'.$row[15].'</p>
													</div>
												</div>
												<div class="product-attributes clearfix">
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Ubicacion</h4>
														<p>'.$row[16].'</p>
													</div>
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">T. Entrega</h4>
														'.$row[11].'
													</div>
												</div>
											</div>
											<!-- .product-info -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!--Agragar producto a venta-->
					<div class="modal fade" id="add_car'.$row[9].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLongTitle">AGREGAR: '.$row[0].'</h5>
				        </button>
				      </div>
				      <div class="modal-body">
	          <div class="row">
				 <div class="col-md-12">
					<div class="country-select shop-select col-md-6">
						<p>Precio: '.$precio.'</p>
					</div>
					
					<div class="country-select shop-select col-md-6">
					 <p>Unidades disponibles: '.$stock.' UDS</>
				  	</div>
						<div class="col-md-12">
							<div class="section-title-2 text-uppercase mb-40 text-center">
								<h4>Agregar</h4>
							</div>
						</div>
						<form action="func/producst_add_sale_order.php" autocomplete="off" method="post">
							<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
							<input type="hidden" id="product" name="product" value="'.$row[9].'">
							<input type="hidden" id="costo" name="costo" value="'.$precio_.'">
							<input type="hidden" id="folio" name="folio" value="'.$folio.'">
							
							<div class="col-md-4">
								<input type="number" id="unidades" name="unidades" placeholder="0" value ="1" min="1" " style="text-align: center;"></p>		
							</div>

							<div class="col-md-8">
								<button type="submit" class="btn btn-primary">Agregar</button>
							</div>

						</form>
				</div>
	          </div>
  		      </div>
		      <div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">X</button>
		      </div>
		    </div>
		  </div>
		  </div>';
		}
		
		return $body;
	}

	function _getProductsModal_sale_search ($txt, $folio)
	{
		$data = mysqli_query(db_conectar(),"SELECT p.nombre, p.stock, p.oferta, p.precio_normal, p.precio_oferta, p.foto0, p.foto1, p.foto2, p.foto3, p.id, p.descripcion, p.`tiempo de entrega`, p.`no. De parte`, a.nombre, d.nombre, p.marca, p.loc_almacen FROM productos p, almacen a, departamentos d where p.almacen = a.id and p.departamento = d.id and p.`no. De parte` like '%$txt%' or p.nombre like '%$txt%' or p.descripcion like '%$txt%' or p.marca like '%$txt%'or p.proveedor like '%$txt%' order by p.id asc");
		
		$select = "";

		$con_hijos  = db_conectar();

		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$precio = '<span class="new-price">$ '.$row[3].' MXN</span>';
			$precio_ = $row[3];

			if ($row[2] == 1)
			{
				$precio = '<span class="new-price">$ '.$row[4].' MXN</span>';
				$precio = $precio . ' <span class="old-price">$ '.$row[3].' MXN</span>';
				$precio_ = $row[4];
			}
			
			// Add hijos
			$stock = $row[1];
			$almacen = '<option value='.$row[9].'>'.$row[13].' | '.$row[1].' UDS</option>';
			
			$exist = '
			<tr>
				<td class="item-des"><p>'.$row[13].'</p></td>
				<td class="item-des"><p>'.$row[1].' UDS</p></td>
				<td class="item-des"><p>
					<div class="col-md-12">
						<form action="func/producst_add_sale.php" autocomplete="off" method="post">
							<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
							<input type="hidden" id="product" name="product" value="'.$row[9].'">
							<input type="hidden" id="costo" name="costo" value="'.$precio_.'">
							<input type="hidden" id="folio" name="folio" value="'.$folio.'">
							<input type="hidden" id="hijo" name="hijo" value="0">
							
							<div class="col-md-6">
								<input type="number" id="unidades" name="unidades" placeholder="0" value ="1" min="1" max="'.$row[1].'" /></p>		
							</div>

							<div class="col-md-6">
								<button type="submit" class="btn btn-primary">Agregar</button>
							</div>
						</form>
					</div>
				</td>
			</tr>
			';

			$hijos = mysqli_query($con_hijos,"SELECT s.id, s.padre, a.nombre, s.stock FROM productos_sub s, almacen a where s.almacen = a.id and padre = '$row[9]' ");
			
			while($item = mysqli_fetch_array($hijos))
			{
				$stock = $stock + $item[3];
				$almacen .= '<option value='.$item[0].'>'.$item[2].' | '.$item[3].' UDS</option>';

				$exist .= '
				<tr>
					<td class="item-des"><p>'.$item[2].'</p></td>
					<td class="item-des"><p>'.$item[3].' UDS</p></td>
					<td class="item-des">
					<div class="col-md-12">
						<form action="func/producst_add_sale.php" autocomplete="off" method="post">
							<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
							<input type="hidden" id="product" name="product" value="'.$row[9].'">
							<input type="hidden" id="costo" name="costo" value="'.$precio_.'">
							<input type="hidden" id="folio" name="folio" value="'.$folio.'">
							<input type="hidden" id="hijo" name="hijo" value="'.$item[0].'">
							
							<div class="col-md-6">
							<input type="number" id="unidades" name="unidades" placeholder="0" value ="1" min="1" max="'.$item[3].'" /></p>		
							</div>

							<div class="col-md-6">
								<button type="submit" class="btn btn-primary">Agregar</button>
							</div>
						</form>
					</div>
					</td>
				</tr>
				';

			} //Finaliza hijos
			
			
			$body = $body.'<!--Quickview Product Start -->
			
						<!-- Modal -->
						<div class="modal fade" id="viewM'.$row[9].'" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<div class="modal-body">
										<div class="modal-product">
											<div class="single-product-image">
												<div id="product-img-content">
													<div id="my-tab-content" class="tab-content mb-20">
														<div class="tab-pane b-img active" id="'.$row[9].'view1">
															<a class="venobox" href="images/'.$row[5].'" data-gall="gallery" title=""><img src="images/'.$row[5].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view2">
															<a class="venobox" href="images/'.$row[6].'" data-gall="gallery" title=""><img src="images/'.$row[6].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view3">
															<a class="venobox" href="images/'.$row[7].'" data-gall="gallery" title=""><img src="images/'.$row[7].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view4">
															<a class="venobox" href="images/'.$row[8].'" data-gall="gallery" title=""><img src="images/'.$row[8].'" alt=""></a>
														</div>
													</div>
													<div id="viewproduct" class="nav nav-tabs product-view bxslider" data-tabs="tabs">
														<div class="pro-view b-img active"><a href="#'.$row[9].'view1" data-toggle="tab"><img src="images/'.$row[5].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view2" data-toggle="tab"><img src="images/'.$row[6].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view3" data-toggle="tab"><img src="images/'.$row[7].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view4" data-toggle="tab"><img src="images/'.$row[8].'" alt=""></a></div>
													</div>
												</div>
											</div>
											<div class="product-details-content">
												<div class="product-content text-uppercase">
													<p>Parte NO: '.$row[12].' | '.$row[0].'</p>
													<div class="rating-icon pb-20 mt-10">
														<p>Unidades disponibles: '.$stock.' UDS</>
													</div>
													<div class="product-price pb-20">
														'.$precio.'
													</div>
												</div>
												<div class="product-view pb-20">
													<h4 class="product-details-tilte text-uppercase">Descripcion</h4>
													<p>'.$row[10].'</p>
												</div>
												<div class="product-attributes clearfix">
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Departamento</h4>
														<p>'.$row[14].'</p>
													</div>
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Marca</h4>
														<p>'.$row[15].'</p>
													</div>
												</div>
												<div class="product-attributes clearfix">
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Ubicacion</h4>
														<p>'.$row[16].'</p>
													</div>
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">T. Entrega</h4>
														'.$row[11].'
													</div>
												</div>
												<div class="country-select shop-select col-md-12">
													<label> Existencias</label>
													<select>
														'.$almacen.'
													</select>                                       
												</div>
											</div>
											<!-- .product-info -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!--Agragar producto a venta-->
					<div class="modal fade" id="add_car'.$row[9].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLongTitle">AGREGAR: '.$row[0].'</h5>
				        </button>
				      </div>
				      <div class="modal-body">
				        


				        
	          <div class="row">
				 <div class="col-md-12">
					<div class="country-select shop-select col-md-6">
						<p>Precio: '.$precio.'</p>
					</div>
					
					<div class="country-select shop-select col-md-6">
					 <p>Unidades disponibles: '.$stock.' UDS</>
				  	</div>
						<div class="col-md-12">
							<div class="section-title-2 text-uppercase mb-40 text-center">
								<h4>EXISTENCIAS</h4>
							</div>
						</div>
						
						<table class="cart table">
						<thead>
							<tr>
								<th class="table-head th-name uppercase">ALMACEN</th>
								<th class="table-head th-name uppercase">STOCK</th>
								<th class="table-head th-name uppercase">AGREGAR</th>
							</tr>
						</thead>
						<tbody>
							'.$exist.'
						</tbody>
						</table>
						
				</div>
	          </div>
  		      </div>
		      <div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">X</button>
		      </div>
		    </div>
		  </div>
		  </div>';
		}
		
		return $body;
	}


	function _getProductsModal_sale_search_order ($txt, $folio)
	{
		$data = mysqli_query(db_conectar(),"SELECT p.nombre, p.stock, p.oferta, p.precio_normal, p.precio_oferta, p.foto0, p.foto1, p.foto2, p.foto3, p.id, p.descripcion, p.`tiempo de entrega`, p.`no. De parte`, a.nombre, d.nombre, p.marca, p.loc_almacen FROM productos p, almacen a, departamentos d where p.almacen = a.id and p.departamento = d.id and p.`no. De parte` like '%$txt%' or p.nombre like '%$txt%' or p.descripcion like '%$txt%' or p.marca like '%$txt%'or p.proveedor like '%$txt%' order by p.id asc");
		
		$select = "";

		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$precio = '<span class="new-price">$ '.$row[3].' MXN</span>';
			$precio_ = $row[3];

			if ($row[2] == 1)
			{
				$precio = '<span class="new-price">$ '.$row[4].' MXN</span>';
				$precio = $precio . ' <span class="old-price">$ '.$row[3].' MXN</span>';
				$precio_ = $row[4];
			}
			
			$body = $body.'<!--Quickview Product Start -->
			
						<!-- Modal -->
						<div class="modal fade" id="viewM'.$row[9].'" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<div class="modal-body">
										<div class="modal-product">
											<div class="single-product-image">
												<div id="product-img-content">
													<div id="my-tab-content" class="tab-content mb-20">
														<div class="tab-pane b-img active" id="'.$row[9].'view1">
															<a class="venobox" href="images/'.$row[5].'" data-gall="gallery" title=""><img src="images/'.$row[5].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view2">
															<a class="venobox" href="images/'.$row[6].'" data-gall="gallery" title=""><img src="images/'.$row[6].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view3">
															<a class="venobox" href="images/'.$row[7].'" data-gall="gallery" title=""><img src="images/'.$row[7].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view4">
															<a class="venobox" href="images/'.$row[8].'" data-gall="gallery" title=""><img src="images/'.$row[8].'" alt=""></a>
														</div>
													</div>
													<div id="viewproduct" class="nav nav-tabs product-view bxslider" data-tabs="tabs">
														<div class="pro-view b-img active"><a href="#'.$row[9].'view1" data-toggle="tab"><img src="images/'.$row[5].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view2" data-toggle="tab"><img src="images/'.$row[6].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view3" data-toggle="tab"><img src="images/'.$row[7].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view4" data-toggle="tab"><img src="images/'.$row[8].'" alt=""></a></div>
													</div>
												</div>
											</div>
											<div class="product-details-content">
												<div class="product-content text-uppercase">
													<p>Parte NO: '.$row[12].' | '.$row[0].'</p>
													<div class="rating-icon pb-20 mt-10">
														<p>Unidades disponibles: '.$stock.' UDS</>
													</div>
													<div class="product-price pb-20">
														'.$precio.'
													</div>
												</div>
												<div class="product-view pb-20">
													<h4 class="product-details-tilte text-uppercase">Descripcion</h4>
													<p>'.$row[10].'</p>
												</div>
												<div class="product-attributes clearfix">
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Departamento</h4>
														<p>'.$row[14].'</p>
													</div>
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Marca</h4>
														<p>'.$row[15].'</p>
													</div>
												</div>
												<div class="product-attributes clearfix">
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Ubicacion</h4>
														<p>'.$row[16].'</p>
													</div>
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">T. Entrega</h4>
														'.$row[11].'
													</div>
												</div>
											</div>
											<!-- .product-info -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!--Agragar producto a venta-->
					<div class="modal fade" id="add_car'.$row[9].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLongTitle">AGREGAR: '.$row[0].'</h5>
				        </button>
				      </div>
				      <div class="modal-body">
				        


				        
	          <div class="row">
				 <div class="col-md-12">
					<div class="country-select shop-select col-md-6">
						<p>Precio: '.$precio.'</p>
					</div>
					
					<div class="country-select shop-select col-md-6">
					 <p>Unidades disponibles: '.$stock.' UDS</>
				  	</div>
						<div class="col-md-12">
							<div class="section-title-2 text-uppercase mb-40 text-center">
								<h4>AGREGAR</h4>
							</div>
						</div>
						
						<form action="func/producst_add_sale_order.php" autocomplete="off" method="post">
							<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
							<input type="hidden" id="product" name="product" value="'.$row[9].'">
							<input type="hidden" id="costo" name="costo" value="'.$precio_.'">
							<input type="hidden" id="folio" name="folio" value="'.$folio.'">
							
							<div class="col-md-4">
								<input type="number" id="unidades" name="unidades" placeholder="0" value ="1" min="1" " style="text-align: center;"></p>		
							</div>

							<div class="col-md-8">
								<button type="submit" class="btn btn-primary">Agregar</button>
							</div>

						</form>
						
				</div>
	          </div>
  		      </div>
		      <div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">X</button>
		      </div>
		    </div>
		  </div>
		  </div>';
		}
		
		return $body;
	}

	function _getProductsModalDepartment ($departamento)
	{

		$data = mysqli_query(db_conectar(),"SELECT p.nombre, p.stock, p.oferta, p.precio_normal, p.precio_oferta, p.foto0, p.foto1, p.foto2, p.foto3, p.id, p.descripcion, p.`tiempo de entrega`, p.`no. De parte`, a.nombre, d.nombre, p.marca, p.loc_almacen FROM productos p, almacen a, departamentos d where p.almacen = a.id and p.departamento = d.id and p.departamento = $departamento order by p.id asc ");
		
		$con_hijos  = db_conectar();

		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			// Add hijos
			$stock = $row[1];
			$almacen = '<option value='.$row[9].'>'.$row[13].' | '.$row[1].' UDS</option>';
			

			$hijos = mysqli_query($con_hijos,"SELECT s.id, s.padre, a.nombre, s.stock FROM productos_sub s, almacen a where s.almacen = a.id and padre = '$row[9]' ");
			
			while($item = mysqli_fetch_array($hijos))
			{
				$stock = $stock + $item[3];
				$almacen .= '<option value='.$item[0].'>'.$item[2].' | '.$item[3].' UDS</option>';
			} //Finaliza hijos
			
			$precio = '<span class="new-price">$ '.$row[3].' MXN</span>';
			
			if ($row[2] == 1)
			{
				$precio = '<span class="new-price">$ '.$row[4].' MXN</span>';
				$precio = $precio . ' <span class="old-price">$ '.$row[3].' MXN</span>';
			}
			
			if ($row[2] == 1)
        	{
        		$select = '<option value="1" selected>Si usar</option>
            	 <option value="0">No usar</option>';
        	}
        	else
        	{
        		$select = '<option value="1">Si usar</option>
            	 <option value="0" selected>No usar</option>';
        	}

			$body = $body.'<!--Quickview Product Start -->
			
						<!-- Modal -->
						<div class="modal fade" id="viewM'.$row[9].'" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<div class="modal-body">
										<div class="modal-product">
											<div class="single-product-image">
												<div id="product-img-content">
													<div id="my-tab-content" class="tab-content mb-20">
														<div class="tab-pane b-img active" id="'.$row[9].'view1">
															<a class="venobox" href="images/'.$row[5].'" data-gall="gallery" title=""><img src="images/'.$row[5].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view2">
															<a class="venobox" href="images/'.$row[6].'" data-gall="gallery" title=""><img src="images/'.$row[6].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view3">
															<a class="venobox" href="images/'.$row[7].'" data-gall="gallery" title=""><img src="images/'.$row[7].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view4">
															<a class="venobox" href="images/'.$row[8].'" data-gall="gallery" title=""><img src="images/'.$row[8].'" alt=""></a>
														</div>
													</div>
													<div id="viewproduct" class="nav nav-tabs product-view bxslider" data-tabs="tabs">
														<div class="pro-view b-img active"><a href="#'.$row[9].'view1" data-toggle="tab"><img src="images/'.$row[5].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view2" data-toggle="tab"><img src="images/'.$row[6].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view3" data-toggle="tab"><img src="images/'.$row[7].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view4" data-toggle="tab"><img src="images/'.$row[8].'" alt=""></a></div>
													</div>
												</div>
											</div>
											<div class="product-details-content">
												<div class="product-content text-uppercase">
													<p>Parte NO: '.$row[12].' | '.$row[0].'</p>
													<div class="rating-icon pb-20 mt-10">
														<p>Unidades disponibles: '.$stock.' UDS</>
													</div>
													<div class="product-price pb-20">
														'.$precio.'
													</div>
												</div>
												<div class="product-view pb-20">
													<h4 class="product-details-tilte text-uppercase">Descripcion</h4>
													<p>'.$row[10].'</p>
												</div>
												<div class="product-attributes clearfix">
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Departamento</h4>
														<p>'.$row[14].'</p>
													</div>
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Marca</h4>
														<p>'.$row[15].'</p>
													</div>
												</div>
												<div class="product-attributes clearfix">
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Ubicacion</h4>
														<p>'.$row[16].'</p>
													</div>
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">T. Entrega</h4>
														'.$row[11].'
													</div>
												</div>
												<div class="country-select shop-select col-md-12">
													<label> Existencias</label>
													<select>
														'.$almacen.'
													</select>                                       
												</div>
											</div>
											<!-- .product-info -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--End of Quickview Product-->
				<div class="modal fade" id="edit_flash'.$row[9].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLongTitle">EDIDICION RAPIDA: '.$row[0].'</h5>
				        </button>
				      </div>
				      <div class="modal-body">
				        


				        <form id="contact-form" action="func/product_update_flash.php" method="post" enctype="multipart/form-data">
	          <div class="row">
	          	  <input type="hidden" id="id" name="id" value="'.$row[9].'">
				<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">

	              <div class="col-md-6">
	                <label>Numero de parte</label>
	                <input type="text" name="parte" id="parte" placeholder="AEF594-S" value='.$row[12].'>
	              </div>
	              <div class="col-md-6">
	                <label>Nombre del producto</label>
	                <input type="text" name="name" id="name" placeholder="Nombre producto" value="'.$row[0].'">
	              </div>
	              
	              <div class="col-md-6">
	                <label>Precio normal<span class="required">*</span></label>
	                <input type="text" name="precio" id="precio" placeholder="Precio al publico" value="'.$row[3].'">
	            </div>

	            <div class="col-md-6">
	                <label>Precio oferta<span class="required">*</span></label>
	                <input type="text" name="p_oferta" id="p_oferta" placeholder="Precio con oferta al publico" value="'.$row[4].'">
	            </div>

	            <div class="col-md-6">
	                <label>Unidades existentes<span class="required">*</span></label>
	                <input type="text" name="stock" id="stock" placeholder="Stock" value="'.$row[1].'">
	            </div>

	            <div class="country-select shop-select col-md-6">
	                <label> Usar precio de oferta ? <span class="required">*</span></label>
	                <select id="use_oferta" name="use_oferta">
	                	'.$select.'
	                </select>                                       
	            </div>
	            
	          </div>
  		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary">Guardar</button>
		        </form>
		      </div>
		    </div>
		  </div>
		  </div>';
		}
		
		return $body;
	}

	function _getProductsModalSearch ($txt)
	{

		$data = mysqli_query(db_conectar(),"SELECT p.nombre, p.stock, p.oferta, p.precio_normal, p.precio_oferta, p.foto0, p.foto1, p.foto2, p.foto3, p.id, p.descripcion, p.`tiempo de entrega`, p.`no. De parte`, a.nombre, d.nombre, p.marca, p.loc_almacen FROM productos p, almacen a, departamentos d where p.almacen = a.id and p.departamento = d.id and p.`no. De parte` like '%$txt%' or p.nombre like '%$txt%' or p.descripcion like '%$txt%' or p.marca like '%$txt%'or p.proveedor like '%$txt%' order by p.id asc ");
		
		$con_hijos  = db_conectar();

		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			// Add hijos
			$stock = $row[1];
			$almacen = '<option value='.$row[9].'>'.$row[13].' | '.$row[1].' UDS</option>';
			

			$hijos = mysqli_query($con_hijos,"SELECT s.id, s.padre, a.nombre, s.stock FROM productos_sub s, almacen a where s.almacen = a.id and padre = '$row[9]' ");
			
			while($item = mysqli_fetch_array($hijos))
			{
				$stock = $stock + $item[3];
				$almacen .= '<option value='.$item[0].'>'.$item[2].' | '.$item[3].' UDS</option>';
			} //Finaliza hijos
			
			$precio = '<span class="new-price">$ '.$row[3].' MXN</span>';
			
			if ($row[2] == 1)
			{
				$precio = '<span class="new-price">$ '.$row[4].' MXN</span>';
				$precio = $precio . ' <span class="old-price">$ '.$row[3].' MXN</span>';
			}
			
			if ($row[2] == 1)
        	{
        		$select = '<option value="1" selected>Si usar</option>
            	 <option value="0">No usar</option>';
        	}
        	else
        	{
        		$select = '<option value="1">Si usar</option>
            	 <option value="0" selected>No usar</option>';
        	}

			$body = $body.'<!--Quickview Product Start -->
			
						<!-- Modal -->
						<div class="modal fade" id="viewM'.$row[9].'" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<div class="modal-body">
										<div class="modal-product">
											<div class="single-product-image">
												<div id="product-img-content">
													<div id="my-tab-content" class="tab-content mb-20">
														<div class="tab-pane b-img active" id="'.$row[9].'view1">
															<a class="venobox" href="images/'.$row[5].'" data-gall="gallery" title=""><img src="images/'.$row[5].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view2">
															<a class="venobox" href="images/'.$row[6].'" data-gall="gallery" title=""><img src="images/'.$row[6].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view3">
															<a class="venobox" href="images/'.$row[7].'" data-gall="gallery" title=""><img src="images/'.$row[7].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view4">
															<a class="venobox" href="images/'.$row[8].'" data-gall="gallery" title=""><img src="images/'.$row[8].'" alt=""></a>
														</div>
													</div>
													<div id="viewproduct" class="nav nav-tabs product-view bxslider" data-tabs="tabs">
														<div class="pro-view b-img active"><a href="#'.$row[9].'view1" data-toggle="tab"><img src="images/'.$row[5].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view2" data-toggle="tab"><img src="images/'.$row[6].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view3" data-toggle="tab"><img src="images/'.$row[7].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view4" data-toggle="tab"><img src="images/'.$row[8].'" alt=""></a></div>
													</div>
												</div>
											</div>
											<div class="product-details-content">
												<div class="product-content text-uppercase">
													<p>Parte NO: '.$row[12].' | '.$row[0].'</p>
													<div class="rating-icon pb-20 mt-10">
														<p>Unidades disponibles: '.$stock.' UDS</>
													</div>
													<div class="product-price pb-20">
														'.$precio.'
													</div>
												</div>
												<div class="product-view pb-20">
													<h4 class="product-details-tilte text-uppercase">Descripcion</h4>
													<p>'.$row[10].'</p>
												</div>
												<div class="product-attributes clearfix">
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Departamento</h4>
														<p>'.$row[14].'</p>
													</div>
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Marca</h4>
														<p>'.$row[15].'</p>
													</div>
												</div>
												<div class="product-attributes clearfix">
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Ubicacion</h4>
														<p>'.$row[16].'</p>
													</div>
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">T. Entrega</h4>
														'.$row[11].'
													</div>
												</div>
												<div class="country-select shop-select col-md-12">
													<label> Existencias</label>
													<select>
														'.$almacen.'
													</select>                                       
												</div>
											</div>
											<!-- .product-info -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--End of Quickview Product-->
				<div class="modal fade" id="edit_flash'.$row[9].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLongTitle">EDIDICION RAPIDA: '.$row[0].'</h5>
				        </button>
				      </div>
				      <div class="modal-body">
				        


				        <form id="contact-form" action="func/product_update_flash.php" method="post" enctype="multipart/form-data">
	          <div class="row">
	          	  <input type="hidden" id="id" name="id" value="'.$row[9].'">
				  <input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">

	              <div class="col-md-6">
	                <label>Numero de parte</label>
	                <input type="text" name="parte" id="parte" placeholder="AEF594-S" value='.$row[12].'>
	              </div>
	              <div class="col-md-6">
	                <label>Nombre del producto</label>
	                <input type="text" name="name" id="name" placeholder="Nombre producto" value="'.$row[0].'">
	              </div>
	              
	              <div class="col-md-6">
	                <label>Precio normal<span class="required">*</span></label>
	                <input type="text" name="precio" id="precio" placeholder="Precio al publico" value="'.$row[3].'">
	            </div>

	            <div class="col-md-6">
	                <label>Precio oferta<span class="required">*</span></label>
	                <input type="text" name="p_oferta" id="p_oferta" placeholder="Precio con oferta al publico" value="'.$row[4].'">
	            </div>

	            <div class="col-md-6">
	                <label>Unidades existentes<span class="required">*</span></label>
	                <input type="text" name="stock" id="stock" placeholder="Stock" value="'.$row[1].'">
	            </div>

	            <div class="country-select shop-select col-md-6">
	                <label> Usar precio de oferta ? <span class="required">*</span></label>
	                <select id="use_oferta" name="use_oferta">
	                	'.$select.'
	                </select>                                       
	            </div>
	            
	          </div>
  		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary">Guardar</button>
		        </form>
		      </div>
		    </div>
		  </div>
		  </div>';
		}
		
		return $body;
	}


	function _getProductsModalAlmacen ($almacen)
	{

		$data = mysqli_query(db_conectar(),"SELECT p.nombre, p.stock, p.oferta, p.precio_normal, p.precio_oferta, p.foto0, p.foto1, p.foto2, p.foto3, p.id, p.descripcion, p.`tiempo de entrega`, p.`no. De parte`, a.nombre, d.nombre, p.marca, p.loc_almacen FROM productos p, almacen a, departamentos d where p.almacen = a.id and p.departamento = d.id and p.almacen = '$almacen' order by p.id asc ");
		$con_hijos  = db_conectar();

		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			// Add hijos
			$stock = $row[1];
			$almacen = '<option value='.$row[9].'>'.$row[13].' | '.$row[1].' UDS</option>';
			

			$hijos = mysqli_query($con_hijos,"SELECT s.id, s.padre, a.nombre, s.stock FROM productos_sub s, almacen a where s.almacen = a.id and padre = '$row[9]' ");
			
			while($item = mysqli_fetch_array($hijos))
			{
				$stock = $stock + $item[3];
				$almacen .= '<option value='.$item[0].'>'.$item[2].' | '.$item[3].' UDS</option>';
			} //Finaliza hijos
			
			$precio = '<span class="new-price">$ '.$row[3].' MXN</span>';
			
			if ($row[2] == 1)
			{
				$precio = '<span class="new-price">$ '.$row[4].' MXN</span>';
				$precio = $precio . ' <span class="old-price">$ '.$row[3].' MXN</span>';
			}
			
			if ($row[2] == 1)
        	{
        		$select = '<option value="1" selected>Si usar</option>
            	 <option value="0">No usar</option>';
        	}
        	else
        	{
        		$select = '<option value="1">Si usar</option>
            	 <option value="0" selected>No usar</option>';
        	}

			$body = $body.'<!--Quickview Product Start -->
			
						<!-- Modal -->
						<div class="modal fade" id="viewM'.$row[9].'" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<div class="modal-body">
										<div class="modal-product">
											<div class="single-product-image">
												<div id="product-img-content">
													<div id="my-tab-content" class="tab-content mb-20">
														<div class="tab-pane b-img active" id="'.$row[9].'view1">
															<a class="venobox" href="images/'.$row[5].'" data-gall="gallery" title=""><img src="images/'.$row[5].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view2">
															<a class="venobox" href="images/'.$row[6].'" data-gall="gallery" title=""><img src="images/'.$row[6].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view3">
															<a class="venobox" href="images/'.$row[7].'" data-gall="gallery" title=""><img src="images/'.$row[7].'" alt=""></a>
														</div>
														<div class="tab-pane b-img" id="'.$row[9].'view4">
															<a class="venobox" href="images/'.$row[8].'" data-gall="gallery" title=""><img src="images/'.$row[8].'" alt=""></a>
														</div>
													</div>
													<div id="viewproduct" class="nav nav-tabs product-view bxslider" data-tabs="tabs">
														<div class="pro-view b-img active"><a href="#'.$row[9].'view1" data-toggle="tab"><img src="images/'.$row[5].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view2" data-toggle="tab"><img src="images/'.$row[6].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view3" data-toggle="tab"><img src="images/'.$row[7].'" alt=""></a></div>
														<div class="pro-view b-img"><a href="#'.$row[9].'view4" data-toggle="tab"><img src="images/'.$row[8].'" alt=""></a></div>
													</div>
												</div>
											</div>
											<div class="product-details-content">
												<div class="product-content text-uppercase">
													<p>Parte NO: '.$row[12].' | '.$row[0].'</p>
													<div class="rating-icon pb-20 mt-10">
														<p>Unidades disponibles: '.$stock.' UDS</>
													</div>
													<div class="product-price pb-20">
														'.$precio.'
													</div>
												</div>
												<div class="product-view pb-20">
													<h4 class="product-details-tilte text-uppercase">Descripcion</h4>
													<p>'.$row[10].'</p>
												</div>
												<div class="product-attributes clearfix">
													<div class="product-color text-uppercase pb-30">
														<h4 class="product-details-tilte text-uppercase pb-10">Almacen</h4>
														<ul>
														<p>'.$row[13].'</p>
														</ul>
													</div>
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Departamento</h4>
														<p>'.$row[14].'</p>
													</div>
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Marca</h4>
														<p>'.$row[15].'</p>
													</div>
												</div>
												<div class="product-attributes clearfix">
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">Ubicacion</h4>
														<p>'.$row[16].'</p>
													</div>
													<div class="pull-left" id="quantity-wanted">
														<h4 class="product-details-tilte text-uppercase pb-10">T. Entrega</h4>
														'.$row[11].'
													</div>
												</div>
												<div class="country-select shop-select col-md-12">
													<label> Existencias</label>
													<select>
														'.$almacen.'
													</select>                                       
												</div>
											</div>
											<!-- .product-info -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--End of Quickview Product-->
				<div class="modal fade" id="edit_flash'.$row[9].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLongTitle">EDIDICION RAPIDA: '.$row[0].'</h5>
				        </button>
				      </div>
				      <div class="modal-body">
				        


				        <form id="contact-form" action="func/product_update_flash.php" method="post" enctype="multipart/form-data">
	          <div class="row">
	          	  <input type="hidden" id="id" name="id" value="'.$row[9].'">
				  <input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">

	              <div class="col-md-6">
	                <label>Numero de parte</label>
	                <input type="text" name="parte" id="parte" placeholder="AEF594-S" value='.$row[12].'>
	              </div>
	              <div class="col-md-6">
	                <label>Nombre del producto</label>
	                <input type="text" name="name" id="name" placeholder="Nombre producto" value="'.$row[0].'">
	              </div>
	              
	              <div class="col-md-6">
	                <label>Precio normal<span class="required">*</span></label>
	                <input type="text" name="precio" id="precio" placeholder="Precio al publico" value="'.$row[3].'">
	            </div>

	            <div class="col-md-6">
	                <label>Precio oferta<span class="required">*</span></label>
	                <input type="text" name="p_oferta" id="p_oferta" placeholder="Precio con oferta al publico" value="'.$row[4].'">
	            </div>

	            <div class="col-md-6">
	                <label>Unidades existentes<span class="required">*</span></label>
	                <input type="text" name="stock" id="stock" placeholder="Stock" value="'.$row[1].'">
	            </div>

	            <div class="country-select shop-select col-md-6">
	                <label> Usar precio de oferta ? <span class="required">*</span></label>
	                <select id="use_oferta" name="use_oferta">
	                	'.$select.'
	                </select>                                       
	            </div>
	            
	          </div>
  		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary">Guardar</button>
		        </form>
		      </div>
		    </div>
		  </div>
		  </div>';
		}
		
		return $body;
	}

	function _getProductsDetails($id)
	{
		
		$data = mysqli_query(db_conectar(),"SELECT p.nombre, p.stock, p.oferta, p.precio_normal, p.precio_oferta, p.foto0, p.foto1, p.foto2, p.foto3, p.id, p.descripcion, p.`tiempo de entrega`, p.`no. De parte`, a.nombre, d.nombre, p.marca, p.loc_almacen FROM productos p, almacen a, departamentos d where p.almacen = a.id and p.departamento = d.id and p.id = $id ");
		$con_hijos  = db_conectar();

		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			// Add hijos
			$stock = $row[1];
			$almacen = '<option value='.$row[9].'>'.$row[13].' | '.$row[1].' UDS</option>';
			

			$hijos = mysqli_query($con_hijos,"SELECT s.id, s.padre, a.nombre, s.stock FROM productos_sub s, almacen a where s.almacen = a.id and padre = '$row[9]' ");
			
			while($item = mysqli_fetch_array($hijos))
			{
				$stock = $stock + $item[3];
				$almacen .= '<option value='.$item[0].'>'.$item[2].' | '.$item[3].' UDS</option>';
			} //Finaliza hijos

			$precio = '<span class="new-price">$ '.$row[3].' MXN</span>';
			
			if ($row[2] == 1)
			{
				$precio = '<span class="new-price">$ '.$row[4].' MXN</span>';
				$precio = $precio . ' <span class="old-price">$ '.$row[3].' MXN</span>';
			}
			
			if ($row[2] == 1)
        	{
        		$select = '<option value="1" selected>Si usar</option>
            	 <option value="0">No usar</option>';
        	}
        	else
        	{
        		$select = '<option value="1">Si usar</option>
            	 <option value="0" selected>No usar</option>';
        	}

			$body = $body.'<div class="product-details-area section-padding">
			<div class="container">
				<div class="row">
					<div class="col-sm-5">
						<div class="single-product-image">
							<div id="product-img-content">
								<div id="my-tab-content" class="tab-content mb-30">
									<div class="tab-pane b-img active" id="view1">
										<a href="images/'.$row[5].'" data-gall="gallery" title="Imagen numero 1"><img src="images/'.$row[5].'" alt=""></a>
									</div>
									<div class="tab-pane b-img" id="view2">
										<a href="images/'.$row[6].'" data-gall="gallery" title="Imagen numero 2"><img src="images/'.$row[6].'" alt=""></a>
									</div>
									<div class="tab-pane b-img" id="view3">
										<a href="images/'.$row[7].'" data-gall="gallery" title="Imagen numero 3"><img src="images/'.$row[7].'" alt=""></a>
									</div>
									<div class="tab-pane b-img" id="view4">
										<a href="images/'.$row[8].'" data-gall="gallery" title="Imagen numero 4"><img src="images/'.$row[8].'" alt=""></a>
									</div>
								</div>
								<div id="viewproduct" class="nav nav-tabs product-view bxslider" data-tabs="tabs">
									<div class="pro-view b-img active"><a href="#view1" data-toggle="tab"><img src="images/'.$row[5].'" alt="" style="width: 104px; height: 128px;" ></a></div>
									<div class="pro-view b-img"><a href="#view2" data-toggle="tab"><img src="images/'.$row[6].'" alt="" style="width: 104px; height: 128px;" ></a></div>
									<div class="pro-view b-img"><a href="#view3" data-toggle="tab"><img src="images/'.$row[7].'" alt="" style="width: 104px; height: 128px;" ></a></div>
									<div class="pro-view b-img"><a href="#view4" data-toggle="tab"><img src="images/'.$row[8].'" alt="" style="width: 104px; height: 128px;" ></a></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="product-details-content">
							<div class="product-content text-uppercase">
								<p>NO. DE PARTE '.$row[12].' | '.$row[0].'</p>
								<div class="rating-icon pb-30 mt-10">
									<p>Unidades disponibles: '.$stock.' UDS</>
								</div>
								<div class="product-price pb-30">
								'.$precio.'
								</div>
							</div>
							<div class="product-view pb-30">
								<h4 class="product-details-tilte text-uppercase">Descripcion</h4>
								<p>'.$row[10].'</p>
							</div>
							<div class="product-attributes clearfix">
							<div class="product-color text-uppercase pb-30">
								<h4 class="product-details-tilte text-uppercase pb-10">Almacen</h4>
								<ul>
								<p>'.$row[13].'</p>
								</ul>
							</div>
							<div class="pull-left" id="quantity-wanted">
								<h4 class="product-details-tilte text-uppercase pb-10">Departamento</h4>
								<p>'.$row[14].'</p>
							</div>
							<div class="pull-left" id="quantity-wanted">
								<h4 class="product-details-tilte text-uppercase pb-10">Marca</h4>
								<p>'.$row[15].'</p>
							</div>
						</div>
						<div class="product-attributes clearfix">
							<div class="pull-left" id="quantity-wanted">
								<h4 class="product-details-tilte text-uppercase pb-10">Ubicacion</h4>
								<p>'.$row[16].'</p>
							</div>
							<div class="pull-left" id="quantity-wanted">
								<h4 class="product-details-tilte text-uppercase pb-10">T. Entrega</h4>
								'.$row[11].'
							</div>
						</div>
						<div class="country-select shop-select col-md-12">
							<label> Existencias</label>
							<select>
								'.$almacen.'
							</select>                                       
						</div>
						</div>
					</div>
				</div>
		<!-- End Of Shop Full Grid View -->';
		}
		
		return $body;
	}

	function EmpresaNombre ()
	{
		$data = mysqli_query(db_conectar(),"SELECT nombre FROM empresa ");
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
	        $body = $row[0];
	    }
		return $body;
	}

	function Sale_Descuento ($folio)
	{
		$data = mysqli_query(db_conectar(),"SELECT descuento FROM `folio_venta` where folio = '$folio'");
		$r = "";
		while($row = mysqli_fetch_array($data))
	    {
	        $r = $row[0];
	    }
		return $r;
	}

	function ProductStock ($id)
	{
		$stock_db = 0;

		$data = mysqli_query(db_conectar(),"SELECT stock FROM `productos` where id = '$id' ");
		
		while($row = mysqli_fetch_array($data))
	    {
	        $stock_db = $row[0];
		}
		
		
		return $stock_db;
	}

	function ProductStock_hijo ($id)
	{
		$stock_db = 0;

		$data = mysqli_query(db_conectar(),"SELECT stock FROM `productos_sub` where id = '$id' ");
		
		while($row = mysqli_fetch_array($data))
	    {
	        $stock_db = $row[0];
		}
		
		
		return $stock_db;
	}
	
	function ProductStock_SaleUnidad ($produc, $unidades)
	{
		$data = mysqli_query(db_conectar(),"SELECT stock FROM `productos` where id = '$produc' ");
		
		while($row = mysqli_fetch_array($data))
	    {
	        $stock_db = $row[0];
		}
		
		$r = false;

		if ($unidades <= $stock_db)
		{
			$r = true;
		}

		return $r;
	}

	function CompareFolioOpen ($folio)
	{
		$data = mysqli_query(db_conectar(),"SELECT `open` FROM `folio_venta` where folio = '$folio' ");
		
		while($row = mysqli_fetch_array($data))
	    {
	        $open = $row[0];
		}
		
		if ($open == 0)
		{
			echo '<script>location.href = "products.php?pagina=1"</script>';
		}
	}

	function ProductVentaStock_SaleUnidad ($id, $unidades)
	{
		$data = mysqli_query(db_conectar(),"SELECT p.stock FROM product_venta v, productos p WHERE v.product = p.id and v.id = '$id' ");
		
		while($row = mysqli_fetch_array($data))
	    {
	        $stock_db = $row[0];
		}
		
		$r = false;

		if ($unidades <= $stock_db)
		{
			$r = true;
		}

		return $r;
	}

	function DepartamentosReturnNombre ($id)
	{
		$data = mysqli_query(db_conectar(),"SELECT nombre FROM departamentos where id = $id ");
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
	        $body = $row[0];
	    }
		return $body;
	}

	function AlmacenReturnNombre ($id)
	{
		$data = mysqli_query(db_conectar(),"SELECT nombre FROM almacen where id = $id ");
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
	        $body = $row[0];
	    }
		return $body;
	}

	function table_departamento ()
	{
		$data = mysqli_query(db_conectar(),"SELECT * FROM `departamentos` ORDER by nombre asc");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<tr>
			<td class="item-quality">'.$row[1].'</td>
			<td class="item-des"><p>'.$row[2].'</p></td>
			<td class="item-des">
			
			<div class="col-md-12">
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#modaldepartament_edit'.$row[0].'" ><span> Editar</span> </a>
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#modaldepartament_delete'.$row[0].'" ><span> Eliminar</span> </a>
			</div>
			
			</td>
			</tr>
			';
		}
		
		return $body;
	}

	
	function table_sale_products_finaly_ ($folio)
	{
		$data = mysqli_query(db_conectar(),"SELECT v.unidades, _p.nombre, v.precio, v.id, _p.descripcion, _p.foto0, _p.id, _p.`no. De parte`, _p.marca, _p.stock FROM product_venta v, productos _p WHERE v.product = _p.id and v.folio_venta = '$folio' ");
		$data_ = mysqli_query(db_conectar(),"SELECT v.nombre, c.nombre, f.descuento, f.fecha, f.iva FROM folio_venta f, users v, clients c WHERE f.vendedor = v.id and f.client = c.id and f.folio = '$folio' ");
		$genericos = mysqli_query(db_conectar(),"SELECT unidades, p_generico, precio, id FROM product_venta v WHERE p_generico != '' and folio_venta = '$folio'");

		$total = 0;
		$total_productos = 0;

		$vendedor = "";
		$cliente = "";
		$descuento = 0;
		$fecha = "";

		$body = '<!-- Start Wishlist Area -->
		<div class="wishlist-area">
		<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="wishlist-content">
						<div class="wishlist-table table-responsive p-30 text-uppercase">
							<table>
								<thead>
									<tr>
										<th class="product-thumbnail"></th>
										<th class="product-name"><span class="nobr">Producto</span></th>
										<th class="product-prices"><span class="nobr">Precio </span></th>
										<th class="product-add-to-cart"><span class="nobr">Unidades </span></th>
										<th class="product-remove"><span class="nobr">Quitar</span></th>
									</tr>
								</thead>
								<tbody>';
		while($row = mysqli_fetch_array($data_))
		{
			$vendedor = $row[0];
			$cliente = $row[1];
			$descuento = $row[2];
			$fecha = $row[3];
			$iva = $row[4];
		}

		while($row = mysqli_fetch_array($data))
	    {
			$total = $total + ($row[2] * $row[0]);
			$total_productos = $total_productos + $row[0];

			$body = $body.
			'
			<tr>
			<td class="product-thumbnail"><a target="_blank" href="products_detail.php?id='.$row[6].'" title="'.$row[1].'"><img src="images/'.$row[5].'" alt="" height="110" width="110" /></a></td>
			<td class="product-name pull-left mt-20">
				<a target="_blank" href="products_detail.php?id='.$row[6].'" title="'.$row[4].'">'.$row[1].'</a>
				<p class="w-color m-0">
					<label> No. parte :</label>
					'.$row[7].'
				</p>
				<p class="w-size m-0">
					<label> Marca :</label>
					'.$row[8].'
				</p>
			</td>
			<td class="product-prices"><span class="amount">$ '.$row[2].' MXN</span></td>
			<td class="product-value">
			
			<form action="func/product_sale_update.php" method="post">	
				<input type="hidden" id="id" name="id" value="'.$row[3].'">
				<div class="col-md-12">
					<div class="col-md-8">
					<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
					<input type="number" name="unidades" id="unidades" min="1" max="'.$row[9].'" value="'.$row[0].'" style="text-align:center;">
					</div>
					<div class="col-md-4">
					<button type="submit" class="btn btn-primary"><i class="zmdi zmdi-upload"></i></button>
					</div>
				</div>

			</form>

			</td>
			<td class="product-remove">
			<a href="#" data-toggle="modal" data-target="#modalsalequit'.$row[3].'" >X</a>
			</td>
		</tr>
			';
		}

		//Genericos
		while($row = mysqli_fetch_array($genericos))
	    {
			$total = $total + ($row[0] * $row[2]);
			$total_productos = $total_productos + $row[0];

			$body = $body.
			'
			<tr>
			<td class="product-thumbnail"><a target="_blank" title="'.$row[1].'"><img src="images/'.$row[5].'" alt="" height="110" width="110" /></a></td>
			<td class="product-name pull-left mt-20">
				<a target="_blank"  title="'.$row[4].'">'.$row[1].'</a>
				<p class="w-color m-0">
					<label> No. parte :</label>NA'.$row[7].'
				</p>
				<p class="w-size m-0">
					<label> Marca :</label>NA
				</p>
			</td>
			<td class="product-prices"><span class="amount">$ '.$row[2].' MXN</span></td>
			<td class="product-value">
			
			<form action="func/product_sale_update.php" method="post">	
				<input type="hidden" id="id" name="id" value="'.$row[3].'">
				<div class="col-md-12">
					<div class="col-md-8">
					<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
					<input type="number" name="unidades" id="unidades" min="1" " value="'.$row[0].'" style="text-align:center;">
					</div>
					<div class="col-md-4">
					<button type="submit" class="btn btn-primary"><i class="zmdi zmdi-upload"></i></button>
					</div>
				</div>

			</form>

			</td>
			<td class="product-remove">
			<a href="#" data-toggle="modal" data-target="#modalsalequit'.$row[3].'" >X</a>
			</td>
		</tr>
			';
		}
		
		$ivac = '1.'.$iva;

		$total_ = number_format($total,2,".",",");

		$pagar = $total * ($descuento / 100);

		$total_desc = $pagar;

		$pagar = $total - $pagar;

		$subtotal = number_format($pagar / $ivac,2,".",",");

		$iva_ = number_format($pagar - ($pagar / $ivac),2,".",",");
		
		$pagar = number_format($pagar,2,".",",");

		$body = $body . '
			</tbody>
			</table>
		</div>


		<div class="row">
		<div class="cart-requerment mt-50 clearfix">
			<div class="col-md-4 col-sm-6 clearfix">
				
			</div> 
			<div class="col-md-4 col-sm-6 clearfix">
				<div class="counpon-total ml-35">
					<div class="cart-title text-uppercase">
						<h5 class="mb-30"><strong>INFORMACION</strong></h5>
					</div>
					<p>CLIENTE: '.$cliente.'</p>
					<p>VENDEDOR: '.$vendedor.'</p>
					<p>CREADO: '.$fecha.'</p>                                      
				</div>
			</div> 
			<div class="col-md-offset-0 col-md-4 col-sm-offset-3 col-sm-6 clearfix">
				<div class="counpon-total ml-35">
					<div class="cart-title text-uppercase">
						<h5 class="mb-30"><strong>TOTALES</strong></h5>
					</div>
					<table>
						<tbody>
						<tr class="cart-total">
						<th>Productos</th>
						<td>'.$total_productos.' Unidades</td>
					</tr>
						<tr class="cart-total">
							<th>Total</th>
							<td>$ '.$total_.' MXN</td>
						</tr>
						<tr class="cart-shipping">
							<th> - '.$descuento.' % Desc.</th>
							<td>$ '.$total_desc.' MXN</td>
						</tr>
						<tr class="cart-total">
							<th>Subtotal</th>
							<td>$ '.$subtotal.' MXN</td>
						</tr>
						<tr class="cart-shipping">
							<th> iva '.$iva.' %</th>
							<td>$ '.$iva_.' MXN</td>
						</tr>
						<tr class="cart-total">
							<th>Pagar</th>
							<td>$ '.$pagar.' MXN</td>
						</tr>
						</tbody>
					</table> 
				</div>
			</div>                                            
		</div>
	</div>  
	</div>                            
	</div>
	</div>
	</div>
	</div>
		';
		return $body;
	}

	function table_sale_products_finaly_order ($folio)
	{
		$data = mysqli_query(db_conectar(),"SELECT v.unidades, _p.nombre, v.precio, v.id, _p.descripcion, _p.foto0, _p.id, _p.`no. De parte`, _p.marca, _p.stock FROM product_pedido v, productos _p WHERE v.product = _p.id and  v.folio_venta = '$folio' ");
		$data_ = mysqli_query(db_conectar(),"SELECT v.nombre, c.nombre, f.descuento, f.fecha, f.iva FROM folio_venta f, users v, clients c WHERE f.vendedor = v.id and f.client = c.id and f.folio = '$folio' ");
		$genericos = mysqli_query(db_conectar(),"SELECT unidades, p_generico, precio, id FROM product_pedido v WHERE p_generico != '' and folio_venta = '$folio'");
		$abonos = mysqli_query(db_conectar(),"SELECT folio, cobrado, fecha_venta FROM folio_venta WHERE folio_venta_ini = '$folio'");

		
		$total = 0;
		$total_productos = 0;
		$total_abono = 0;
		$vendedor = "";
		$cliente = "";
		$descuento = 0;
		$fecha = "";

		$body = '
						
		</a>                                                 
		<!-- Start Wishlist Area -->
		<div class="">
		<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="wishlist-content">
						<div class="wishlist-table table-responsive p-30 text-uppercase">
							<table>
								<thead>
									<tr>
										<th class="product-thumbnail"></th>
										<th class="product-name"><span class="nobr">Producto</span></th>
										<th class="product-prices"><span class="nobr">Precio </span></th>
										<th class="product-add-to-cart"><span class="nobr">Unidades </span></th>
										<th class="product-remove"><span class="nobr">Quitar</span></th>
									</tr>
								</thead>
								<tbody>';
		while($row = mysqli_fetch_array($data_))
		{
			$vendedor = $row[0];
			$cliente = $row[1];
			$descuento = $row[2];
			$fecha = $row[3];
			$iva = $row[4];
		}

		while($row = mysqli_fetch_array($abonos))
		{
			$pagos .= '<p>$ '.$row[1].' MXN - '.$row[2].'</p>';
			$total_abono = $total_abono + $row[1];
		}

		
		while($row = mysqli_fetch_array($data))
	    {
			if ($_SESSION['super_pedidos'] == 1)
			{
				$unidades_update = '
				<form action="func/product_sale_update_order.php" method="post">	
				<input type="hidden" id="id" name="id" value="'.$row[3].'">
				<div class="col-md-12">
					<div class="col-md-8">
					<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
					<input type="number" name="unidades" id="unidades" min="1" value="'.$row[0].'" style="text-align:center;">
					</div>
					<div class="col-md-4">
					<button type="submit" class="btn btn-primary"><i class="zmdi zmdi-upload"></i></button>
					</div>
				</div>

			</form>
				';
				$quitar = '<a href="#" data-toggle="modal" data-target="#modalsalequit'.$row[3].'" >X</a>';
			}

			$total = $total + ($row[2] * $row[0]);
			$total_productos = $total_productos + $row[0];

			$body = $body.
			'
			<tr>
			<td class="product-thumbnail"><a target="_blank" href="products_detail.php?id='.$row[6].'" title="'.$row[1].'"><img src="images/'.$row[5].'" alt="" height="110" width="110" /></a></td>
			<td class="product-name pull-left mt-20">
				<a target="_blank" href="products_detail.php?id='.$row[6].'" title="'.$row[4].'">'.$row[1].'</a>
				<p class="w-color m-0">
					<label> No. parte :</label>
					'.$row[7].'
				</p>
				<p class="w-size m-0">
					<label> Marca :</label>
					'.$row[8].'
				</p>
			</td>
			<td class="product-prices"><span class="amount">$ '.$row[2].' MXN</span></td>
			<td class="product-value">
			'.$unidades_update.'
			</td>
			<td class="product-remove">
			'.$quitar.'
			</td>
		</tr>
			';
		}

		//Genericos
		while($row = mysqli_fetch_array($genericos))
	    {
			$total = $total + ($row[0] * $row[2]);
			$total_productos = $total_productos + $row[0];

			$body = $body.
			'
			<tr>
			<td class="product-thumbnail"><a target="_blank" title="'.$row[1].'"><img src="images/'.$row[5].'" alt="" height="110" width="110" /></a></td>
			<td class="product-name pull-left mt-20">
				<a target="_blank"  title="'.$row[4].'">'.$row[1].'</a>
				<p class="w-color m-0">
					<label> No. parte :</label>NA'.$row[7].'
				</p>
				<p class="w-size m-0">
					<label> Marca :</label>NA
				</p>
			</td>
			<td class="product-prices"><span class="amount">$ '.$row[2].' MXN</span></td>
			<td class="product-value">
			
			<form action="func/product_sale_update_order.php" method="post">	
				<input type="hidden" id="id" name="id" value="'.$row[3].'">
				<div class="col-md-12">
					<div class="col-md-8">
					<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
					<input type="number" name="unidades" id="unidades" min="1" value="'.$row[0].'" style="text-align:center;">
					</div>
					<div class="col-md-4">
					<button type="submit" class="btn btn-primary"><i class="zmdi zmdi-upload"></i></button>
					</div>
				</div>

			</form>

			</td>
			<td class="product-remove">
			<a href="#" data-toggle="modal" data-target="#modalsalequit'.$row[3].'" >X</a>
			</td>
		</tr>
			';
		}
		
		$ivac = '1.'.$iva;

		$total_ = number_format($total,2,".",",");

		$pagar = $total * ($descuento / 100);

		$total_desc = $pagar;

		$pagar = $total - $pagar;

		$tt = $pagar - $total_abono;

		$subtotal = number_format($pagar / $ivac,2,".",",");

		$iva_ = number_format($pagar - ($pagar / $ivac),2,".",",");
		
		$pagar = number_format($pagar,2,".",",");
		
		$tt = number_format($tt,2,".",",");
		
		
		$body = $body . '
			</tbody>
			</table>
		</div>


		<div class="row">
		<div class="cart-requerment mt-50 clearfix">
			<div class="col-md-4 col-sm-6 clearfix">
				<div class="counpon-total ml-35">
					<div class="cart-title text-uppercase">
						<h5 class="mb-30"><strong>INFORMACION</strong></h5>
					</div>
					<p>CLIENTE: '.$cliente.'</p>
					<p>VENDEDOR: '.$vendedor.'</p>
					<p>CREADO: '.$fecha.'</p>                                      
				</div>
			</div> 
			<div class="col-md-4 col-sm-6 clearfix">
				<div class="counpon-total ml-35">
				<div class="cart-title text-uppercase">
					<h5 class="mb-30"><strong>Lista de Pagos/Abonos</strong></h5>
				</div>
				'.$pagos.'
				<tr class="cart-total">
					<th>Total abonos</th>
					<td>$ '.$total_abono.' MXN</td>
				</tr>
			</div>
			</div> 
			<div class="col-md-offset-0 col-md-4 col-sm-offset-3 col-sm-6 clearfix">
				<div class="counpon-total ml-35">
					<div class="cart-title text-uppercase">
						<h5 class="mb-30"><strong>TOTALES</strong></h5>
					</div>
					<table>
						<tbody>
						<tr class="cart-total">
						<th>Productos</th>
						<td>'.$total_productos.' Unidades</td>
					</tr>
						<tr class="cart-total">
							<th>Total</th>
							<td>$ '.$total_.' MXN</td>
						</tr>
						<tr class="cart-shipping">
							<th> - '.$descuento.' % Desc.</th>
							<td>$ '.$total_desc.' MXN</td>
						</tr>
						<tr class="cart-total">
							<th>Subtotal</th>
							<td>$ '.$subtotal.' MXN</td>
						</tr>
						<tr class="cart-shipping">
							<th> iva '.$iva.' %</th>
							<td>$ '.$iva_.' MXN</td>
						</tr>
						<tr class="cart-total">
							<th>Total</th>
							<td>$ '.$pagar.' MXN</td>
						</tr>
						<tr class="cart-shipping">
							<th>Abonos</th>
							<td>$ '.$total_abono.' MXN</td>
						</tr>
						<tr class="cart-total">
							<th>Adeudo</th>
							<td>$ '.$tt.' MXN</td>
						</tr>
						</tbody>
					</table>
					
				</div>
			</div>                                            
		</div>
	</div>  
	</div>                            
	</div>
	</div>
	</div>
	</div>
		';
		return $body;
	}

	function table_sale_products_finaly_cotizacion ($folio)
	{
		$data = mysqli_query(db_conectar(),"SELECT v.unidades, _p.nombre, v.precio, v.id, _p.descripcion, _p.foto0, _p.id, _p.`no. De parte`, _p.marca, _p.stock FROM product_venta v, productos _p WHERE v.product = _p.id and v.folio_venta = '$folio' ");
		$data_ = mysqli_query(db_conectar(),"SELECT v.nombre, c.nombre, f.descuento, f.fecha, f.iva FROM folio_venta f, users v, clients c WHERE f.vendedor = v.id and f.client = c.id and f.folio = '$folio' ");
		$genericos = mysqli_query(db_conectar(),"SELECT unidades, p_generico, precio, id FROM product_venta v WHERE p_generico != '' and folio_venta = '$folio'");
		
		$total = 0;
		$total_productos = 0;

		$vendedor = "";
		$cliente = "";
		$descuento = 0;
		$fecha = "";

		$body = '<!-- Start Wishlist Area -->
		<div class="wishlist-area">
		<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="wishlist-content">
						<div class="wishlist-table table-responsive p-30 text-uppercase">
							<table>
								<thead>
									<tr>
										<th class="product-thumbnail"></th>
										<th class="product-name"><span class="nobr">Producto</span></th>
										<th class="product-prices"><span class="nobr">Precio </span></th>
										<th class="product-add-to-cart"><span class="nobr">Unidades </span></th>
										<th class="product-remove"><span class="nobr">Quitar</span></th>
									</tr>
								</thead>
								<tbody>';
		while($row = mysqli_fetch_array($data_))
		{
			$vendedor = $row[0];
			$cliente = $row[1];
			$descuento = $row[2];
			$fecha = $row[3];
			$iva = $row[4];
		}

		while($row = mysqli_fetch_array($data))
	    {
			$total = $total + ($row[2] * $row[0]);
			$total_productos = $total_productos + $row[0];

			$body = $body.
			'
			<tr>
			<td class="product-thumbnail"><a target="_blank" href="products_detail.php?id='.$row[6].'" title="'.$row[1].'"><img src="images/'.$row[5].'" alt="" height="110" width="110" /></a></td>
			<td class="product-name pull-left mt-20">
				<a target="_blank" href="products_detail.php?id='.$row[6].'" title="'.$row[4].'">'.$row[1].'</a>
				<p class="w-color m-0">
					<label> No. parte :</label>
					'.$row[7].'
				</p>
				<p class="w-size m-0">
					<label> Marca :</label>
					'.$row[8].'
				</p>
			</td>
			<td class="product-prices"><span class="amount">$ '.$row[2].' MXN</span></td>
			<td class="product-value">
			
			<form action="func/product_sale_update.php" method="post">	
				<input type="hidden" id="id" name="id" value="'.$row[3].'">
				<div class="col-md-12">
					<div class="col-md-8">
					<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
					<input type="number" name="unidades" id="unidades" min="1" max="'.$row[9].'" value="'.$row[0].'" style="text-align:center;">
					</div>
					<div class="col-md-4">
					<button type="submit" class="btn btn-primary"><i class="zmdi zmdi-upload"></i></button>
					</div>
				</div>

			</form>

			</td>
			<td class="product-remove">
			<a href="#" data-toggle="modal" data-target="#modalsalequit'.$row[3].'" >X</a>
			</td>
		</tr>
			';
		}

		//Genericos
		while($row = mysqli_fetch_array($genericos))
	    {
			$total = $total + ($row[0] * $row[2]);
			$total_productos = $total_productos + $row[0];

			$body = $body.
			'
			<tr>
			<td class="product-thumbnail"><a target="_blank" title="'.$row[1].'"><img src="images/'.$row[5].'" alt="" height="110" width="110" /></a></td>
			<td class="product-name pull-left mt-20">
				<a target="_blank"  title="'.$row[4].'">'.$row[1].'</a>
				<p class="w-color m-0">
					<label> No. parte :</label>NA'.$row[7].'
				</p>
				<p class="w-size m-0">
					<label> Marca :</label>NA
				</p>
			</td>
			<td class="product-prices"><span class="amount">$ '.$row[2].' MXN</span></td>
			<td class="product-value">
			
			<form action="func/product_sale_update.php" method="post">	
				<input type="hidden" id="id" name="id" value="'.$row[3].'">
				<div class="col-md-12">
					<div class="col-md-8">
					<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
					<input type="number" name="unidades" id="unidades" min="1" " value="'.$row[0].'" style="text-align:center;">
					</div>
					<div class="col-md-4">
					<button type="submit" class="btn btn-primary"><i class="zmdi zmdi-upload"></i></button>
					</div>
				</div>

			</form>

			</td>
			<td class="product-remove">
			<a href="#" data-toggle="modal" data-target="#modalsalequit'.$row[3].'" >X</a>
			</td>
		</tr>
			';
		}

		$ivac = '1.'.$iva;

		$total_ = number_format($total,2,".",",");

		$pagar = $total * ($descuento / 100);

		$total_desc = $pagar;

		$pagar = $total - $pagar;

		$subtotal = number_format($pagar / $ivac,2,".",",");

		$iva_ = number_format($pagar - ($pagar / $ivac),2,".",",");
		
		$pagar = number_format($pagar,2,".",",");
		
		$body = $body . '
			</tbody>
			</table>
		</div>


		<div class="row">
		<div class="cart-requerment mt-50 clearfix">
			<div class="col-md-4 col-sm-6 clearfix">
				
			</div> 
			<div class="col-md-4 col-sm-6 clearfix">
				<div class="counpon-total ml-35">
					<div class="cart-title text-uppercase">
						<h5 class="mb-30"><strong>INFORMACION</strong></h5>
					</div>
					<p>CLIENTE: '.$cliente.'</p>
					<p>VENDEDOR: '.$vendedor.'</p>
					<p>CREADO: '.$fecha.'</p>                                      
				</div>
			</div> 
			<div class="col-md-offset-0 col-md-4 col-sm-offset-3 col-sm-6 clearfix">
				<div class="counpon-total ml-35">
					<div class="cart-title text-uppercase">
						<h5 class="mb-30"><strong>TOTALES</strong></h5>
					</div>
					<table>
						<tbody>
							<tr class="cart-total">
								<th>Productos</th>
								<td>'.$total_productos.' Unidades</td>
							</tr>
							<tr class="cart-total">
								<th>Total</th>
								<td>$ '.$total_.' MXN</td>
							</tr>
							<tr class="cart-shipping">
								<th> - '.$descuento.' % Desc.</th>
								<td>$ '.$total_desc.' MXN</td>
							</tr>
							<tr class="cart-total">
								<th>Subtotal</th>
								<td>$ '.$subtotal.' MXN</td>
							</tr>
							<tr class="cart-shipping">
								<th> iva '.$iva.' %</th>
								<td>$ '.$iva_.' MXN</td>
							</tr>
							<tr class="cart-total">
								<th>Pagar</th>
								<td>$ '.$pagar.' MXN</td>
							</tr>
						</tbody>
					</table> 
				</div>
			</div>                                            
		</div>
	</div>  
	</div>                            
	</div>
	</div>
	</div>
	</div>
		';
		return $body;
	}

	function table_clientes ($pagina)
	{
		$TAMANO_PAGINA = 5;

		if (!$pagina) {
			$inicio = 0;
			$pagina = 1;
		}
		else {
			$inicio = ($pagina - 1) * $TAMANO_PAGINA;
		}
		
		$data = mysqli_query(db_conectar(),"SELECT id, nombre, direccion FROM `clients` ORDER by nombre asc LIMIT $inicio, $TAMANO_PAGINA");
		$datatmp = mysqli_query(db_conectar(),"SELECT id FROM clients");

		$pagination = '<div>
						<div class="col-md-12">
						<div class="shop-pagination p-20 text-center">
							<ul>';

		
		$num_total_registros = mysqli_num_rows($datatmp);
		$total_paginas = ceil($num_total_registros / $TAMANO_PAGINA);

		if ($pagina > 1)
		{
			$pagination = $pagination . '<li><a href="?pagina='.($pagina - 1 ).'" ><i class="zmdi zmdi-chevron-left"></i></a></li>';
		}
	
		if ($total_paginas > 1) {

			for ($i=1;$i<=$total_paginas;$i++) {
				if ($pagina == $i)
					$pagination = $pagination . '<li><a href="#">...</a></li>';
				else
					$pagination = $pagination . '<li><a href="?pagina='.$i.'">'.$i.'</a></li>';
			}
		}
		if ($pagina < $total_paginas)
		{
			$pagination = $pagination . '<li><a href="?pagina='.($pagina + 1 ).'" ><i class="zmdi zmdi-chevron-right"></i></a></li>';
		}
		
		$pagination = $pagination . '</ul>
									</div>
									</div>
									</div><p>';
		$body = '
		<div class="table-responsive compare-wraper mt-30">
				<table class="cart table">
					<thead>
						<tr>
							<th class="table-head th-name uppercase">NOMBRE CLIENTE</th>
							<th class="table-head item-nam">DIRECCION</th>
							<th class="table-head item-nam">OPCIONES</th>
						</tr>
					</thead>
					<tbody>';
		$body = $body . $pagination;

		while($row = mysqli_fetch_array($data))
	    {
			if ($_SESSION['client_guest'] == 1)
			{
				$boton = '
				<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#modalclient_edit'.$row[0].'" ><span> Editar</span> </a>
				<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#modalclient_delete'.$row[0].'" ><span> Eliminar</span> </a>
				';
			}else {
				$boton = '
				<p>Sin opciones</p>
				';
			}


			$body = $body.'
			<tr>
			<td class="item-quality">'.$row[1].'</td>
			<td class="item-des"><p>'.$row[2].'</p></td>
			<td class="item-des">
			
			<div class="col-md-12">
			'.$boton.'
			</div>
			
			</td>
			</tr>
			';
		}
		$body = $body . '
		</tbody>
			</table>
		</div>';

		$body = $body . $pagination;
		return $body;
	}

	function table_UsersModal ()
	{
		$data = mysqli_query(db_conectar(),"SELECT id, nombre, imagen, product_add, product_gest, gen_orden_compra, client_add, client_guest, almacen_add, almacen_guest, depa_add, depa_guest, propiedades, usuarios, finanzas,change_suc, sucursal_gest, sucursal, descripcion, caja, super_pedidos  FROM `users` ORDER by nombre asc");
		$permisos = '';
		$select = Select_sucursales();
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			if ($row[3] == 1)
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Agregar producto
						<input type="checkbox" checked id="product_add" name="product_add">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}else
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Agregar producto
						<input type="checkbox" id="product_add" name="product_add">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}
			if ($row[4] == 1)
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Gestionar producto
						<input type="checkbox" checked id="product_gest" name="product_gest">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}else
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Gestionar producto
						<input type="checkbox" id="product_gest" name="product_gest">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}
			if ($row[5] == 1)
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Generar orden de compra
						<input type="checkbox" checked id="gen_orden_compra"  name="gen_orden_compra">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}else
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Generar orden de compra
						<input type="checkbox" id="gen_orden_compra"  name="gen_orden_compra">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}
			if ($row[6] == 1)
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Agregar cliente
						<input type="checkbox" checked id="client_add" name="client_add">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}else
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Agregar cliente
						<input type="checkbox" id="client_add" name="client_add">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}
			if ($row[7] == 1)
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Gestionar clientes
						<input type="checkbox" checked id="client_guest" name="client_guest">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}else
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Gestionar clientes
						<input type="checkbox" id="client_guest" name="client_guest">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}
			if ($row[8] == 1)
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Agregar almacen
						<input type="checkbox" checked name="almacen_add" id="almacen_add">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}else
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Agregar almacen
						<input type="checkbox" name="almacen_add" id="almacen_add">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}
			if ($row[9] == 1)
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Gestionar almacen
						<input type="checkbox" checked name="almacen_guest" id="almacen_guest">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}else
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Gestionar almacen
						<input type="checkbox" name="almacen_guest" id="almacen_guest">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}
			if ($row[10] == 1)
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Agregar departamento
						<input type="checkbox" checked id="depa_add" name="depa_add">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}else
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Agregar departamento
						<input type="checkbox" id="depa_add" name="depa_add">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}
			if ($row[11] == 1)
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Gestionar departamento
						<input type="checkbox" checked id="depa_guest" name="depa_guest">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}else
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Gestionar departamento
						<input type="checkbox" id="depa_guest" name="depa_guest">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}
			if ($row[12] == 1)
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Acceso a propiedades
						<input type="checkbox" checked id="propiedades" name="propiedades">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}else
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Acceso a propiedades
						<input type="checkbox" id="propiedades" name="propiedades">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}
			if ($row[13] == 1)
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Acceso a usuario
						<input type="checkbox" checked id="usuarios" name="usuarios">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}else
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Acceso a usuario
						<input type="checkbox" id="usuarios" name="usuarios">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}
			if ($row[14] == 1)
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Acceso a finanzas
						<input type="checkbox" checked id="finanzas" name="finanzas">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}else
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Acceso a finanzas
						<input type="checkbox" id="finanzas" name="finanzas">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}
			if ($row[15] == 1)
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Cambiar sucursal
						<input type="checkbox" checked id="change_suc" name="change_suc">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}else
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Cambiar sucursal
						<input type="checkbox" id="change_suc" name="change_suc">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}
			if ($row[16] == 1)
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Gestionar sucursal
						<input type="checkbox" checked id="sucursal_gest" name="sucursal_gest">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}else
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Gestionar sucursal
						<input type="checkbox" id="sucursal_gest" name="sucursal_gest">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}
			if ($row[19] == 1)
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Usar caja
						<input type="checkbox" checked id="caja" name="caja">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}else
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Usar caja
						<input type="checkbox" id="caja" name="caja">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}

			if ($row[20] == 1)
			{
				$permisos .= '
				<div class="col-md-4">
					<label class="containeruser">Permitir ventas
						<input type="checkbox" checked id="super_pedidos" name="super_pedidos">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}else
			{
				$permisos .= '
				<div class="col-md-4">
				<label class="containeruser">Permitir ventas
						<input type="checkbox" id="super_pedidos" name="super_pedidos">
						<span class="checkmark"></span>
					</label>
				</div>
				';
			}
			
			$body = $body.'
			<!-- Modal -->
			<div class="modal fade" id="useredit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"><img src = "images/'.$row[2].'" style="
					height: 50px;
					width: 50px;
					background-repeat: no-repeat;
					background-position: 50%;
					border-radius: 50%;
					background-size: 100% auto;
					"> '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<form id="contact-form" action="func/update_user.php" method="post" autocomplete="off" enctype="multipart/form-data">
					<div class="row">
					<input type="hidden" id="id" name="id" value="'.$row[0].'">
					
					<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
					<div class="col-md-12">
						<label>Nombre de usuario<span class="required">*</span></label>
						<input type="text" name="nombre" id="nombre" placeholder="Nombre o razon social" required value="'.$row[1].'">
					</div>
					<div class="country-select shop-select col-md-12">
						<br><label>Seleccione imagen si desea cambiarla<span class="required">*</span></label>
						<input type="file" name="imagen" id="imagen" accept="image/jpeg,image/jpg" >
					</div>
					<div class="col-md-12">
						<br>
						<label>Seleccione sucursal de venta predeterminada<span class="required">*</span></label>
						<select id="suc'.$row[0].'" name="suc'.$row[0].'">
							'. $select .'
						</select>
						<script>
							document.getElementById("suc'.$row[0].'").value = "'.$row[17].'";
						</script>
					
					</div>
					<div class="col-md-12">
						<br><label>Descripcion usuario</label>
						<input type="text" name="descripcion" id="descripcion" value="'.$row[18].'">
					</div>
					<div class="col-md-12">
						<br><label>Ingrese contraseña si desea cambiarla</label>
						<input type="password" name="pass1" id="pass1">
					</div>
					<div class="col-md-12">
						<br><label>Confirme contraseña</label>
						<input type="password" name="pass2" id="pass2">
					</div>
					<div class="col-md-12">
						<div class="section-title-2 text-uppercase mb-40 text-center">
							<br><h5>PERMISOS DE USUARIO</h5>
						</div>
					</div>
					'.$permisos.'
			</div>
      
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Actualizar</button>
					</form>
				</div>
				</div>
			</div>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="userdelete'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">ELIMINAR USUARIO: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="../func/user_delete.php" autocomplete="off" method="post">
					<div class="row">
						<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
						<input type="hidden" name="id" id="id" value="'.$row[0].'">
						<div class="col-md-12">
						<br>
						<label>Esta seguro de eliminar el usuario ? Al eliminarlo, todas sus ventas y registros seran borrados sin poder recuperarlo.</label>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-danger">Eliminar</button>
					</form>
				</div>
				</div>
			</div>
			</div>
			';
			$permisos = '';
		}
		
		return $body;
	}

	function table_users()
	{
		$data = mysqli_query(db_conectar(),"SELECT id, nombre, username  FROM `users` ORDER by nombre asc");
		$body = '
		<div class="table-responsive compare-wraper mt-30">
				<table class="cart table">
					<thead>
						<tr>
							<th class="table-head th-name uppercase">NOMBRE USUARIO</th>
							<th class="table-head th-name uppercase">USERNAME</th>
							<th class="table-head th-name uppercase">OPCIONES</th>
						</tr>
					</thead>
					<tbody>';
		$body = $body . $pagination;

		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<tr>
			<td class="item-des">'.$row[1].'</td>
			<td class="item-des"><p>'.$row[2].'</p></td>
			<td class="item-des">
			
			<div class="col-md-12">
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#useredit'.$row[0].'" ><span> Editar</span> </a>
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#userdelete'.$row[0].'" ><span> Eliminar</span> </a>
			</div>
			
			</td>
			</tr>
			';
		}
		$body = $body . '
		</tbody>
			</table>
		</div>';

		$body = $body . $pagination;
		return $body;
	}

	function table_orders()
	{
		$data = mysqli_query(db_conectar(),"SELECT f.folio, u.nombre, c.nombre, f.fecha FROM folio_venta f, users u, clients c, sucursales s WHERE f.open = 1 and f.pedido = 1 and f.vendedor = u.id and f.client = c.id and f.sucursal = s.id");
		$body = '
		<form class="header-search-box" action="orders.php">
			<div>
				<input type="text" placeholder="Buscar" name="search" autocomplete="off">
			</div>
		</form>
		<div class="table-responsive compare-wraper mt-30">
		<table class="cart table">
			<thead>
				<tr>
					<th class="table-head th-name uppercase">FOLIO PEDIDO</th>
					<th class="table-head th-name uppercase">vendedor</th>
					<th class="table-head th-name uppercase">cliente</th>
					<th class="table-head th-name uppercase">creado</th>
					<th class="table-head th-name uppercase">opciones</th>
				</tr>
			</thead>
			<tbody>';
		$body = $body . $pagination;

		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<tr>
			<td class="item-des"><a href="/sale_order.php?folio='.$row[0].'">'.$row[0].'</a></td>
			<td class="item-des"><p>'.$row[1].'</p></td>
			<td class="item-des">'.$row[2].'</td>
			<td class="item-des">'.$row[3].'</td>
			
			<td class="item-des">
				<div class="col-md-12">
					
					<div class="col-md-6">
						<a href="/sale_order.php?folio='.$row[0].'" class="button extra-small button-black mb-20" ><span> Ver</span></a>
					</div>

					<div class="col-md-6">
					<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#edit'.$row[0].'" ><span> +</span></a>
					</div>
					
				</div>
			</td>
			</tr>
			';
			/*
			<div class="col-md-12">
				<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#edit'.$row[0].'" ><span> Opciones</span></a>
			</div>
			*/
		}
		$body = $body . '
		</tbody>
			</table>
		</div>';

		$body = $body . $pagination;
		return $body;
	}

	function table_cotizaciones()
	{
		$data = mysqli_query(db_conectar(),"SELECT f.folio, u.nombre, c.nombre, f.fecha FROM folio_venta f, users u, clients c, sucursales s WHERE f.open = 1 and f.pedido = 0 and f.cotizacion = 1 and f.vendedor = u.id and f.client = c.id and f.sucursal = s.id");
		$body = '
		<form class="header-search-box" action="cotizaciones.php">
			<div>
				<input type="text" placeholder="Buscar" name="search" autocomplete="off">
			</div>
		</form>
		<div class="table-responsive compare-wraper mt-30">
				<table class="cart table">
					<thead>
						<tr>
							<th class="table-head th-name uppercase">FOLIO cotizacion</th>
							<th class="table-head th-name uppercase">vendedor</th>
							<th class="table-head th-name uppercase">cliente</th>
							<th class="table-head th-name uppercase">creado</th>
							<th class="table-head th-name uppercase">opciones</th>
						</tr>
					</thead>
					<tbody>';
		$body = $body . $pagination;

		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<tr>
			<td class="item-des"><a href="/sale_cot.php?folio='.$row[0].'">'.$row[0].'</a></td>
			<td class="item-des"><p>'.$row[1].'</p></td>
			<td class="item-des">'.$row[2].'</td>
			<td class="item-des">'.$row[3].'</td>
			
			<td class="item-des">
				<div class="col-md-12">
					
					<div class="col-md-6">
						<a href="/sale_cot.php?folio='.$row[0].'" class="button extra-small button-black mb-20" ><span> Ver</span></a>
					</div>

					<div class="col-md-6">
						<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#edit'.$row[0].'" ><span> +</span></a>
					</div>
					
				</div>
			</td>
			
			</tr>
			';
		}
		/*Opciones
		<td class="item-des">
		<div class="col-md-12">
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#edit'.$row[0].'" ><span> Opciones</span></a>
		</div>
		
		</td>
		*/
		$body = $body . '
		</tbody>
			</table>
		</div>';

		$body = $body . $pagination;
		return $body;
	}

	function table_orders_search($txt)
	{
		$data = mysqli_query(db_conectar(),"SELECT f.folio, u.nombre, c.nombre, f.fecha FROM folio_venta f, users u, clients c, sucursales s WHERE f.open = 1 and f.pedido = 1 and f.vendedor = u.id and f.client = c.id and f.sucursal = s.id and f.folio like '%$txt%' or f.open = 1 and f.pedido = 1 and f.vendedor = u.id and f.client = c.id and f.sucursal = s.id and c.nombre like '%$txt%' or f.open = 1 and f.pedido = 1 and f.vendedor = u.id and f.client = c.id and f.sucursal = s.id and u.nombre like '%$txt%'");
		$body = '
		<form class="header-search-box" action="orders.php">
			<div>
				<input type="text" placeholder="Buscar" name="search" autocomplete="off">
			</div>
		</form>
		<div class="table-responsive compare-wraper mt-30">
				<table class="cart table">
					<thead>
						<tr>
							<th class="table-head th-name uppercase">FOLIO PEDIDO</th>
							<th class="table-head th-name uppercase">vendedor</th>
							<th class="table-head th-name uppercase">cliente</th>
							<th class="table-head th-name uppercase">creado</th>
							<th class="table-head th-name uppercase">opciones</th>
						</tr>
					</thead>
					<tbody>';
		$body = $body . $pagination;

		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<tr>
			<td class="item-des"><a href="/sale_finaly_order.php?folio='.$row[0].'">'.$row[0].'</a></td>
			<td class="item-des"><p>'.$row[1].'</p></td>
			<td class="item-des">'.$row[2].'</td>
			<td class="item-des">'.$row[3].'</td>
			<td class="item-des">
				<div class="col-md-12">
					
					<div class="col-md-6">
						<a href="/sale_order.php?folio='.$row[0].'" class="button extra-small button-black mb-20" ><span> Ver</span></a>
					</div>

					<div class="col-md-6">
					<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#edit'.$row[0].'" ><span> +</span></a>
					</div>
					
				</div>
			</td>
			</tr>
			';
		}
		$body = $body . '
		</tbody>
			</table>
		</div>';

		$body = $body . $pagination;
		return $body;
	}

	function table_cotizaciones_search($txt)
	{
		$data = mysqli_query(db_conectar(),"SELECT f.folio, u.nombre, c.nombre, f.fecha FROM folio_venta f, users u, clients c, sucursales s WHERE f.open = 1 and f.cotizacion = 1 and f.vendedor = u.id and f.client = c.id and f.sucursal = s.id and f.folio like '%$txt%' or f.open = 1 and f.cotizacion = 1 and f.vendedor = u.id and f.client = c.id and f.sucursal = s.id and c.nombre like '%$txt%' or f.open = 1 and f.cotizacion = 1 and f.cotizacion = 1 and f.vendedor = u.id and f.client = c.id and f.sucursal = s.id and u.nombre like '%$txt%'");
		$body = '
		<form class="header-search-box" action="cotizaciones.php">
			<div>
				<input type="text" placeholder="Buscar" name="search" autocomplete="off">
			</div>
		</form>
		<div class="table-responsive compare-wraper mt-30">
				<table class="cart table">
					<thead>
						<tr>
							<th class="table-head th-name uppercase">FOLIO cotizacion</th>
							<th class="table-head th-name uppercase">vendedor</th>
							<th class="table-head th-name uppercase">cliente</th>
							<th class="table-head th-name uppercase">creado</th>
							<th class="table-head th-name uppercase">opciones</th>
						</tr>
					</thead>
					<tbody>';
		$body = $body . $pagination;

		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<tr>
			<td class="item-des"><a <a href="/sale_cot.php?folio='.$row[0].'">'.$row[0].'</a></td>
			<td class="item-des"><p>'.$row[1].'</p></td>
			<td class="item-des">'.$row[2].'</td>
			<td class="item-des">'.$row[3].'</td>
			
			<td class="item-des">
				<div class="col-md-12">
					
					<div class="col-md-6">
						<a href="/sale_cot.php?folio='.$row[0].'" class="button extra-small button-black mb-20" ><span> Ver</span></a>
					</div>

					<div class="col-md-6">
						<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#edit'.$row[0].'" ><span> +</span></a>
					</div>
					
				</div>
			</td>
			
			</tr>
			';
			/*Opciones
			<td class="item-des">
			<div class="col-md-12">
				<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#edit'.$row[0].'" ><span> Opciones</span></a>
			</div>
			
			</td>
			*/
		}
		$body = $body . '
		</tbody>
			</table>
		</div>';

		$body = $body . $pagination;
		return $body;
	}

	function view_move($usuario, $sucursal)
	{
		if ($_SESSION['finanzas'] == 1)
		{
			if ($usuario > 0 && $sucursal > 0)
			{
				$data = mysqli_query(db_conectar(),"SELECT v.folio, u.nombre, c.nombre, v.descuento, v.fecha, v.open, v.cobrado, v.fecha_venta, v.cut, s.nombre, v.t_pago, v.concepto , v.pedido FROM folio_venta v, sucursales s, users u, clients c where v.sucursal = s.id and v.vendedor = u.id and v.client = c.id and v.open = 0 and v.cut = 0 and v.cut_global = 0 and s.id = '$sucursal' and u.id = '$usuario' ");
			}
			elseif ($usuario == 0 && $sucursal == 0)
			{
				$data = mysqli_query(db_conectar(),"SELECT v.folio, u.nombre, c.nombre, v.descuento, v.fecha, v.open, v.cobrado, v.fecha_venta, v.cut, s.nombre, v.t_pago, v.concepto , v.pedido FROM folio_venta v, sucursales s, users u, clients c where v.sucursal = s.id and v.vendedor = u.id and v.client = c.id and v.open = 0 and v.cut = 0 and v.cut_global = 0");
			}
			elseif ($usuario > 0 && $sucursal == 0)
			{
				$data = mysqli_query(db_conectar(),"SELECT v.folio, u.nombre, c.nombre, v.descuento, v.fecha, v.open, v.cobrado, v.fecha_venta, v.cut, s.nombre, v.t_pago, v.concepto , v.pedido FROM folio_venta v, sucursales s, users u, clients c where v.sucursal = s.id and v.vendedor = u.id and v.client = c.id and v.open = 0 and v.cut = 0 and v.cut_global = 0 and u.id = '$usuario'");
			}
			elseif ($usuario == 0 && $sucursal > 0)
			{
				$data = mysqli_query(db_conectar(),"SELECT v.folio, u.nombre, c.nombre, v.descuento, v.fecha, v.open, v.cobrado, v.fecha_venta, v.cut, s.nombre, v.t_pago, v.concepto , v.pedido FROM folio_venta v, sucursales s, users u, clients c where v.sucursal = s.id and v.vendedor = u.id and v.client = c.id and v.open = 0 and v.cut = 0 and v.cut_global = 0 and s.id = '$sucursal'");
			}
		}else
		{
			$data = mysqli_query(db_conectar(),"SELECT v.folio, u.nombre, c.nombre, v.descuento, v.fecha, v.open, v.cobrado, v.fecha_venta, v.cut, s.nombre, v.t_pago, v.concepto, v.pedido  FROM folio_venta v, sucursales s, users u, clients c where v.sucursal = s.id and v.vendedor = u.id and v.client = c.id and v.open = 0 and v.cut = 0 and v.vendedor = $_SESSION[users_id] ");
		}

		$body = '
		<div class="table-responsive compare-wraper mt-30">
				<table class="cart table">
					<thead>
						<tr>
							<th class="table-head th-name uppercase">VENDEDOR</th>
							<th class="table-head th-name uppercase">CLIENTE</th>
							<th class="table-head th-name uppercase">FOLIO</th>
							<th class="table-head th-name uppercase">SUCURSAL</th>
							<th class="table-head th-name uppercase">FECHA VENTA</th>
							<th class="table-head th-name uppercase">concepto</th>
							<th class="table-head th-name uppercase"><center>cantidad</center></th>
						</tr>
					</thead>
					<tbody>';
		$body = $body . $pagination;
		$total = 0;
		
		while($row = mysqli_fetch_array($data))
	    {
			if ($row[10] == "efectivo")
			{
				$efectivo = $efectivo + $row[6];
				
				if (!$row[11])
				{
					$row[11] = "Venta";
					if ($row[12] == 1)
					{
						$folio = '<td class="item-des"><a href="sale_finaly_report_order.php?folio='.$row[0].'">'.$row[0].'</a></td>';
					}else
					{
						$folio = '<td class="item-des"><a href="sale_finaly_report.php?folio_sale='.$row[0].'">'.$row[0].'</a></td>';
					}
				}else
				{
					$folio = '<td class="item-des">'.$row[0].'</td>';
				}

				

				$body = $body.'
				<tr>
				<td class="item-des">'.$row[1].'</td>
				<td class="item-des">'.$row[2].'</td>
				'.$folio.'
				<td class="item-des"><p>'.$row[9].'</p></td>
				<td class="item-des"><p>'.$row[4].'</p></td>
				<td class="item-des uppercase"><p><center>'.$row[11].'</center></p></td>
				<td class="item-des"><p><center>$ '.$row[6].' MXN</center></p></td>
				</tr>
				';
				$total = $total + $row[6];
			}
			elseif ($row[10] == "transferencia")
			{
				$transferencia = $transferencia + $row[6];
			}
			elseif ($row[10] == "tarjeta")
			{
				$cheque = $cheque + $row[6];
			}
		}

		$body = $body . '
		</tbody>
			</table>
		</div>
		<br>
		<div align="right">
		';

		if ($efectivo > 0)
		{
			$body = $body . '
			<h5>Efectivo: $ '.number_format($efectivo,2,".",",").' MXN</h5>
			';
		}

		/*if ($transferencia > 0)
		{
			$body = $body . '
			<h5>Tranferencia: $ '.number_format($transferencia,2,".",",").' MXN</h5>
			';
		}

		if ($cheque > 0)
		{
			$body = $body . '
			<h5>Tarjeta: $ '.number_format($cheque,2,".",",").' MXN</h5>
			';
		}*/
		
		$body = $body . '
			<h4>TOTAL RECAUDADO: $ '.number_format($efectivo,2,".",",").' MXN</h4>
		</div>
		';

		

		return $body;
	}

	function table_finance($inicio, $finaliza, $folio, $vendedor, $sucursal)
	{
		//$inicio = '2018-07-18 00:00:00';
		//$finaliza = '2018-07-18 23:59:59';
		$inicio .= ' 00:00:00';
		$finaliza .= ' 23:59:59';
		$total = 0;

		if ($folio != "" && $vendedor == 0 && $sucursal == 0)
		{
			$data = mysqli_query(db_conectar(),"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.t_pago, f.pedido, f.concepto FROM folio_venta f, clients c, users v, sucursales s  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.sucursal = s.id and f.folio like '%$folio%'");
		}
		elseif ($folio == "" && $vendedor > 0 && $sucursal == 0)
		{
			$data = mysqli_query(db_conectar(),"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.t_pago, f.pedido, f.concepto FROM folio_venta f, clients c, users v, sucursales s  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.sucursal = s.id and f.fecha_venta >= '$inicio' and f.fecha_venta <= '$finaliza' and f.vendedor = '$vendedor'");
		}
		elseif ($folio == "" && $vendedor == 0 && $sucursal > 0)
		{
			$data = mysqli_query(db_conectar(),"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.t_pago, f.pedido , f.conceptoFROM folio_venta f, clients c, users v, sucursales s  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.sucursal = s.id and f.fecha_venta >= '$inicio' and f.fecha_venta <= '$finaliza' and f.sucursal = '$sucursal'");
		}
		elseif ($folio == "" && $vendedor > 0 && $sucursal > 0)
		{
			$data = mysqli_query(db_conectar(),"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.t_pago, f.pedido, f.concepto FROM folio_venta f, clients c, users v, sucursales s  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.sucursal = s.id and f.fecha_venta >= '$inicio' and f.fecha_venta <= '$finaliza' and f.sucursal = '$sucursal' and f.vendedor = '$vendedor' ");
		}
		else
		{
			$data = mysqli_query(db_conectar(),"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.t_pago, f.pedido, f.concepto FROM folio_venta f, clients c, users v, sucursales s  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.sucursal = s.id and f.fecha_venta >= '$inicio' and f.fecha_venta <= '$finaliza'");
		}
		
		$body = '
		<div class="table-responsive compare-wraper mt-30">
				<table class="cart table">
					<thead>
						<tr>
							<th class="table-head th-name uppercase">FOLIO</th>
							<th class="table-head th-name uppercase">VENDEDOR</th>
							<th class="table-head th-name uppercase">CLIENTE</th>
							<th class="table-head th-name uppercase">SUCURSAL</th>
							<th class="table-head th-name uppercase">F.VENTA</th>
							<th class="table-head th-name uppercase">COBRADO</th>
							<th class="table-head th-name uppercase">m. pago</th>
							<th class="table-head th-name uppercase">Eliminar</th>
						</tr>
					</thead>
					<tbody>';
		
		while($row = mysqli_fetch_array($data))
	    {
			if (!$row[10])
			{
				if ($row[8] == "efectivo")
				{
					$efectivo = $efectivo + $row[5];
				}
				elseif ($row[8] == "transferencia")
				{
					$transferencia = $transferencia + $row[5];
				}
				elseif ($row[8] == "tarjeta")
				{
					$cheque = $cheque + $row[5];
				}
				
				if ($row[9] == 1)
				{
					$folio_ = '<td class="item-des"><a href="sale_finaly_report_order.php?folio='.$row[0].'">'.$row[0].'</a></td>';
				}else
				{
					$folio_ = '<td class="item-des"><a href="sale_finaly_report.php?folio_sale='.$row[0].'">'.$row[0].'</a></td>';
				}

				$body = $body.'
				<tr>
				'.$folio_.'
				<td class="item-des"><p>'.$row[1].'</p></td>
				<td class="item-des"><p>'.$row[2].'</p></td>
				<td class="item-des"><p>'.$row[7].'</p></td>
				<td class="item-des"><p>'.$row[6].'</p></td>
				<td class="item-des"><center><p>$ '.$row[5].' MXN</p></center></td>
				<td class="item-des uppercase"><center><p>'.$row[8].'</p></center></td>
				<td class="item-des uppercase"><center>
					<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#delete'.$row[0].'" ><span> X</span> </a>
				</center></td>
				</tr>
				';
				$total = $total + $row[5];
			}
		}
		$body = $body . '
		</tbody>
			</table>
		</div>
		<br>
		<div align="right">
		';

		if ($efectivo > 0)
		{
			$body = $body . '
			<h5>Efectivo: $ '.number_format($efectivo,2,".",",").' MXN</h5>
			';
		}

		if ($transferencia > 0)
		{
			$body = $body . '
			<h5>Tranferencia: $ '.number_format($transferencia,2,".",",").' MXN</h5>
			';
		}

		if ($cheque > 0)
		{
			$body = $body . '
			<h5>Tarjeta: $ '.number_format($cheque,2,".",",").' MXN</h5>
			';
		}
		
		$body = $body . '
			<h4>TOTAL RECAUDADO: $ '.number_format($total,2,".",",").' MXN</h4>
		</div>
		';

		return $body;
	}

	function table_finance_product($inicio, $finaliza, $product)
	{
		//$inicio = '2018-07-18 00:00:00';
		//$finaliza = '2018-07-18 23:59:59';
		$inicio .= ' 00:00:00';
		$finaliza .= ' 23:59:59';
		$total = 0;
		$tmp = db_conectar();
		$t_ud = 0;
		$data = mysqli_query(db_conectar(),"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.t_pago, f.pedido, f.concepto FROM folio_venta f, clients c, users v, sucursales s  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.sucursal = s.id and f.fecha_venta >= '$inicio' and f.fecha_venta <= '$finaliza'");
		
		$body = '
		<div class="table-responsive compare-wraper mt-30">
				<table class="cart table">
					<thead>
						<tr>
							<th class="table-head th-name uppercase">FOLIO</th>
							<th class="table-head th-name uppercase">VENDEDOR</th>
							<th class="table-head th-name uppercase">CLIENTE</th>
							<th class="table-head th-name uppercase">F.VENTA</th>
							<th class="table-head th-name uppercase">UNIDADES</th>
							<th class="table-head th-name uppercase"><center>PRODUCTO</center></th>
							<th class="table-head th-name uppercase">COBRADO</th>
						</tr>
					</thead>
					<tbody>';
		
		while($row = mysqli_fetch_array($data))
	    {
			if ($product > 0)
			{
				$datatmp = mysqli_query($tmp,"SELECT p.nombre, pv.precio, pv.unidades, p.id FROM `product_venta` pv, productos p WHERE pv.product = p.id and pv.folio_venta = '$row[0]' and p.id = $product ");
			}
			else
			{
				$datatmp = mysqli_query($tmp,"SELECT p.nombre, pv.precio, pv.unidades, p.id FROM `product_venta` pv, productos p WHERE pv.product = p.id and pv.folio_venta = '$row[0]'");
			}
			
			while($row0 = mysqli_fetch_array($datatmp))
	    	{
				$t_ud = $t_ud + $row0[2];
				
				if (!$row[10])
				{
					if ($row[8] == "efectivo")
					{
						$efectivo = $efectivo + ($row0[2] * $row0[1]);
					}
					elseif ($row[8] == "transferencia")
					{
						$transferencia = $transferencia + ($row0[2] * $row0[1]);
					}
					elseif ($row[8] == "tarjeta")
					{
						$cheque = $cheque + ($row0[2] * $row0[1]);
					}
					
					if ($row[9] == 1)
					{
						$folio_ = '<td class="item-des"><a href="sale_finaly_report_order.php?folio='.$row[0].'">'.$row[0].'</a></td>';
					}else
					{
						$folio_ = '<td class="item-des"><a href="sale_finaly_report.php?folio_sale='.$row[0].'">'.$row[0].'</a></td>';
					}

					$body = $body.'
					<tr>
					'.$folio_.'
					<td class="item-des"><p>'.$row[1].'</p></td>
					<td class="item-des"><p>'.$row[2].'</p></td>
					<td class="item-des"><p>'.$row[6].'</p></td>
					<td class="item-des"><center>'.$row0[2].'</center></td>
					<td class="item-des"><center><p><a target="_blank" href="/products_detail.php?id='.$row0[3].'">'.$row0[0].'</a></p></center></td>
					<td class="item-des"><center><p>$ '.$row0[2] * $row0[1].' MXN</p></center></td>
					</tr>
					';
					$total = $total + ($row0[2] * $row0[1]);
				}
			}
		}
		$body = $body . '
		</tbody>
			</table>
		</div>
		<br>
		<div align="right">
		';
		
		$body = $body . '
		<h5>Total unidades: '.$t_ud.' UDS</h5>
		';

		if ($efectivo > 0)
		{
			$body = $body . '
			<h5>Efectivo: $ '.number_format($efectivo,2,".",",").' MXN</h5>
			';
		}

		if ($transferencia > 0)
		{
			$body = $body . '
			<h5>Tranferencia: $ '.number_format($transferencia,2,".",",").' MXN</h5>
			';
		}

		if ($cheque > 0)
		{
			$body = $body . '
			<h5>Tarjeta: $ '.number_format($cheque,2,".",",").' MXN</h5>
			';
		}
		
		$body = $body . '
			<h4>TOTAL RECAUDADO: $ '.number_format($total,2,".",",").' MXN</h4>
		</div>
		';

		return $body;
	}

	function table_finance_product_report($inicio, $finaliza, $product)
	{
		//$inicio = '2018-07-18 00:00:00';
		//$finaliza = '2018-07-18 23:59:59';
		$inicio .= ' 00:00:00';
		$finaliza .= ' 23:59:59';
		$total = 0;
		$tmp = db_conectar();
		$t_ud = 0;
		$data = mysqli_query(db_conectar(),"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.t_pago, f.pedido, f.concepto FROM folio_venta f, clients c, users v, sucursales s  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.sucursal = s.id and f.fecha_venta >= '$inicio' and f.fecha_venta <= '$finaliza'");
		
		$body = '<table>
					<tr>
						<td>FOLIO</td>
						<td>VENDEDOR</td>
						<td>CLIENTE</td>
						<td>F.VENTA</td>
						<td>UNIDADES</td>
						<td><center>PRODUCTO</center></td>
						<td>COBRADO</td>
					</tr>
					';
		
		while($row = mysqli_fetch_array($data))
	    {
			if ($product > 0)
			{
				$datatmp = mysqli_query($tmp,"SELECT p.nombre, pv.precio, pv.unidades, p.id FROM `product_venta` pv, productos p WHERE pv.product = p.id and pv.folio_venta = '$row[0]' and p.id = $product ");
			}
			else
			{
				$datatmp = mysqli_query($tmp,"SELECT p.nombre, pv.precio, pv.unidades, p.id FROM `product_venta` pv, productos p WHERE pv.product = p.id and pv.folio_venta = '$row[0]'");
			}
			
			while($row0 = mysqli_fetch_array($datatmp))
	    	{
				$t_ud = $t_ud + $row0[2];
				
				if (!$row[10])
				{
					if ($row[8] == "efectivo")
					{
						$efectivo = $efectivo + ($row0[2] * $row0[1]);
					}
					elseif ($row[8] == "transferencia")
					{
						$transferencia = $transferencia + ($row0[2] * $row0[1]);
					}
					elseif ($row[8] == "tarjeta")
					{
						$cheque = $cheque + ($row0[2] * $row0[1]);
					}
					
					if ($row[9] == 1)
					{
						$folio_ = '<td><a href="sale_finaly_report_order.php?folio='.$row[0].'">'.$row[0].'</a></td>';
					}else
					{
						$folio_ = '<td><a href="sale_finaly_report.php?folio_sale='.$row[0].'">'.$row[0].'</a></td>';
					}

					$body = $body.'
					<tr>
					'.$folio_.'
					<td"><p>'.strtoupper($row[1]).'</p></td>
					<td"><p>'.strtoupper($row[2]).'</p></td>
					<td"><p>'.$row[6].'</p></td>
					<td"><center>'.$row0[2].'</center></td>
					<td"><center><p><a target="_blank" href="/products_detail.php?id='.$row0[3].'">'.$row0[0].'</a></p></center></td>
					<td"><center><p>$ '.$row0[2] * $row0[1].' MXN</p></center></td>
					</tr>
					';
					$total = $total + ($row0[2] * $row0[1]);
				}
			}
		}
		$body = $body . '
		</tbody>
			</table>
		</div>
		<br>
		<div align="right">
		';
		
		$body = $body . '
		<h5>Total unidades: '.$t_ud.' UDS</h5>
		';

		if ($efectivo > 0)
		{
			$body = $body . '
			<h5>Efectivo: $ '.number_format($efectivo,2,".",",").' MXN</h5>
			';
		}

		if ($transferencia > 0)
		{
			$body = $body . '
			<h5>Tranferencia: $ '.number_format($transferencia,2,".",",").' MXN</h5>
			';
		}

		if ($cheque > 0)
		{
			$body = $body . '
			<h5>Tarjeta: $ '.number_format($cheque,2,".",",").' MXN</h5>
			';
		}
		
		$body = $body . '
			<h4>TOTAL RECAUDADO: $ '.number_format($total,2,".",",").' MXN</h4>
		</div>
		';

		return $body;
	}

	function create_sale_SelectClient ($pagina)
	{
		$TAMANO_PAGINA = 5;

		if (!$pagina) {
			$inicio = 0;
			$pagina = 1;
		}
		else {
			$inicio = ($pagina - 1) * $TAMANO_PAGINA;
		}
		
		$data = mysqli_query(db_conectar(),"SELECT id, nombre, razon_social, descuento FROM `clients` ORDER by nombre asc LIMIT $inicio, $TAMANO_PAGINA");
		$datatmp = mysqli_query(db_conectar(),"SELECT id FROM clients");

		$pagination = '<div>
						<div class="col-md-12">
						<div class="shop-pagination p-20 text-center">
							<ul>';

		
		$num_total_registros = mysqli_num_rows($datatmp);
		$total_paginas = ceil($num_total_registros / $TAMANO_PAGINA);

		if ($pagina > 1)
		{
			$pagination = $pagination . '<li><a href="?pagina='.($pagina - 1 ).'" ><i class="zmdi zmdi-chevron-left"></i></a></li>';
		}
	
		if ($total_paginas > 1) {

			for ($i=1;$i<=$total_paginas;$i++) {
				if ($pagina == $i)
					$pagination = $pagination . '<li><a href="#">...</a></li>';
				else
					$pagination = $pagination . '<li><a href="?pagina='.$i.'">'.$i.'</a></li>';
			}
		}
		if ($pagina < $total_paginas)
		{
			$pagination = $pagination . '<li><a href="?pagina='.($pagina + 1 ).'" ><i class="zmdi zmdi-chevron-right"></i></a></li>';
		}
		
		$pagination = $pagination . '</ul>
									</div>
									</div>
									</div><p>';
		$body = '
		<div class="table-responsive compare-wraper mt-30">
				<form class="header-search-box" action="create_sale.php">
					<div>
						<input type="text" placeholder="Buscar" name="search" autocomplete="off">
					</div>
				</form>
				<table class="cart table">
					<thead>
						<tr>
							<th class="table-head th-nam">CLIENTE</th>
							<th class="table-head item-nam">RAZON SOCIAL</th>
							<th class="table-head item-nam">% DESCUENTO</th>
							<th class="table-head item-nam">OPCIONES</th>
						</tr>
					</thead>
					<tbody>';
		$body = $body . $pagination;

		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<tr>
			<td class="item-des"><p>'.$row[1].'</p></td>
			<td class="item-des"><p>'.$row[2].'</p></td>
			<td class="item-des"><p>'.$row[3].' %</p></td>
			<td class="item-des">
			
			<div class="col-md-12">
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#select_client_sale'.$row[0].'" ><span> Seleccionar</span> </a>
			</div>
			
			</td>
			</tr>
			';
		}
		$body = $body . '
		</tbody>
			</table>
		</div>';

		$body = $body . $pagination;
		return $body;
	}

	function create_sale_SelectClientOrder ($pagina)
	{
		$TAMANO_PAGINA = 5;

		if (!$pagina) {
			$inicio = 0;
			$pagina = 1;
		}
		else {
			$inicio = ($pagina - 1) * $TAMANO_PAGINA;
		}
		
		$data = mysqli_query(db_conectar(),"SELECT id, nombre, razon_social, descuento FROM `clients` ORDER by nombre asc LIMIT $inicio, $TAMANO_PAGINA");
		$datatmp = mysqli_query(db_conectar(),"SELECT id FROM clients");

		$pagination = '<div>
						<div class="col-md-12">
						<div class="shop-pagination p-20 text-center">
							<ul>';

		
		$num_total_registros = mysqli_num_rows($datatmp);
		$total_paginas = ceil($num_total_registros / $TAMANO_PAGINA);

		if ($pagina > 1)
		{
			$pagination = $pagination . '<li><a href="?pagina='.($pagina - 1 ).'" ><i class="zmdi zmdi-chevron-left"></i></a></li>';
		}
	
		if ($total_paginas > 1) {

			for ($i=1;$i<=$total_paginas;$i++) {
				if ($pagina == $i)
					$pagination = $pagination . '<li><a href="#">...</a></li>';
				else
					$pagination = $pagination . '<li><a href="?pagina='.$i.'">'.$i.'</a></li>';
			}
		}
		if ($pagina < $total_paginas)
		{
			$pagination = $pagination . '<li><a href="?pagina='.($pagina + 1 ).'" ><i class="zmdi zmdi-chevron-right"></i></a></li>';
		}
		
		$pagination = $pagination . '</ul>
									</div>
									</div>
									</div><p>';
		$body = '
		<div class="table-responsive compare-wraper mt-30">
				<form class="header-search-box" action="create_order.php">
					<div>
						<input type="text" placeholder="Buscar" name="search" autocomplete="off">
					</div>
				</form>
				<table class="cart table">
					<thead>
						<tr>
							<th class="table-head th-nam">CLIENTE</th>
							<th class="table-head item-nam">RAZON SOCIAL</th>
							<th class="table-head item-nam">% DESCUENTO</th>
							<th class="table-head item-nam">OPCIONES</th>
						</tr>
					</thead>
					<tbody>';
		$body = $body . $pagination;

		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<tr>
			<td class="item-des"><p>'.$row[1].'</p></td>
			<td class="item-des"><p>'.$row[2].'</p></td>
			<td class="item-des"><p>'.$row[3].' %</p></td>
			<td class="item-des">
			
			<div class="col-md-12">
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#select_client_sale'.$row[0].'" ><span> Seleccionar</span> </a>
			</div>
			
			</td>
			</tr>
			';
		}
		$body = $body . '
		</tbody>
			</table>
		</div>';

		$body = $body . $pagination;
		return $body;
	}

	function create_sale_SelectClientCot ($pagina)
	{
		$TAMANO_PAGINA = 5;

		if (!$pagina) {
			$inicio = 0;
			$pagina = 1;
		}
		else {
			$inicio = ($pagina - 1) * $TAMANO_PAGINA;
		}
		
		$data = mysqli_query(db_conectar(),"SELECT id, nombre, razon_social, descuento FROM `clients` ORDER by nombre asc LIMIT $inicio, $TAMANO_PAGINA");
		$datatmp = mysqli_query(db_conectar(),"SELECT id FROM clients");

		$pagination = '<div>
						<div class="col-md-12">
						<div class="shop-pagination p-20 text-center">
							<ul>';

		
		$num_total_registros = mysqli_num_rows($datatmp);
		$total_paginas = ceil($num_total_registros / $TAMANO_PAGINA);

		if ($pagina > 1)
		{
			$pagination = $pagination . '<li><a href="?pagina='.($pagina - 1 ).'" ><i class="zmdi zmdi-chevron-left"></i></a></li>';
		}
	
		if ($total_paginas > 1) {

			for ($i=1;$i<=$total_paginas;$i++) {
				if ($pagina == $i)
					$pagination = $pagination . '<li><a href="#">...</a></li>';
				else
					$pagination = $pagination . '<li><a href="?pagina='.$i.'">'.$i.'</a></li>';
			}
		}
		if ($pagina < $total_paginas)
		{
			$pagination = $pagination . '<li><a href="?pagina='.($pagina + 1 ).'" ><i class="zmdi zmdi-chevron-right"></i></a></li>';
		}
		
		$pagination = $pagination . '</ul>
									</div>
									</div>
									</div><p>';
		$body = '
		<div class="table-responsive compare-wraper mt-30">
				<form class="header-search-box" action="create_cotizacion.php">
					<div>
						<input type="text" placeholder="Buscar" name="search" autocomplete="off">
					</div>
				</form>
				<table class="cart table">
					<thead>
						<tr>
							<th class="table-head th-nam">CLIENTE</th>
							<th class="table-head item-nam">RAZON SOCIAL</th>
							<th class="table-head item-nam">% DESCUENTO</th>
							<th class="table-head item-nam">OPCIONES</th>
						</tr>
					</thead>
					<tbody>';
		$body = $body . $pagination;

		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<tr>
			<td class="item-des"><p>'.$row[1].'</p></td>
			<td class="item-des"><p>'.$row[2].'</p></td>
			<td class="item-des"><p>'.$row[3].' %</p></td>
			<td class="item-des">
			
			<div class="col-md-12">
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#select_client_sale'.$row[0].'" ><span> Seleccionar</span> </a>
			</div>
			
			</td>
			</tr>
			';
		}
		$body = $body . '
		</tbody>
			</table>
		</div>';

		$body = $body . $pagination;
		return $body;
	}

	function create_sale_SelectClientSearch ($txt)
	{
		
		$data = mysqli_query(db_conectar(),"SELECT id, nombre, razon_social, descuento FROM `clients` where `nombre` like '%$txt%' or `rfc` like '%$txt%' or `razon_social` like '%$txt%' or `correo` like '%$txt%' ORDER by nombre asc ");

		$body = '
		<div class="table-responsive compare-wraper mt-30">
				<form class="header-search-box" action="create_sale.php">
					<div>
						<input type="text" placeholder="Buscar" name="search" autocomplete="off">
					</div>
				</form>
				<p>
				<table class="cart table">
					<thead>
						<tr>
							<th class="table-head th-nam">CLIENTE</th>
							<th class="table-head item-nam">RAZON SOCIAL</th>
							<th class="table-head item-nam">% DESCUENTO</th>
							<th class="table-head item-nam">OPCIONES</th>
						</tr>
					</thead>
					<tbody>';
		
		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<tr>
			<td class="item-des"><p>'.$row[1].'</p></td>
			<td class="item-des"><p>'.$row[2].'</p></td>
			<td class="item-des"><p>'.$row[3].' %</p></td>
			<td class="item-des">
			
			<div class="col-md-12">
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#select_client_sale'.$row[0].'" ><span> Seleccionar</span> </a>
			</div>
			
			</td>
			</tr>
			';
		}
		$body = $body . '
		</tbody>
			</table>
		</div>';

		$body = $body . $pagination;
		return $body;
	}

	function create_sale_SelectClientSearchOrder ($txt)
	{
		
		$data = mysqli_query(db_conectar(),"SELECT id, nombre, razon_social, descuento FROM `clients` where `nombre` like '%$txt%' or `rfc` like '%$txt%' or `razon_social` like '%$txt%' or `correo` like '%$txt%' ORDER by nombre asc ");

		$body = '
		<div class="table-responsive compare-wraper mt-30">
				<form class="header-search-box" action="create_order.php">
					<div>
						<input type="text" placeholder="Buscar" name="search" autocomplete="off">
					</div>
				</form>
				<p>
				<table class="cart table">
					<thead>
						<tr>
							<th class="table-head th-nam">CLIENTE</th>
							<th class="table-head item-nam">RAZON SOCIAL</th>
							<th class="table-head item-nam">% DESCUENTO</th>
							<th class="table-head item-nam">OPCIONES</th>
						</tr>
					</thead>
					<tbody>';
		
		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<tr>
			<td class="item-des"><p>'.$row[1].'</p></td>
			<td class="item-des"><p>'.$row[2].'</p></td>
			<td class="item-des"><p>'.$row[3].' %</p></td>
			<td class="item-des">
			
			<div class="col-md-12">
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#select_client_sale'.$row[0].'" ><span> Seleccionar</span> </a>
			</div>
			
			</td>
			</tr>
			';
		}
		$body = $body . '
		</tbody>
			</table>
		</div>';

		$body = $body . $pagination;
		return $body;
	}

	function create_sale_SelectClientSearchCot ($txt)
	{
		
		$data = mysqli_query(db_conectar(),"SELECT id, nombre, razon_social, descuento FROM `clients` where `nombre` like '%$txt%' or `rfc` like '%$txt%' or `razon_social` like '%$txt%' or `correo` like '%$txt%' ORDER by nombre asc ");

		$body = '
		<div class="table-responsive compare-wraper mt-30">
				<form class="header-search-box" action="create_cotizacion.php">
					<div>
						<input type="text" placeholder="Buscar" name="search" autocomplete="off">
					</div>
				</form>
				<p>
				<table class="cart table">
					<thead>
						<tr>
							<th class="table-head th-nam">CLIENTE</th>
							<th class="table-head item-nam">RAZON SOCIAL</th>
							<th class="table-head item-nam">% DESCUENTO</th>
							<th class="table-head item-nam">OPCIONES</th>
						</tr>
					</thead>
					<tbody>';
		
		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<tr>
			<td class="item-des"><p>'.$row[1].'</p></td>
			<td class="item-des"><p>'.$row[2].'</p></td>
			<td class="item-des"><p>'.$row[3].' %</p></td>
			<td class="item-des">
			
			<div class="col-md-12">
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#select_client_sale'.$row[0].'" ><span> Seleccionar</span> </a>
			</div>
			
			</td>
			</tr>
			';
		}
		$body = $body . '
		</tbody>
			</table>
		</div>';

		$body = $body . $pagination;
		return $body;
	}

	function g_orden_compra ($almacen, $marca, $proveedor)
	{
		$con = db_conectar();
		
		if ($almacen && $marca && $proveedor)
		{
			$data = mysqli_query($con,"SELECT id, `no. De parte`, descripcion, stock_min, stock_max, stock, proveedor, marca FROM productos where almacen = '$almacen' and marca = '$marca' and proveedor = '$proveedor' ORDER by nombre asc");
		}
		elseif ($almacen && $marca)
		{
			$data = mysqli_query($con,"SELECT id, `no. De parte`, descripcion, stock_min, stock_max, stock, proveedor, marca FROM productos where almacen = '$almacen' and marca = '$marca' ORDER by nombre asc");
		}
		elseif ($almacen && $proveedor)
		{
			$data = mysqli_query($con,"SELECT id, `no. De parte`, descripcion, stock_min, stock_max, stock, proveedor, marca FROM productos where almacen = '$almacen' and proveedor = '$proveedor' ORDER by nombre asc");
		}
		elseif ($marca && $proveedor)
		{
			$data = mysqli_query($con,"SELECT id, `no. De parte`, descripcion, stock_min, stock_max, stock, proveedor, marca FROM productos where marca = '$marca' and proveedor = '$proveedor' ORDER by nombre asc");
		}
		elseif ($almacen)
		{
			$data = mysqli_query($con,"SELECT id, `no. De parte`, descripcion, stock_min, stock_max, stock, proveedor, marca FROM productos where almacen = '$almacen' ORDER by nombre asc");
		}
		elseif ($marca)
		{
			$data = mysqli_query($con,"SELECT id, `no. De parte`, descripcion, stock_min, stock_max, stock, proveedor, marca FROM productos where  marca = '$marca' ORDER by nombre asc");
		}
		elseif ($proveedor)
		{
			$data = mysqli_query($con,"SELECT id, `no. De parte`, descripcion, stock_min, stock_max, stock, proveedor, marca FROM productos where proveedor = '$proveedor' ORDER by nombre asc");
		}

		if (!$almacen && !$marca && !$proveedor)
		{
			$data = mysqli_query($con,"SELECT id, `no. De parte`, descripcion, stock_min, stock_max, stock, proveedor, marca FROM productos ORDER by nombre asc");
		}
		
		if (!$marca)
		{
			$marca = 'Ninguno';
		}

		if (!$proveedor)
		{
			$proveedor = 'Ninguno';
		}

		if ($almacen)
		{
			$almacen = Return_NombreAlmacen($almacen);
		}

		if (!$almacen)
		{
			$almacen = 'Ninguno';
		}

		$_marca = 'MARCA: '. $marca . ' ';
		$_proveedor = '| PROVEEDOR: '. $proveedor . ' ';
		$_almacen = '| ALMACEN: '. $almacen . ' ';

		$val = $_marca . $_proveedor . $_almacen;
	
		$body = '
		<div class="section-title-2 text-uppercase mb-40 text-center">
				<h4>ORDEN DE COMPRA: '. $_SESSION['empresa_nombre'] .' | '. date("d-m-Y") .'</h4>
				'.$val.'
		</div>
		<div class="table-responsive compare-wraper mt-30">
				<table class="cart table">
					<thead>
						<tr>
							<th class="table-head th-name uppercase">no. de parte</th>
							<th class="table-head item-nam">descripcion</th>
							<th class="table-head item-nam">MINIMO</th>
							<th class="table-head item-nam">MAXIMO</th>
							<th class="table-head item-nam">disponible</th>
							<th class="table-head item-nam">PEDIR</th>
							<th class="table-head item-nam">OPCIONES</th>
						</tr>
					</thead>
					<tbody>';
		

		while($row = mysqli_fetch_array($data))
	    {
			$pedir = 0;
			$stock = $row[5];
			$min = $row[3];
			$max = $row[4];

			// Add hijos
			$hijos = mysqli_query($con,"SELECT s.id, s.padre, a.nombre, s.stock FROM productos_sub s, almacen a where s.almacen = a.id and padre = '$row[0]' ");
        
			while($item = mysqli_fetch_array($hijos))
			{
				$stock = $stock + $item[5];
			} //Finaliza hijos

			if ($stock < $min)
			{
				$pedir = $max - $stock;
			}

			if ($pedir > 0)
			{
				$body = $body.'
				<tr>
				<td class="item-quality">'.$row[1].'</td>
				<td class="item-des"><p>'.$row[2].'</p></td>
				<td class="item-des"><p>'.$row[3].'</p></td>
				<td class="item-des"><p>'.$row[4].'</p></td>
				<td class="item-des"><p>'.$row[5].'</p></td>
				<td class="item-des"><p>
				<input type="number" value="'.$pedir.'">
				</p></td>
				<td class="item-des">
				
				<div class="col-md-12">
				<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#g_orden_compra_detalles'.$row[0].'" ><span> Detalles</span> </a>
				</div>
				
				</td>
				</tr>
				';
			}
			
		}
		$body = $body . '
		</tbody>
			</table>
		</div>';

		
		return $body;
	}

	function table_clientes_search ($txt)
	{
		
		$data = mysqli_query(db_conectar(),"SELECT id, nombre, direccion FROM `clients` where `nombre` like '%$txt%' or `rfc` like '%$txt%' or `razon_social` like '%$txt%' or `correo` like '%$txt%' ORDER by nombre asc ");

		$body = '
		<div class="table-responsive compare-wraper mt-30">
				<table class="cart table">
					<thead>
						<tr>
							<th class="table-head th-name uppercase">NOMBRE CLIENTE</th>
							<th class="table-head item-nam">DIRECCION</th>
							<th class="table-head item-nam">OPCIONES</th>
						</tr>
					</thead>
					<tbody>';


		while($row = mysqli_fetch_array($data))
	    {
			if ($_SESSION['client_guest'] == 1)
			{
				$boton = '
				<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#modalclient_edit'.$row[0].'" ><span> Editar</span> </a>
				<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#modalclient_delete'.$row[0].'" ><span> Eliminar</span> </a>
				';
			}else {
				$boton = '
				<p>Sin opciones</p>
				';
			}
			
			$body = $body.'
			<tr>
			<td class="item-quality">'.$row[1].'</td>
			<td class="item-des"><p>'.$row[2].'</p></td>
			<td class="item-des">
			
			<div class="col-md-12">
			'.$boton.'</div>
			
			</td>
			</tr>
			';
		}
		$body = $body . '
		</tbody>
			</table>
		</div>';
	return $body;
	}

	function table_departamentoModal ()
	{
		$data = mysqli_query(db_conectar(),"SELECT * FROM `departamentos` ORDER by nombre asc");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<!-- Modal -->
			<div class="modal fade" id="modaldepartament_edit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">DEPARTAMENTO: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<form action="../func/departamento_edit.php" autocomplete="off" method="post">
					<div class="row">
					<input type="hidden" name="id" id="id" value="'.$row[0].'">
					
					<div class="col-md-12">
					<label>Nombre departamento</label>
					<input type="text" name="departamento_add_nombre" id="departamento_add_nombre" value="'.$row[1].'">
					</div>
					
					<div class="col-md-12">
					<br>
					<label>Descripcion departamento</label>
					<textarea name="departamento_add_descripcion" id="departamento_add_descripcion" cols="30" rows="4">'.$row[2].'</textarea>
					</div>
		
				</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Actualizar</button>
					</form>
				</div>
				</div>
			</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="modaldepartament_delete'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">ELIMINAR DEPARTAMENTO: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="../func/departamento_delete.php" autocomplete="off" method="post">
					<div class="row">
						<input type="hidden" name="id" id="id" value="'.$row[0].'">
						<div class="col-md-12">
						<br>
						<label>Esta seguro Elimnar el departamento ? Se eliminara el departamento y todos los productos asociados a el.</label>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Eliminar</button>
					</form>
				</div>
				</div>
			</div>
			</div>
			';
		}
		
		return $body;
	}

	function g_compra_modal ()
	{
		$data = mysqli_query(db_conectar(),"SELECT p.id, p.`no. de parte`, p.nombre, a.nombre, d.nombre, p.loc_almacen, p.marca, p.proveedor FROM productos p, almacen a, departamentos d WHERE p.almacen = a.id and p.departamento = d.id order by p.nombre asc");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<!-- Modal -->
			<div class="modal fade" id="g_orden_compra_detalles'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<div class="row">
				<div class="col-md-12">
				<h5 class="modal-title" id="exampleModalLongTitle">PRODUCTO: '.$row[2].'</h5>
				<br>
				<div class="row">
					<div class="col-md-6">No. de parte: '.$row[1].'</div>
					<div class="col-md-6">No. de parte: '.$row[1].'</div>
					<div class="col-md-6">Almacen: '.$row[3].'</div>
					<div class="col-md-6">Ubicacion: '.$row[5].'</div>
					<div class="col-md-6">Marca: '.$row[6].'</div>
					<div class="col-md-6">Proveedor: '.$row[7].'</div>
				</div>

				</div>
				</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
				</div>
				</div>
			</div>
			</div>';
		}
		
		return $body;
	}

	function table_orders_modal ()
	{
		$data = mysqli_query(db_conectar(),"SELECT f.folio, u.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.iva, f.t_pago, c.id FROM folio_venta f, users u, clients c, sucursales s WHERE f.open = 1 and f.pedido = 1 and f.vendedor = u.id and f.client = c.id and f.sucursal = s.id");
		
		$select_con = mysqli_query(db_conectar(),"SELECT id, nombre FROM clients ORDER by nombre asc");
		$select = "<option value='0'>CLIENTE</option>";
		while($row = mysqli_fetch_array($select_con))
		{
			$select = $select.'<option value='.$row[0].'>'.$row[1].'</option>';
		}

		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			if ($_SESSION['super_pedidos'] == 1)
			{
				$eliminar = '<button type="sumbit" class="btn btn-danger">Eliminar</button>';
			}else
			{
				$eliminar = '';
			}
			

			$body = $body.'
			<div class="modal fade" id="edit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">PEDIDO ABIERTO</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<form action="func/product_sale_update_descuento.php" method="post">
							<input type="hidden" id="folio" name="folio" value="'.$row[0].'">
							<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
							
							<div class="col-md-12">
							
							<div class="col-md-3">
								<p>DESCUENTO:</p>
							</div>
							
							<div class="col-md-3">
								<input type="number" id="descuento" name="descuento" autocomplete="off" value="'.$row[3].'" min="0" max="100" style="text-align:center;">
							</div>
							
							<div class="col-md-3">
								<p>%</p>
							</div>

							<div class="col-md-3">
								
							</div>
							</div>


							<div class="col-md-12">
							
							<div class="col-md-3">
								<p>IVA:</p>
							</div>
							
							<div class="col-md-3">
								<input type="number" id="iva" name="iva" autocomplete="off" value="'.$row[8].'" min="0" max="100" style="text-align:center;">
							</div>
							
							<div class="col-md-3">
								<p>%</p>
							</div>

							<div class="col-md-3">
								
							</div>
							</div>



							<div class="col-md-12">
							
							<div class="col-md-3">
								<p>CLIENTE:</p>
							</div>
							
							<div class="col-md-9">
								<select id="cliente'.$row[0].'" name="cliente'.$row[0].'">
									'.$select.'
								</select>
							</div>
							</div>
							<script>
								document.getElementById("cliente'.$row[0].'").value = "'.$row[10].'";
							</script>


							
							<div class="col-md-12">
							
							<div class="col-md-3">
								<p></p>
							</div>
							
							<div class="col-md-3">
								<br><button class="submit-btn mt-2" type="submit">Actualizar</button>
							</div>
							
							<div class="col-md-3">
							</div>

							<div class="col-md-3">
								
							</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					
					<form action="func/delete_f_venta.php" autocomplete="off" method="post">
						<input type="hidden" id="folio" name="folio" value="'.$row[0].'">
						<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
						'.$eliminar.'
					</form>
					
				</div>
				</div>
			</div>
			</div>
			';
		}
		
		return $body;
	}

	function UpdateSaleVTD ($folio)
	{
		$data = mysqli_query(db_conectar(),"SELECT folio, descuento, iva, client FROM `folio_venta` WHERE folio = $folio ");
		
		$select_con = mysqli_query(db_conectar(),"SELECT id, nombre FROM clients ORDER by nombre asc");
		$select = "<option value='0'>CLIENTE</option>";
		while($row = mysqli_fetch_array($select_con))
		{
			$select = $select.'<option value='.$row[0].'>'.$row[1].'</option>';
		}

		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<form action="func/product_sale_update_descuento.php" method="post">
            <input type="hidden" id="folio" name="folio" value="'.$row[0].'">
            <input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
            
            <div class="col-md-12">
            
            <div class="col-md-3">
                <p>DESCUENTO:</p>
            </div>
            
            <div class="col-md-3">
                <input type="number" id="descuento" name="descuento" autocomplete="off" value="'.$row[1].'" min="0" max="100" style="text-align:center;">
            </div>
            
            <div class="col-md-3">
                <p>%</p>
            </div>

            <div class="col-md-3">
                
            </div>
            </div>


            <div class="col-md-12">
            
            <div class="col-md-3">
                <p>IVA:</p>
            </div>
            
            <div class="col-md-3">
                <input type="number" id="iva" name="iva" autocomplete="off" value="'.$row[2].'" min="0" max="100" style="text-align:center;">
            </div>
            
            <div class="col-md-3">
                <p>%</p>
            </div>

            <div class="col-md-3">
                
            </div>
            </div>



            <div class="col-md-12">
            
            <div class="col-md-3">
                <p>CLIENTE:</p>
            </div>
            
            <div class="col-md-9">
                <select id="cliente'.$row[0].'" name="cliente'.$row[0].'">
                    '.$select.'
                </select>
            </div>
            </div>
            <script>
                document.getElementById("cliente'.$row[0].'").value = "'.$row[3].'";
            </script>


            
            <div class="col-md-12">
            
            <div class="col-md-3">
                <p></p>
            </div>
            
            <div class="col-md-3">
            </div>
            
            <div class="col-md-3">
            </div>

            <div class="col-md-3">
                
            </div>
            </div>
			';
		}
		
		return $body;
	}

	function table_cotizacion_modal ()
	{
		$data = mysqli_query(db_conectar(),"SELECT f.folio, u.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.iva, f.t_pago, c.id FROM folio_venta f, users u, clients c, sucursales s WHERE f.open = 1 and f.cotizacion = 1 and f.vendedor = u.id and f.client = c.id and f.sucursal = s.id");
		
		$select_con = mysqli_query(db_conectar(),"SELECT id, nombre FROM clients ORDER by nombre asc");
		$select = "<option value='0'>CLIENTE</option>";
		while($row = mysqli_fetch_array($select_con))
		{
			$select = $select.'<option value='.$row[0].'>'.$row[1].'</option>';
		}

		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			
			if ($_SESSION['super_pedidos'] == 1)
			{
				$eliminar = '<button type="sumbit" class="btn btn-danger">Eliminar</button>';
			}else
			{
				$eliminar = '';
			}
			

			$body = $body.'
			<div class="modal fade" id="edit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">COTIZACION ABIERTA</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						
						<form action="func/product_sale_update_descuento.php" method="post">
							<input type="hidden" id="folio" name="folio" value="'.$row[0].'">
							<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
							
							<div class="col-md-12">
							
							<div class="col-md-3">
								<p>DESCUENTO:</p>
							</div>
							
							<div class="col-md-3">
								<input type="number" id="descuento" name="descuento" autocomplete="off" value="'.$row[3].'" min="0" max="100" style="text-align:center;">
							</div>
							
							<div class="col-md-3">
								<p>%</p>
							</div>

							<div class="col-md-3">
								
							</div>
							</div>


							<div class="col-md-12">
							
							<div class="col-md-3">
								<p>IVA:</p>
							</div>
							
							<div class="col-md-3">
								<input type="number" id="iva" name="iva" autocomplete="off" value="'.$row[8].'" min="0" max="100" style="text-align:center;">
							</div>
							
							<div class="col-md-3">
								<p>%</p>
							</div>

							<div class="col-md-3">
								
							</div>
							</div>


							<div class="col-md-12">
							
							<div class="col-md-3">
								<p>CLIENTE:</p>
							</div>
							
							<div class="col-md-9">
								<select id="cliente'.$row[0].'" name="cliente'.$row[0].'">
									'.$select.'
								</select>
							</div>
							</div>
							
							<script>
								document.getElementById("cliente'.$row[0].'").value = "'.$row[10].'";
							</script>

							<div class="col-md-12">
							
							<div class="col-md-3">
								<p></p>
							</div>
							
							<div class="col-md-3">
								<br><button class="submit-btn mt-2" type="submit">Actualizar</button>
							</div>
							
							<div class="col-md-3">
							</div>

							<div class="col-md-3">
								
							</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					
					<form action="func/delete_f_venta.php" autocomplete="off" method="post">
						<input type="hidden" id="folio" name="folio" value="'.$row[0].'">
						<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
						'.$eliminar.'
					</form>
					
				</div>
				</div>
			</div>
			</div>
			';
		}
		
		return $body;
	}

	function sales_delete_finance ()
	{
		$data = mysqli_query(db_conectar(),"SELECT folio FROM folio_venta");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			
			if ($_SESSION['super_pedidos'] == 1)
			{
				$eliminar = '
				<button type="button" class="btn btn-success" data-dismiss="modal">NO</button>
				<button type="sumbit" class="btn btn-danger">Si eliminar</button>';
			}else
			{
				$eliminar = '<button type="button" class="btn btn-success" data-dismiss="modal">NO</button>';
			}
			

			$body = $body.'
			<div class="modal fade" id="delete'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Elimnar registro</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
				
					<div class="col-md-12">
						<p>Tome en cuenta que al eliminar el registro, el folio sera elimnado de la base de datos y no existira mas, al igual que los productos asociados seran afectados.</p>
					</div>
					</div>
				</div>
				<div class="modal-footer">
					
					<form action="func/delete_f_venta.php" autocomplete="off" method="post">
						<input type="hidden" id="folio" name="folio" value="'.$row[0].'">
						<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
						'.$eliminar.'
					</form>
					
				</div>
				</div>
			</div>
			</div>
			';
		}
		
		return $body;
	}

	function table_SalesModal ($folio)
	{
		$data = mysqli_query(db_conectar(),"SELECT v.id, p.nombre FROM product_venta v, productos p WHERE  v.product = p.id and folio_venta = '$folio' ");
		$gen = mysqli_query(db_conectar(),"SELECT v.id, v.p_generico FROM product_venta v WHERE v.p_generico != '' and folio_venta = '$folio' ");

		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<!-- Modal -->
			<div class="modal fade" id="modalsalequit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">QUITAR PRODUCTO: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="../func/product_sale_delete.php" autocomplete="off" method="post">
					<div class="row">
						<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
						<input type="hidden" name="id" id="id" value="'.$row[0].'">
						<div class="col-md-12">
						<br>
						<label>Esta seguro QUITAR el producto ? Se quitara este producto de esta lista de venta.</label>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-danger">Eliminar</button>
					</form>
				</div>
				</div>
			</div>
			</div>
			';
		}

		while($row = mysqli_fetch_array($gen))
	    {
			$body = $body.'
			<!-- Modal -->
			<div class="modal fade" id="modalsalequit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">QUITAR PRODUCTO: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="../func/product_sale_delete.php" autocomplete="off" method="post">
					<div class="row">
						<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
						<input type="hidden" name="id" id="id" value="'.$row[0].'">
						<div class="col-md-12">
						<br>
						<label>Esta seguro QUITAR el producto ? Se quitara este producto de esta lista de venta.</label>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-danger">Eliminar</button>
					</form>
				</div>
				</div>
			</div>
			</div>
			';
		}
		
		return $body;
	}

	function table_SalesModal_order ($folio)
	{
		$data = mysqli_query(db_conectar(),"SELECT v.id, p.nombre FROM product_pedido v, productos p WHERE  v.product = p.id and folio_venta = '$folio' ");
		$gen = mysqli_query(db_conectar(),"SELECT v.id, v.p_generico FROM product_pedido v WHERE v.p_generico != '' and folio_venta = '$folio' ");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<!-- Modal -->
			<div class="modal fade" id="modalsalequit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">QUITAR PRODUCTO: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="../func/product_sale_delete_order.php" autocomplete="off" method="post">
					<div class="row">
						<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
						<input type="hidden" name="id" id="id" value="'.$row[0].'">
						<div class="col-md-12">
						<br>
						<label>Esta seguro QUITAR el producto ? Se quitara este producto de esta lista de venta.</label>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-danger">Eliminar</button>
					</form>
				</div>
				</div>
			</div>
			</div>
			';
		}

		while($row = mysqli_fetch_array($gen))
	    {
			$body = $body.'
			<!-- Modal -->
			<div class="modal fade" id="modalsalequit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">QUITAR PRODUCTO: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="../func/product_sale_delete_order.php" autocomplete="off" method="post">
					<div class="row">
						<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
						<input type="hidden" name="id" id="id" value="'.$row[0].'">
						<div class="col-md-12">
						<br>
						<label>Esta seguro QUITAR el producto ? Se quitara este producto de esta lista de venta.</label>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-danger">Eliminar</button>
					</form>
				</div>
				</div>
			</div>
			</div>
			';
		}
		
		return $body;
	}

	function table_ClientesModal_search ($txt)
	{
		$data = mysqli_query(db_conectar(),"SELECT * FROM `clients` where `nombre` like '%$txt%' or `rfc` like '%$txt%' or `razon_social` like '%$txt%' or `correo` like '%$txt%' ORDER by nombre asc ");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<!-- Modal -->
			<div class="modal fade" id="modalclient_edit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">CLIENTE: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<form id="contact-form" action="func/client_edit.php" method="post" autocomplete="off">
          <div class="row">
		  		<input type="hidden" id="id" name="id" value="'.$row[0].'">
				  
				<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">

				<div class="col-md-12">
					<label>Ingrese nombre de cliente<span class="required">*</span></label>
					<input type="text" name="nombre" id="nombre" placeholder="Nombre o razon social" required value="'.$row[1].'">
				</div>
				<div class="col-md-12">
					<br><label>Ingrese direccion de cliente</label>
					<input type="text" name="direccion" id="direccion" placeholder="Direccion fisica de cliente" value="'.$row[2].'">
				</div>
				
				<div class="col-md-12">
					<label>Ingrese telefono. (Puede ser mas de uno)</label>
					<input type="text" name="telefono" id="telefono" placeholder="Telefono de contacto" value="'.$row[3].'">
				</div>

				<div class="col-md-12">
					<br><label>Ingrese porcentaje de descuento<span class="required">*</span></label>
					<input type="number" name="p_descuento" id="p_descuento" placeholder="Ingrese el porcentaje para descuento en compras" min="0" max="100" required value="'.$row[4].'">
				</div>

				<div class="col-md-12">
					<br><label>Ingrese rfc para emitir factura</label>
					<input type="text" name="rfc" id="rfc" placeholder="Rfc de cliente o empresa" value="'.$row[5].'">
				</div>

				<div class="col-md-12">
					<br><label>Ingrese razon social</label>
					<input type="text" name="r_social" id="r_social" placeholder="Razon social de cliente o empresa" value="'.$row[6].'">
				</div>

				<div class="col-md-12">
					<br><label>Ingrese correo electronico</label>
					<input type="email" name="correo" id="correo" placeholder="Email de cliente o empresa" value="'.$row[7].'">
				</div>
			</div>
      
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Actualizar</button>
					</form>
				</div>
				</div>
			</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="modalclient_delete'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">ELIMINAR CLIENTE: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="../func/client_delete.php" autocomplete="off" method="post">
					<div class="row">
						<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
						<input type="hidden" name="id" id="id" value="'.$row[0].'">
						<div class="col-md-12">
						<br>
						<label>Esta seguro Elimnar el cliente ? Se eliminara el cliente y todos los registros asociados a el. En el futuro no sera posible recuperarlo.</label>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Eliminar</button>
					</form>
				</div>
				</div>
			</div>
			</div>
			';
		}
		
		return $body;
	}

	function table_ClientesModal ($pagina)
	{
		$TAMANO_PAGINA = 5;
		
		if (!$pagina) {
			$inicio = 0;
			$pagina = 1;
		}
		else {
			$inicio = ($pagina - 1) * $TAMANO_PAGINA;
		}
		
		$data = mysqli_query(db_conectar(),"SELECT * FROM `clients` ORDER by nombre asc LIMIT $inicio, $TAMANO_PAGINA");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<!-- Modal -->
			<div class="modal fade" id="modalclient_edit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">CLIENTE: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<form id="contact-form" action="func/client_edit.php" method="post" autocomplete="off">
          <div class="row">
		  		<input type="hidden" id="id" name="id" value="'.$row[0].'">
				  
				<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
				<div class="col-md-12">
					<label>Ingrese nombre de cliente<span class="required">*</span></label>
					<input type="text" name="nombre" id="nombre" placeholder="Nombre o razon social" required value="'.$row[1].'">
				</div>
				<div class="col-md-12">
					<br><label>Ingrese direccion de cliente</label>
					<input type="text" name="direccion" id="direccion" placeholder="Direccion fisica de cliente" value="'.$row[2].'">
				</div>
				
				<div class="col-md-12">
					<label>Ingrese telefono. (Puede ser mas de uno)</label>
					<input type="text" name="telefono" id="telefono" placeholder="Telefono de contacto" value="'.$row[3].'">
				</div>
				<div class="col-md-12">
					<br><label>Ingrese porcentaje de descuento<span class="required">*</span></label>
					<input type="number" name="p_descuento" id="p_descuento" placeholder="Ingrese el porcentaje para descuento en compras" min="0" max="100" required value="'.$row[4].'">
				</div>
				<div class="col-md-12">
					<br><label>Ingrese rfc para emitir factura</label>
					<input type="text" name="rfc" id="rfc" placeholder="Rfc de cliente o empresa" value="'.$row[5].'">
				</div>
				<div class="col-md-12">
					<br><label>Ingrese razon social</label>
					<input type="text" name="r_social" id="r_social" placeholder="Razon social de cliente o empresa" value="'.$row[6].'">
				</div>
				<div class="col-md-12">
					<br><label>Ingrese correo electronico</label>
					<input type="email" name="correo" id="correo" placeholder="Email de cliente o empresa" value="'.$row[7].'">
				</div>
			</div>
      
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Actualizar</button>
					</form>
				</div>
				</div>
			</div>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="modalclient_delete'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">ELIMINAR CLIENTE: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="../func/client_delete.php" autocomplete="off" method="post">
					<div class="row">
						<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">
						<input type="hidden" name="id" id="id" value="'.$row[0].'">
						<div class="col-md-12">
						<br>
						<label>Esta seguro Elimnar el cliente ? Se eliminara el cliente y todos los registros asociados a el. En el futuro no sera posible recuperarlo.</label>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Eliminar</button>
					</form>
				</div>
				</div>
			</div>
			</div>
			';
		}
		
		return $body;
	}


	function select_client_sale_modal ()
	{
		$desc = "";
		$disabled = "";
		
		if ($_SESSION['change_suc'] == 0) { $disabled = "disabled"; }

		for ($i = 0; $i < 101; $i++)
		{
			$desc = $desc.'<option value="'.$i.'">'.$i.' %</option>';
		}

		for ($i = 1; $i < 101; $i++)
		{
			if ($i == $_SESSION['iva'])
			{
				$desc0 = $desc0.'<option value="'.$i.'" selected>'.$i.' %</option>';
			}else
			{
				$desc0 = $desc0.'<option value="'.$i.'">'.$i.' %</option>';
			}
		}
		
		$data = mysqli_query(db_conectar(),"SELECT * FROM clients");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			if ($_SESSION['change_suc'] == 1)
			{
				$select_ = '
				<div class="col-md-12">
					<br>
					<label>Seleccione sucursal en la que se realiza venta<span class="required">*</span></label>
					<select id="suc'.$row[0].'" name="suc'.$row[0].'" '.$disabled.'>
						'. Select_sucursales() .'
					</select>
				</div>
				<script>
					document.getElementById("desc'.$row[0].'").value = "'.$row[4].'";
					document.getElementById("suc'.$row[0].'").value = "'.$_SESSION['sucursal'].'";
				</script>
				';
			}else
			{
				$select_ = '
					<input type="hidden" id="suc'.$row[0].'" name="suc'.$row[0].'" value="'.$_SESSION['sucursal'].'">
				';
			}
		
			$body = $body.'
			<!-- Modal -->
			<div class="modal fade" id="select_client_sale'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">CLIENTE: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<form id="contact-form" action="func/create_sale.php" method="post" autocomplete="off">
          <div class="row">
		  		<input type="hidden" id="id" name="id" value="'.$row[0].'">
				  
				<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">

				<div class="col-md-12">
					<label>Seleccione descuento<span class="required">*</span></label>
					<select id="desc'.$row[0].'" name="desc'.$row[0].'">
                    	'.$desc.'
                	</select>
				</div>
				<div class="col-md-12">
					<br><label>Seleccione % iva<span class="required">*</span></label>
					<select id="iva'.$row[0].'" name="iva'.$row[0].'" required>
                    	'.$desc0.'
                	</select>
				</div>
				<div class="col-md-12">
					<br><label>Seleccione tipo de pago<span class="required">*</span></label>
					<select id="t_pago" name="t_pago" required>
						<option value="efectivo" selected>Efectivo</option>
						<option value="transferencia">Tranferencia</option>
						<option value="tarjeta">Tarjeta</option>
                	</select>
				</div>
				'.$select_.'
			</div>
      
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Crear</button>
					</form>
				</div>
				</div>
			</div>
			</div>';
		}
		
		return $body;
	}

	function select_client_sale_modal_order ()
	{
		$desc = "";
		$disabled = "";
		
		if ($_SESSION['change_suc'] == 0) { $disabled = "disabled"; }

		for ($i = 0; $i < 101; $i++)
		{
			$desc = $desc.'<option value="'.$i.'">'.$i.' %</option>';
		}

		for ($i = 1; $i < 101; $i++)
		{
			if ($i == $_SESSION['iva'])
			{
				$desc0 = $desc0.'<option value="'.$i.'" selected>'.$i.' %</option>';
			}else
			{
				$desc0 = $desc0.'<option value="'.$i.'">'.$i.' %</option>';
			}
		}
		
		$data = mysqli_query(db_conectar(),"SELECT * FROM clients");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			if ($_SESSION['change_suc'] == 1)
			{
				$select_ = '
				<div class="col-md-12">
					<br>
					<label>Seleccione sucursal en la que se realiza venta<span class="required">*</span></label>
					<select id="suc'.$row[0].'" name="suc'.$row[0].'" '.$disabled.'>
						'. Select_sucursales() .'
					</select>
				</div>
				<script>
					document.getElementById("desc'.$row[0].'").value = "'.$row[4].'";
					document.getElementById("suc'.$row[0].'").value = "'.$_SESSION['sucursal'].'";
				</script>
				';
			}else
			{
				$select_ = '
					<input type="hidden" id="suc'.$row[0].'" name="suc'.$row[0].'" value="'.$_SESSION['sucursal'].'">
				';
			}
		
			$body = $body.'
			<!-- Modal -->
			<div class="modal fade" id="select_client_sale'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">CLIENTE: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<form id="contact-form" action="func/create_sale_order.php" method="post" autocomplete="off">
          <div class="row">
		  		<input type="hidden" id="id" name="id" value="'.$row[0].'">
				  
				<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">

				<div class="col-md-12">
					<label>Seleccione descuento<span class="required">*</span></label>
					<select id="desc'.$row[0].'" name="desc'.$row[0].'">
                    	'.$desc.'
                	</select>
				</div>
				<div class="col-md-12">
					<br><label>Seleccione % iva<span class="required">*</span></label>
					<select id="iva'.$row[0].'" name="iva'.$row[0].'" required>
                    	'.$desc0.'
                	</select>
				</div>
				<div class="col-md-12">
					<br><label>Seleccione tipo de pago<span class="required">*</span></label>
					<select id="t_pago" name="t_pago" required>
						<option value="efectivo" selected>Efectivo</option>
						<option value="transferencia">Tranferencia</option>
						<option value="tarjeta">Tarjeta</option>
                	</select>
				</div>
				'.$select_.'
			</div>
      
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Crear</button>
					</form>
				</div>
				</div>
			</div>
			</div>';
		}
		
		return $body;
	}

	function select_client_sale_modal_cot ()
	{
		$desc = "";
		$disabled = "";
		
		if ($_SESSION['change_suc'] == 0) { $disabled = "disabled"; }

		for ($i = 0; $i < 101; $i++)
		{
			$desc = $desc.'<option value="'.$i.'">'.$i.' %</option>';
		}

		for ($i = 1; $i < 101; $i++)
		{
			if ($i == $_SESSION['iva'])
			{
				$desc0 = $desc0.'<option value="'.$i.'" selected>'.$i.' %</option>';
			}else
			{
				$desc0 = $desc0.'<option value="'.$i.'">'.$i.' %</option>';
			}
		}
		
		$data = mysqli_query(db_conectar(),"SELECT * FROM clients");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			if ($_SESSION['change_suc'] == 1)
			{
				$select_ = '
				<div class="col-md-12">
					<br>
					<label>Seleccione sucursal en la que se realiza venta<span class="required">*</span></label>
					<select id="suc'.$row[0].'" name="suc'.$row[0].'" '.$disabled.'>
						'. Select_sucursales() .'
					</select>
				</div>
				<script>
					document.getElementById("desc'.$row[0].'").value = "'.$row[4].'";
					document.getElementById("suc'.$row[0].'").value = "'.$_SESSION['sucursal'].'";
				</script>
				';
			}else
			{
				$select_ = '
					<input type="hidden" id="suc'.$row[0].'" name="suc'.$row[0].'" value="'.$_SESSION['sucursal'].'">
				';
			}
		
			$body = $body.'
			<!-- Modal -->
			<div class="modal fade" id="select_client_sale'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">CLIENTE: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<form id="contact-form" action="func/create_sale_cot.php" method="post" autocomplete="off">
          <div class="row">
		  		<input type="hidden" id="id" name="id" value="'.$row[0].'">
				  
				<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">

				<div class="col-md-12">
					<label>Seleccione descuento<span class="required">*</span></label>
					<select id="desc'.$row[0].'" name="desc'.$row[0].'">
                    	'.$desc.'
                	</select>
				</div>
				<div class="col-md-12">
					<br><label>Seleccione % iva<span class="required">*</span></label>
					<select id="iva'.$row[0].'" name="iva'.$row[0].'" required>
                    	'.$desc0.'
                	</select>
				</div>
				<div class="col-md-12">
					<br><label>Seleccione tipo de pago<span class="required">*</span></label>
					<select id="t_pago" name="t_pago" required>
						<option value="efectivo" selected>Efectivo</option>
						<option value="transferencia">Tranferencia</option>
						<option value="tarjeta">Tarjeta</option>
                	</select>
				</div>
				'.$select_.'
			</div>
      
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Crear</button>
					</form>
				</div>
				</div>
			</div>
			</div>';
		}
		
		return $body;
	}

	function select_client_sale_modal_search ($txt)
	{
		$desc = "";
		$disabled = "";
		
		if ($_SESSION['change_suc'] == 0) { $disabled = "disabled"; }

		for ($i = 0; $i < 101; $i++)
		{
			$desc = $desc.'<option value="'.$i.'">'.$i.' %</option>';
		}
		
		for ($i = 1; $i < 101; $i++)
		{
			if ($i == $_SESSION['iva'])
			{
				$desc0 = $desc0.'<option value="'.$i.'" selected>'.$i.' %</option>';
			}else
			{
				$desc0 = $desc0.'<option value="'.$i.'">'.$i.' %</option>';
			}
		}

		$data = mysqli_query(db_conectar(),"SELECT * FROM `clients` where `nombre` like '%$txt%' or `rfc` like '%$txt%' or `razon_social` like '%$txt%' or `correo` like '%$txt%' ORDER by nombre asc ");
		

		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			if ($_SESSION['change_suc'] == 1)
			{
				$select_ = '
				<div class="col-md-12">
					<br>
					<label>Seleccione sucursal en la que se realiza venta<span class="required">*</span></label>
					<select id="suc'.$row[0].'" name="suc'.$row[0].'" '.$disabled.'>
						'. Select_sucursales() .'
					</select>
				</div>
				<script>
					document.getElementById("desc'.$row[0].'").value = "'.$row[4].'";
					document.getElementById("suc'.$row[0].'").value = "'.$_SESSION['sucursal'].'";
				</script>
				';
			}else
			{
				$select_ = '
					<input type="hidden" id="suc'.$row[0].'" name="suc'.$row[0].'" value="'.$_SESSION['sucursal'].'">
				';
			}
			
			$body = $body.'
			<!-- Modal -->
			<div class="modal fade" id="select_client_sale'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">CLIENTE: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<form id="contact-form" action="func/create_sale.php" method="post" autocomplete="off">
          <div class="row">
		  		<input type="hidden" id="id" name="id" value="'.$row[0].'">
				  
				<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">

				<div class="col-md-12">
					<label>Seleccione descuento<span class="required">*</span></label>
					<select id="desc'.$row[0].'" name="desc'.$row[0].'">
                    	'.$desc.'
                	</select>
				</div>
				<div class="col-md-12">
					<br><label>Seleccione % iva<span class="required">*</span></label>
					<select id="iva'.$row[0].'" name="iva'.$row[0].'" required>
                    	'.$desc0.'
                	</select>
				</div>		

				<div class="col-md-12">
					<br><label>Seleccione tipo de pago<span class="required">*</span></label>
					<select id="t_pago" name="t_pago" required>
						<option value="efectivo" selected>Efectivo</option>
						<option value="transferencia">Tranferencia</option>
						<option value="tarjeta">Tarjeta</option>
                	</select>
				</div>		
				
				'.$select_.'

			  	<script>
				  document.getElementById("desc'.$row[0].'").value = "'.$row[4].'";
				  document.getElementById("suc'.$row[0].'").value = "'.$_SESSION['sucursal'].'";
				</script>
			</div>
      
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Crear</button>
					</form>
				</div>
				</div>
			</div>
			</div>';
		}
		
		return $body;
	}


	function select_client_sale_modal_search_order ($txt)
	{
		$desc = "";
		$disabled = "";
		
		if ($_SESSION['change_suc'] == 0) { $disabled = "disabled"; }

		for ($i = 0; $i < 101; $i++)
		{
			$desc = $desc.'<option value="'.$i.'">'.$i.' %</option>';
		}
		
		for ($i = 1; $i < 101; $i++)
		{
			if ($i == $_SESSION['iva'])
			{
				$desc0 = $desc0.'<option value="'.$i.'" selected>'.$i.' %</option>';
			}else
			{
				$desc0 = $desc0.'<option value="'.$i.'">'.$i.' %</option>';
			}
		}

		$data = mysqli_query(db_conectar(),"SELECT * FROM `clients` where `nombre` like '%$txt%' or `rfc` like '%$txt%' or `razon_social` like '%$txt%' or `correo` like '%$txt%' ORDER by nombre asc ");
		

		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			if ($_SESSION['change_suc'] == 1)
			{
				$select_ = '
				<div class="col-md-12">
					<br>
					<label>Seleccione sucursal en la que se realiza venta<span class="required">*</span></label>
					<select id="suc'.$row[0].'" name="suc'.$row[0].'" '.$disabled.'>
						'. Select_sucursales() .'
					</select>
				</div>
				<script>
					document.getElementById("desc'.$row[0].'").value = "'.$row[4].'";
					document.getElementById("suc'.$row[0].'").value = "'.$_SESSION['sucursal'].'";
				</script>
				';
			}else
			{
				$select_ = '
					<input type="hidden" id="suc'.$row[0].'" name="suc'.$row[0].'" value="'.$_SESSION['sucursal'].'">
				';
			}
			
			$body = $body.'
			<!-- Modal -->
			<div class="modal fade" id="select_client_sale'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">CLIENTE: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<form id="contact-form" action="func/create_sale_order.php" method="post" autocomplete="off">
          <div class="row">
		  		<input type="hidden" id="id" name="id" value="'.$row[0].'">
				  
				<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">

				<div class="col-md-12">
					<label>Seleccione descuento<span class="required">*</span></label>
					<select id="desc'.$row[0].'" name="desc'.$row[0].'">
                    	'.$desc.'
                	</select>
				</div>
				<div class="col-md-12">
					<br><label>Seleccione % iva<span class="required">*</span></label>
					<select id="iva'.$row[0].'" name="iva'.$row[0].'" required>
                    	'.$desc0.'
                	</select>
				</div>		

				<div class="col-md-12">
					<br><label>Seleccione tipo de pago<span class="required">*</span></label>
					<select id="t_pago" name="t_pago" required>
						<option value="efectivo" selected>Efectivo</option>
						<option value="transferencia">Tranferencia</option>
						<option value="tarjeta">Tarjeta</option>
                	</select>
				</div>		
				
				'.$select_.'

			  	<script>
				  document.getElementById("desc'.$row[0].'").value = "'.$row[4].'";
				  document.getElementById("suc'.$row[0].'").value = "'.$_SESSION['sucursal'].'";
				</script>
			</div>
      
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Crear</button>
					</form>
				</div>
				</div>
			</div>
			</div>';
		}
		
		return $body;
	}

	function select_client_sale_modal_search_cot ($txt)
	{
		$desc = "";
		$disabled = "";
		
		if ($_SESSION['change_suc'] == 0) { $disabled = "disabled"; }

		for ($i = 0; $i < 101; $i++)
		{
			$desc = $desc.'<option value="'.$i.'">'.$i.' %</option>';
		}
		
		for ($i = 1; $i < 101; $i++)
		{
			if ($i == $_SESSION['iva'])
			{
				$desc0 = $desc0.'<option value="'.$i.'" selected>'.$i.' %</option>';
			}else
			{
				$desc0 = $desc0.'<option value="'.$i.'">'.$i.' %</option>';
			}
		}

		$data = mysqli_query(db_conectar(),"SELECT * FROM `clients` where `nombre` like '%$txt%' or `rfc` like '%$txt%' or `razon_social` like '%$txt%' or `correo` like '%$txt%' ORDER by nombre asc ");
		

		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			if ($_SESSION['change_suc'] == 1)
			{
				$select_ = '
				<div class="col-md-12">
					<br>
					<label>Seleccione sucursal en la que se realiza venta<span class="required">*</span></label>
					<select id="suc'.$row[0].'" name="suc'.$row[0].'" '.$disabled.'>
						'. Select_sucursales() .'
					</select>
				</div>
				<script>
					document.getElementById("desc'.$row[0].'").value = "'.$row[4].'";
					document.getElementById("suc'.$row[0].'").value = "'.$_SESSION['sucursal'].'";
				</script>
				';
			}else
			{
				$select_ = '
					<input type="hidden" id="suc'.$row[0].'" name="suc'.$row[0].'" value="'.$_SESSION['sucursal'].'">
				';
			}
			
			$body = $body.'
			<!-- Modal -->
			<div class="modal fade" id="select_client_sale'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">CLIENTE: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<form id="contact-form" action="func/create_sale_cot.php" method="post" autocomplete="off">
          <div class="row">
		  		<input type="hidden" id="id" name="id" value="'.$row[0].'">
				  
				<input type="hidden" id="url" name="url" value="'.$_SERVER['REQUEST_URI'].'">

				<div class="col-md-12">
					<label>Seleccione descuento<span class="required">*</span></label>
					<select id="desc'.$row[0].'" name="desc'.$row[0].'">
                    	'.$desc.'
                	</select>
				</div>
				<div class="col-md-12">
					<br><label>Seleccione % iva<span class="required">*</span></label>
					<select id="iva'.$row[0].'" name="iva'.$row[0].'" required>
                    	'.$desc0.'
                	</select>
				</div>		

				<div class="col-md-12">
					<br><label>Seleccione tipo de pago<span class="required">*</span></label>
					<select id="t_pago" name="t_pago" required>
						<option value="efectivo" selected>Efectivo</option>
						<option value="transferencia">Tranferencia</option>
						<option value="tarjeta">Tarjeta</option>
                	</select>
				</div>		
				
				'.$select_.'

			  	<script>
				  document.getElementById("desc'.$row[0].'").value = "'.$row[4].'";
				  document.getElementById("suc'.$row[0].'").value = "'.$_SESSION['sucursal'].'";
				</script>
			</div>
      
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Crear</button>
					</form>
				</div>
				</div>
			</div>
			</div>';
		}
		
		return $body;
	}

	function table_almacen ()
	{
		$data = mysqli_query(db_conectar(),"SELECT * FROM `almacen` ORDER by nombre asc");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<tr>
			<td class="item-quality">'.$row[1].'</td>
			<td class="item-des"><p>'.$row[2].'</p></td>
			<td class="item-des"><p>'.$row[3].'</p></td>
			<td class="item-des">
			
			<div class="col-md-12">
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#modalalmacen_edit'.$row[0].'" ><span> Editar</span> </a>
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#modalalmacen_delete'.$row[0].'" ><span> Eliminar</span> </a>
			</div>
			
			</td>
			</tr>
			';
		}
		
		return $body;
	}

	function table_sucursales ()
	{
		$data = mysqli_query(db_conectar(),"SELECT * FROM `sucursales` ORDER by nombre asc");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<tr>
			<td class="item-quality">'.$row[1].'</td>
			<td class="item-des"><p>'.$row[2].'</p></td>
			<td class="item-des"><p>'.$row[3].'</p></td>
			<td class="item-des">
			
			<div class="col-md-12">
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#modalsucursal_edit'.$row[0].'" ><span> Editar</span> </a>
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#modalalsucursal_delete'.$row[0].'" ><span> Eliminar</span> </a>
			</div>
			
			</td>
			</tr>
			';
		}
		
		return $body;
	}

	function table_almacenModal ()
	{
		$data = mysqli_query(db_conectar(),"SELECT * FROM `almacen` ORDER by nombre asc");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<!-- Modal -->
			<div class="modal fade" id="modalalmacen_edit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">ALMECEN: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<form action="../func/almacen_edit.php" autocomplete="off" method="post">
					<div class="row">

					<input type="hidden" name="id" id="id" value="'.$row[0].'">

					<div class="col-md-12">
					<label>Nombre</label>
					<input type="text" name="almacen_nombre" id="almacen_nombre" placeholder="Ingrese nombre" value="'.$row[1].'">
					</div>
					
					<div class="col-md-12">
					<br><label>Ubicacion</label>
					<input type="text" name="almacen_ubicacion" id="almacen_ubicacion" placeholder="Ingrese ubicacion" value="'.$row[2].'">
					</div>

					<div class="col-md-12">
					<br><label>Telefono</label>
					<input type="text" name="almacen_telefono" id="almacen_telefono" placeholder="Ingrese telefono" value="'.$row[3].'">
					</div>
		
				</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Actualizar</button>
					</form>
				</div>
				</div>
			</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="modalalmacen_delete'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">ELIMINAR ALMACEN: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="../func/almacen_delete.php" autocomplete="off" method="post">
					<div class="row">
						<input type="hidden" name="id" id="id" value="'.$row[0].'">
						<div class="col-md-12">
						<br>
						<label>Esta seguro Elimnar el almacen ? Se eliminara el almacen y todos los productos asociados a el.</label>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Eliminar</button>
					</form>
				</div>
				</div>
			</div>
			</div>
			';
		}
		
		return $body;
	}

	function table_SucursalModal ()
	{
		$data = mysqli_query(db_conectar(),"SELECT * FROM `sucursales` ORDER by nombre asc");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$body = $body.'
			<!-- Modal -->
			<div class="modal fade" id="modalsucursal_edit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">SUCURSAL: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<form action="../func/sucursal_edit.php" autocomplete="off" method="post">
					<div class="row">

					<input type="hidden" name="id" id="id" value="'.$row[0].'">

					<div class="col-md-12">
					<label>Nombre</label>
					<input type="text" name="almacen_nombre" id="almacen_nombre" placeholder="Ingrese nombre" value="'.$row[1].'">
					</div>
					
					<div class="col-md-12">
					<br><label>Direccion</label>
					<input type="text" name="almacen_ubicacion" id="almacen_ubicacion" placeholder="Ingrese ubicacion" value="'.$row[2].'">
					</div>

					<div class="col-md-12">
					<br><label>Telefono</label>
					<input type="text" name="almacen_telefono" id="almacen_telefono" placeholder="Ingrese telefono" value="'.$row[3].'">
					</div>
		
				</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Actualizar</button>
					</form>
				</div>
				</div>
			</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="modalalsucursal_delete'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">ELIMINAR SUCURSAL: '.$row[1].'</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="../func/sucursal_delete.php" autocomplete="off" method="post">
					<div class="row">
						<input type="hidden" name="id" id="id" value="'.$row[0].'">
						<div class="col-md-12">
						<br>
						<label>Esta seguro Elimnar la sucursal ? Se eliminara la sucursal y todos los productos asociados a el.</label>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Eliminar</button>
					</form>
				</div>
				</div>
			</div>
			</div>
			';
		}
		
		return $body;
	}

	function MejoresVendedores()
	{
		$data = mysqli_query(db_conectar(),"SELECT nombre, direccion, telefono FROM `sucursales` ORDER by nombre asc");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$body .= '
			<div class="single-testimonial text-center">
			<img alt="" src="/">
			<div class="testimonial-info white-bg clearfix">
			<div class="testimonial-author text-uppercase">
				<h5>'.$row[0].'</h5>
				<p></p>
			</div>
			<p>DIRECCION: '.$row[1].'
			<br>
			TELEFONO: '.$row[2].'
			</p>
			</div>
			</div>
			';
		}
		return $body;
	}

	function LoadValuesOfflineEmpresa ()
	{
		$tmp = mysqli_query(db_conectar(), "SELECT * FROM empresa");
		while($row = mysqli_fetch_array($tmp))
		{
			$_SESSION['empresa_nombre'] = $row[1];
			$_SESSION['empresa_nombre_corto'] = $row[2];
			$_SESSION['empresa_direccion'] = $row[3];
			$_SESSION['empresa_correo'] = $row[4];
			$_SESSION['empresa_telefono'] = $row[5];
			$_SESSION['empresa_mision'] = $row[6];
			$_SESSION['empresa_vision'] = $row[7];
			$_SESSION['empresa_contacto'] = $row[8];
			$_SESSION['empresa_fb'] = $row[9];
			$_SESSION['empresa_yt'] = $row[10];
			$_SESSION['empresa_tw'] = $row[11];
		}
	}

	function before ($a, $inthat)
    {
        return substr($inthat, 0, strpos($inthat, $a));
	};
	
	function after ($a, $inthat)
    {
        if (!is_bool(strpos($inthat, $a)))
        return substr($inthat, strpos($inthat,$a)+strlen($a));
	};
	
	//------    CONVERTIR NUMEROS A LETRAS         ---------------
	//------    Máxima cifra soportada: 18 dígitos con 2 decimales
	//------    999,999,999,999,999,999.99
	// NOVECIENTOS NOVENTA Y NUEVE MIL NOVECIENTOS NOVENTA Y NUEVE BILLONES
	// NOVECIENTOS NOVENTA Y NUEVE MIL NOVECIENTOS NOVENTA Y NUEVE MILLONES
	// NOVECIENTOS NOVENTA Y NUEVE MIL NOVECIENTOS NOVENTA Y NUEVE PESOS 99/100 M.N.
	//------    Creada por:                        ---------------
	//------             ULTIMINIO RAMOS GALÁN     ---------------
	function numtoletras($xcifra)
	{
		$xarray = array(0 => "Cero",
			1 => "UN", "DOS", "TRES", "CUATRO", "CINCO", "SEIS", "SIETE", "OCHO", "NUEVE",
			"DIEZ", "ONCE", "DOCE", "TRECE", "CATORCE", "QUINCE", "DIECISEIS", "DIECISIETE", "DIECIOCHO", "DIECINUEVE",
			"VEINTI", 30 => "TREINTA", 40 => "CUARENTA", 50 => "CINCUENTA", 60 => "SESENTA", 70 => "SETENTA", 80 => "OCHENTA", 90 => "NOVENTA",
			100 => "CIENTO", 200 => "DOSCIENTOS", 300 => "TRESCIENTOS", 400 => "CUATROCIENTOS", 500 => "QUINIENTOS", 600 => "SEISCIENTOS", 700 => "SETECIENTOS", 800 => "OCHOCIENTOS", 900 => "NOVECIENTOS"
		);
	//
		$xcifra = trim($xcifra);
		$xlength = strlen($xcifra);
		$xpos_punto = strpos($xcifra, ".");
		$xaux_int = $xcifra;
		$xdecimales = "00";
		if (!($xpos_punto === false)) {
			if ($xpos_punto == 0) {
				$xcifra = "0" . $xcifra;
				$xpos_punto = strpos($xcifra, ".");
			}
			$xaux_int = substr($xcifra, 0, $xpos_punto); // obtengo el entero de la cifra a covertir
			$xdecimales = substr($xcifra . "00", $xpos_punto + 1, 2); // obtengo los valores decimales
		}

		$XAUX = str_pad($xaux_int, 18, " ", STR_PAD_LEFT); // ajusto la longitud de la cifra, para que sea divisible por centenas de miles (grupos de 6)
		$xcadena = "";
		for ($xz = 0; $xz < 3; $xz++) {
			$xaux = substr($XAUX, $xz * 6, 6);
			$xi = 0;
			$xlimite = 6; // inicializo el contador de centenas xi y establezco el límite a 6 dígitos en la parte entera
			$xexit = true; // bandera para controlar el ciclo del While
			while ($xexit) {
				if ($xi == $xlimite) { // si ya llegó al límite máximo de enteros
					break; // termina el ciclo
				}

				$x3digitos = ($xlimite - $xi) * -1; // comienzo con los tres primeros digitos de la cifra, comenzando por la izquierda
				$xaux = substr($xaux, $x3digitos, abs($x3digitos)); // obtengo la centena (los tres dígitos)
				for ($xy = 1; $xy < 4; $xy++) { // ciclo para revisar centenas, decenas y unidades, en ese orden
					switch ($xy) {
						case 1: // checa las centenas
							if (substr($xaux, 0, 3) < 100) { // si el grupo de tres dígitos es menor a una centena ( < 99) no hace nada y pasa a revisar las decenas
								
							} else {
								$key = (int) substr($xaux, 0, 3);
								if (TRUE === array_key_exists($key, $xarray)){  // busco si la centena es número redondo (100, 200, 300, 400, etc..)
									$xseek = $xarray[$key];
									$xsub = subfijo($xaux); // devuelve el subfijo correspondiente (Millón, Millones, Mil o nada)
									if (substr($xaux, 0, 3) == 100)
										$xcadena = " " . $xcadena . " CIEN " . $xsub;
									else
										$xcadena = " " . $xcadena . " " . $xseek . " " . $xsub;
									$xy = 3; // la centena fue redonda, entonces termino el ciclo del for y ya no reviso decenas ni unidades
								}
								else { // entra aquí si la centena no fue numero redondo (101, 253, 120, 980, etc.)
									$key = (int) substr($xaux, 0, 1) * 100;
									$xseek = $xarray[$key]; // toma el primer caracter de la centena y lo multiplica por cien y lo busca en el arreglo (para que busque 100,200,300, etc)
									$xcadena = " " . $xcadena . " " . $xseek;
								} // ENDIF ($xseek)
							} // ENDIF (substr($xaux, 0, 3) < 100)
							break;
						case 2: // checa las decenas (con la misma lógica que las centenas)
							if (substr($xaux, 1, 2) < 10) {
								
							} else {
								$key = (int) substr($xaux, 1, 2);
								if (TRUE === array_key_exists($key, $xarray)) {
									$xseek = $xarray[$key];
									$xsub = subfijo($xaux);
									if (substr($xaux, 1, 2) == 20)
										$xcadena = " " . $xcadena . " VEINTE " . $xsub;
									else
										$xcadena = " " . $xcadena . " " . $xseek . " " . $xsub;
									$xy = 3;
								}
								else {
									$key = (int) substr($xaux, 1, 1) * 10;
									$xseek = $xarray[$key];
									if (20 == substr($xaux, 1, 1) * 10)
										$xcadena = " " . $xcadena . " " . $xseek;
									else
										$xcadena = " " . $xcadena . " " . $xseek . " Y ";
								} // ENDIF ($xseek)
							} // ENDIF (substr($xaux, 1, 2) < 10)
							break;
						case 3: // checa las unidades
							if (substr($xaux, 2, 1) < 1) { // si la unidad es cero, ya no hace nada
								
							} else {
								$key = (int) substr($xaux, 2, 1);
								$xseek = $xarray[$key]; // obtengo directamente el valor de la unidad (del uno al nueve)
								$xsub = subfijo($xaux);
								$xcadena = " " . $xcadena . " " . $xseek . " " . $xsub;
							} // ENDIF (substr($xaux, 2, 1) < 1)
							break;
					} // END SWITCH
				} // END FOR
				$xi = $xi + 3;
			} // ENDDO

			if (substr(trim($xcadena), -5, 5) == "ILLON") // si la cadena obtenida termina en MILLON o BILLON, entonces le agrega al final la conjuncion DE
				$xcadena.= " DE";

			if (substr(trim($xcadena), -7, 7) == "ILLONES") // si la cadena obtenida en MILLONES o BILLONES, entoncea le agrega al final la conjuncion DE
				$xcadena.= " DE";

			// ----------- esta línea la puedes cambiar de acuerdo a tus necesidades o a tu país -------
			if (trim($xaux) != "") {
				switch ($xz) {
					case 0:
						if (trim(substr($XAUX, $xz * 6, 6)) == "1")
							$xcadena.= "UN BILLON ";
						else
							$xcadena.= " BILLONES ";
						break;
					case 1:
						if (trim(substr($XAUX, $xz * 6, 6)) == "1")
							$xcadena.= "UN MILLON ";
						else
							$xcadena.= " MILLONES ";
						break;
					case 2:
						if ($xcifra < 1) {
							$xcadena = "CERO PESOS $xdecimales/100 M.N.";
						}
						if ($xcifra >= 1 && $xcifra < 2) {
							$xcadena = "UN PESO $xdecimales/100 M.N. ";
						}
						if ($xcifra >= 2) {
							$xcadena.= " PESOS $xdecimales/100 M.N. "; //
						}
						break;
				} // endswitch ($xz)
			} // ENDIF (trim($xaux) != "")
			// ------------------      en este caso, para México se usa esta leyenda     ----------------
			$xcadena = str_replace("VEINTI ", "VEINTI", $xcadena); // quito el espacio para el VEINTI, para que quede: VEINTICUATRO, VEINTIUN, VEINTIDOS, etc
			$xcadena = str_replace("  ", " ", $xcadena); // quito espacios dobles
			$xcadena = str_replace("UN UN", "UN", $xcadena); // quito la duplicidad
			$xcadena = str_replace("  ", " ", $xcadena); // quito espacios dobles
			$xcadena = str_replace("BILLON DE MILLONES", "BILLON DE", $xcadena); // corrigo la leyenda
			$xcadena = str_replace("BILLONES DE MILLONES", "BILLONES DE", $xcadena); // corrigo la leyenda
			$xcadena = str_replace("DE UN", "UN", $xcadena); // corrigo la leyenda
		} // ENDFOR ($xz)
		return trim($xcadena);
	}

	// END FUNCTION

	function subfijo($xx)
	{ // esta función regresa un subfijo para la cifra
		$xx = trim($xx);
		$xstrlen = strlen($xx);
		if ($xstrlen == 1 || $xstrlen == 2 || $xstrlen == 3)
			$xsub = "";
		//
		if ($xstrlen == 4 || $xstrlen == 5 || $xstrlen == 6)
			$xsub = "MIL";
		//
		return $xsub;
	}

	// END FUNCTION
?>
