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

	function _getProducts ()
	{
		$data = mysqli_query(db_conectar(),"SELECT nombre, stock, oferta, precio_normal, precio_oferta, foto0, foto1, foto2, foto3, id FROM productos");
		$body = "";
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
						<a href="product-details.html">
							<img src="../images/'.$row[5].'" alt="">
						</a>
					</div>
					'.$msg_oferta.'
					<div class="product-action text-center">
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
		
		return $body;
	}
	
	function _getProductsModal ()
	{
		$data = mysqli_query(db_conectar(),"SELECT p.nombre, p.stock, p.oferta, p.precio_normal, p.precio_oferta, p.foto0, p.foto1, p.foto2, p.foto3, p.id, p.descripcion, p.`tiempo de entrega`, p.`no. De parte`, a.nombre, d.nombre, p.marca, p.loc_almacen FROM productos p, almacen a, departamentos d where p.almacen = a.id and p.departamento = d.id
		");
		$body = "";
		while($row = mysqli_fetch_array($data))
	    {
			$precio = '<span class="new-price">$ '.$row[3].' MXN</span>';
			
			if ($row[2] == 1)
			{
				$precio = $precio . ' <span class="old-price">$ '.$row[4].' MXN</span>';
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
													<a href="product-details.html" title="'.$row[0].'">Parte NO: '.$row[12].' | '.$row[0].'</a>
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
					<!--End of Quickview Product-->';
		}
		
		return $body;
	}
?>
