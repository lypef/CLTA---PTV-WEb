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
		
		
		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id FROM productos order by id asc LIMIT $inicio, $TAMANO_PAGINA");
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
			$icons_edit = 
			'<a href="#" title="Edicion rapida" data-toggle="modal" data-target="#edit_flash'.$row[9].'">
				<i class="zmdi zmdi-flash"></i>
			</a>
			<a href="/products_edit.php?id='.$row[9].'" title="Editar">
				<i class="zmdi zmdi-edit"></i>
			</a>';
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
					<a href="product-details.html" title="'.$row[0].'">'.substr($row[0], 0, 25).'.</a>
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
		
		
		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id FROM productos order by id asc LIMIT $inicio, $TAMANO_PAGINA");
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
							<h4>AGREGUE PRODUCTOS A SU VENTA: '.$folio.'</h4>
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
					<a href="product-details.html" title="'.$row[0].'">'.substr($row[0], 0, 25).'.</a>
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
		
		
		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id FROM productos where departamento = $departamento order by id desc ");
				
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
			$icons_edit = 
			'<a href="#" title="Edicion rapida" data-toggle="modal" data-target="#edit_flash'.$row[9].'">
				<i class="zmdi zmdi-flash"></i>
			</a>
			<a href="/products_edit.php?id='.$row[9].'" title="Editar">
				<i class="zmdi zmdi-edit"></i>
			</a>';
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
					<a href="product-details.html" title="'.$row[0].'">'.substr($row[0], 0, 25).'.</a>
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
		
		
		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id FROM productos where almacen = $almacen order by id desc ");
				
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
			$icons_edit = 
			'<a href="#" title="Edicion rapida" data-toggle="modal" data-target="#edit_flash'.$row[9].'">
				<i class="zmdi zmdi-flash"></i>
			</a>
			<a href="/products_edit.php?id='.$row[9].'" title="Editar">
				<i class="zmdi zmdi-edit"></i>
			</a>';
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
					<a href="product-details.html" title="'.$row[0].'">'.substr($row[0], 0, 25).'.</a>
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
		$login = false;
		$icons_edit = "";

		if (isset($_SESSION['users_id'])){ $login = true;}
		
		
		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id FROM productos where `no. De parte` like '%$txt%' or nombre like '%$txt%' or descripcion like '%$txt%' or marca like '%$txt%'or proveedor like '%$txt%' ORDER by id desc");
				
		$body = '<div class="row">
					<div class="col-md-12">
						<div class="section-title-2 text-uppercase mb-40 text-center">
							<h4>LISTA DE PRODUCTOS : FILTRO '.$txt.' </h4>
						</div>
					</div>
				</div>';
		

		while($row = mysqli_fetch_array($data))
	    {
		  if ($login)
		  {
			$icons_edit = 
			'<a href="#" title="Edicion rapida" data-toggle="modal" data-target="#edit_flash'.$row[9].'">
				<i class="zmdi zmdi-flash"></i>
			</a>
			<a href="/products_edit.php?id='.$row[9].'" title="Editar">
				<i class="zmdi zmdi-edit"></i>
			</a>';
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
					<a href="product-details.html" title="'.$row[0].'">'.substr($row[0], 0, 25).'.</a>
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

	function _getProductsID ($id)
	{
		
    	$data = mysqli_query(db_conectar(),"SELECT `no. De parte`, nombre, precio_normal, precio_oferta, stock, `tiempo de entrega`, descripcion, almacen, departamento, loc_almacen, marca, proveedor, oferta, id, foto0, foto1, foto2, foto3, stock_min, stock_max FROM productos where id = $id ");

		while($row = mysqli_fetch_array($data))
	    {
		  	$body = '
		  	<form id="contact-form" action="func/product_update.php" method="post" enctype="multipart/form-data">
	          <div class="row">
	          	  <input type="hidden" id="id" name="id" value="'.$row[13].'">

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

	            <div class="country-select shop-select col-md-6">
	                <label> Usar precio de oferta ? <span class="required">*</span></label>
	                <select id="use_oferta" name = "use_oferta" id="use_oferta">
	                    <option value="1">Si usar</option>
	                    <option value="0">No usar</option>
	                </select>                                       
	            </div>
	            <script>
	            	document.getElementById("almacen").value = "'.$row[7].'";    
	            	document.getElementById("departamento").value = "'.$row[8].'";    
	            	document.getElementById("use_oferta").value = "'.$row[12].'";    
	            </script>
	            <div class="country-select shop-select col-md-6">
	                <button class="submit-btn mt-20" type="submit">Actualizar</button>
	            </div>


	          </div>
	      </form>';
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
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
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
														<p>Unidades disponibles: '.$row[1].' UD</>
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
												<div class="socialsharing-product">
													<h4 class="product-details-tilte text-uppercase pb-10">Compartir en</h4>
													<button type="button"><i class="zmdi zmdi-facebook"></i></button>
													<button type="button"><i class="zmdi zmdi-twitter"></i></button>
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
		$sales_open = mysqli_query(db_conectar(),"SELECT f.folio, v.nombre, c.nombre, f.fecha, f.descuento FROM folio_venta f, clients c, users v where f.client = c.id and f.vendedor = v.id and f.open = 1 and v.id = '$_SESSION[users_id]' ");

		$select = "";

		while($row = mysqli_fetch_array($sales_open))
		{
			$select = $select . '<option value="'.$row[0].'" selected>'.$row[2].' - FOLIO: '.$row[0].'</option>';
		}

		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$precio = '<span class="new-price">$ '.$row[3].' MXN</span>';
			
			if ($row[2] == 1)
			{
				$precio = '<span class="new-price">$ '.$row[4].' MXN</span>';
				$precio = $precio . ' <span class="old-price">$ '.$row[3].' MXN</span>';
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
														<p>Unidades disponibles: '.$row[1].' UD</>
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
												<div class="socialsharing-product">
													<h4 class="product-details-tilte text-uppercase pb-10">Compartir en</h4>
													<button type="button"><i class="zmdi zmdi-facebook"></i></button>
													<button type="button"><i class="zmdi zmdi-twitter"></i></button>
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
					 <p>Unidades disponibles: '.$row[1].' UD</>
				  	</div>

				 	<div class="country-select shop-select col-md-10">
						<label> Seleccione folio de venta <span class="required">*</span></label>
						<select id="folio'.$row[9].'" name="folio'.$row[9].'">
						'.$select.'
						</select>                                       
					</div>

					<div class="country-select shop-select col-md-2">
						<label>Unidades<span class="required">*</span></label>
						<input type="number" id="eyes" name="eyes" placeholder="0" value ="1"/>
					</div>

				</div>
				<script>
				  document.getElementById("folio'.$row[9].'").value = "'.$folio.'";
				</script>
	          </div>
  		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
		        <button type="submit" class="btn btn-primary">Agregar</button>
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
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
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
														<p>Unidades disponibles: '.$row[1].' UD</>
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
												<div class="socialsharing-product">
													<h4 class="product-details-tilte text-uppercase pb-10">Compartir en</h4>
													<button type="button"><i class="zmdi zmdi-facebook"></i></button>
													<button type="button"><i class="zmdi zmdi-twitter"></i></button>
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

	function _getProductsModalSearch ($departamento)
	{

		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id FROM productos where `no. De parte` like '%$txt%' or nombre like '%$txt%' or descripcion like '%$txt%' or marca like '%$txt%'or proveedor like '%$txt%' ORDER by id desc");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
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
														<p>Unidades disponibles: '.$row[1].' UD</>
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
												<div class="socialsharing-product">
													<h4 class="product-details-tilte text-uppercase pb-10">Compartir en</h4>
													<button type="button"><i class="zmdi zmdi-facebook"></i></button>
													<button type="button"><i class="zmdi zmdi-twitter"></i></button>
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

		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id FROM productos where almacen = '$almacen' ORDER by id desc");
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
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
														<p>Unidades disponibles: '.$row[1].' UD</>
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
												<div class="socialsharing-product">
													<h4 class="product-details-tilte text-uppercase pb-10">Compartir en</h4>
													<button type="button"><i class="zmdi zmdi-facebook"></i></button>
													<button type="button"><i class="zmdi zmdi-twitter"></i></button>
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
		
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
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
									<p>Unidades disponibles: '.$row[1].' UD</p>
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
							<div class="socialsharing-product">
								<h4 class="product-details-tilte text-uppercase pb-10">share this on</h4>
								<button type="button"><i class="zmdi zmdi-facebook"></i></button>
								<button type="button"><i class="zmdi zmdi-instagram"></i></button>
								<button type="button"><i class="zmdi zmdi-rss"></i></button>
								<button type="button"><i class="zmdi zmdi-twitter"></i></button>
								<button type="button"><i class="zmdi zmdi-pinterest"></i></button>
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
			$body = $body.'
			<tr>
			<td class="item-quality">'.$row[1].'</td>
			<td class="item-des"><p>'.$row[2].'</p></td>
			<td class="item-des">
			
			<div class="col-md-12">
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#modalclient_edit'.$row[0].'" ><span> Editar</span> </a>
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#modalclient_delete'.$row[0].'" ><span> Eliminar</span> </a>
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

	function g_orden_compra ()
	{
		$data = mysqli_query(db_conectar(),"SELECT id, nombre, `no. De parte`, stock, stock_min, stock_max FROM productos ORDER by nombre asc");
		
		$body = '
		<div class="table-responsive compare-wraper mt-30">
				<table class="cart table">
					<thead>
						<tr>
							<th class="table-head th-name uppercase">PRODUCTO</th>
							<th class="table-head item-nam">NO. DE PARTE</th>
							<th class="table-head item-nam">DISPONIBLES</th>
							<th class="table-head item-nam">MINIMO</th>
							<th class="table-head item-nam">MAXIMO</th>
							<th class="table-head item-nam">PEDIR</th>
							<th class="table-head item-nam">OPCIONES</th>
						</tr>
					</thead>
					<tbody>';
		

		while($row = mysqli_fetch_array($data))
	    {
			$pedir = 0;
			$stock = $row[3];
			$min = $row[4];
			$max = $row[5];

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
			$body = $body.'
			<tr>
			<td class="item-quality">'.$row[1].'</td>
			<td class="item-des"><p>'.$row[2].'</p></td>
			<td class="item-des">
			
			<div class="col-md-12">
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#modalclient_edit'.$row[0].'" ><span> Editar</span> </a>
			<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#modalclient_delete'.$row[0].'" ><span> Eliminar</span> </a>
			</div>
			
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

	function select_client_sale_modal ()
	{
		$desc = "";
		for ($i = 0; $i < 101; $i++)
		{
			$desc = $desc.'<option value="'.$i.'">'.$i.' %</option>';
		}
		
		$data = mysqli_query(db_conectar(),"SELECT * FROM clients");
		

		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
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
			  	<script>
				  document.getElementById("desc'.$row[0].'").value = "'.$row[4].'";
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

	function select_client_sale_modal_search ($txt)
	{
		$desc = "";
		for ($i = 0; $i < 101; $i++)
		{
			$desc = $desc.'<option value="'.$i.'">'.$i.' %</option>';
		}
		
		$data = mysqli_query(db_conectar(),"SELECT * FROM `clients` where `nombre` like '%$txt%' or `rfc` like '%$txt%' or `razon_social` like '%$txt%' or `correo` like '%$txt%' ORDER by nombre asc ");
		

		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
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
			  	<script>
				  document.getElementById("desc'.$row[0].'").value = "'.$row[4].'";
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
?>
