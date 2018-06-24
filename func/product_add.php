<?php
  include 'db.php';
  db_sessionValidarNO();

  $Parte = $_POST['parte'];
  $Nombre = $_POST['name'];
  $Precio = $_POST['precio'];
  $Precio_oferta = $_POST['p_oferta'];
  $Stock = $_POST['stock'];
  $TiempoEntrega = $_POST['t_entrega'];
  $Descripcion = $_POST['descripcion'];
  $Almacen = $_POST['almacen'];
  $Departamento = $_POST['departamento'];
  $Ubicacion = $_POST['ubicacion'];
  $Marca = $_POST['marca'];
  $Proveedor = $_POST['proveedor'];
  
  $name_img = date("YmdHis").".jpg";

  if ($_FILES["imagen0"]["name"])
  {
    $ruta_img = '/images/product/product_img1'.$name_img;
    $img1_access = '..'.$ruta_img;
    
    if ( copy($_FILES["imagen0"]["tmp_name"], $img1_access ) )
    {
        echo 'Copiado';
    }else { 
        $errors= error_get_last();
        echo $errors['message'];
     }
  }

  
  
 /*   $con = db_conectar();  
    mysqli_query($con,"INSERT INTO `productos` (`no. De parte`, `nombre`, `descripcion`, `almacen`, `departamento`, `loc_almacen`, `marca`, `proveedor`, `foto0`, `foto1`, `foto2`, `foto3`, `oferta`, `precio_normal`, `precio_oferta`, `stock`, `tiempo de entrega`) VALUES ('$Parte', '$Nombre', '$Descripcion', '$Almacen', '$Departamento', '$Ubicacion', '$Marca', '$Proveedor', `foto0`, `foto1`, `foto2`, `foto3`, '0', '$Precio', '$Precio_oferta', '$Stock', '$TiempoEntrega');");

    if (!mysqli_error($con))
    {
        echo 'SI';
    }else
    {
        echo 'No';
    }*/
?>