<?php
  if ($_POST['precio'] > 0 && $_POST['p_oferta'] > 0)
  {
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
    $user_oferta = 0;

    if ($_POST['use_oferta'] == 'si')
    {
        $user_oferta = 1;
    }
    
    $name_img = date("YmdHis").".jpg";

    $img0 = "";
    $img1 = "";
    $img1 = "";
    $img2 = "";

    if ($_FILES["imagen0"]["name"])
    {
        $ruta_img = 'product/product_img1'.$name_img;
        $img_access = '../images/'.$ruta_img;

        if ( copy($_FILES["imagen0"]["tmp_name"], $img_access ) )
        {
            $img0 = $ruta_img;
        }
    }

    if ($_FILES["imagen1"]["name"])
    {
        $ruta_img = 'product/product_img2'.$name_img;
        $img_access = '../images/'.$ruta_img;

        if ( copy($_FILES["imagen1"]["tmp_name"], $img_access ) )
        {
            $img1 = $ruta_img;
        }
    }

    if ($_FILES["imagen2"]["name"])
    {
        $ruta_img = 'product/product_img3'.$name_img;
        $img_access = '../images/'.$ruta_img;

        if ( copy($_FILES["imagen2"]["tmp_name"], $img_access ) )
        {
            $img2 = $ruta_img;
        }
    }

    if ($_FILES["imagen3"]["name"])
    {
        $ruta_img = 'product/product_img4'.$name_img;
        $img_access = '../images/'.$ruta_img;

        if ( copy($_FILES["imagen3"]["tmp_name"], $img_access ) )
        {
            $img3 = $ruta_img;
        }
    }

    
        $con = db_conectar();  
        mysqli_query($con,"INSERT INTO `productos` (`no. De parte`, `nombre`, `descripcion`, `almacen`, `departamento`, `loc_almacen`, `marca`, `proveedor`, `foto0`, `foto1`, `foto2`, `foto3`, `oferta`, `precio_normal`, `precio_oferta`, `stock`, `tiempo de entrega`) VALUES ('$Parte', '$Nombre', '$Descripcion', '$Almacen', '$Departamento', '$Ubicacion', '$Marca', '$Proveedor', '$img0', '$img1', '$img2', '$img3', '$user_oferta', '$Precio', '$Precio_oferta', '$Stock', '$TiempoEntrega');");

        if (!mysqli_error($con))
        {
            echo '<script>location.href = "../product_add.php?add=true"</script>';
        }else
        {
            echo '<script>location.href = "../product_add.php?noadd=true"</script>';
        }
    }else
    {
        echo '<script>location.href = "../product_add.php?price_error=true"</script>';
    }
?>