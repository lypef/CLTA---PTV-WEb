<?php
    if ($_POST['precio'] > 0 && $_POST['p_oferta'] > 0)
    {
        include 'db.php';
        db_sessionValidarNO();
        $con = db_conectar();  
        
        $id = $_POST['id'];
        $parte = $_POST['parte'];
        $nombre = $_POST['name'];
        $precio = $_POST['precio'];
        $p_oferta = $_POST['p_oferta'];
        $stock = $_POST['stock'];
        $use_oferta = $_POST['use_oferta'];
        
        

        mysqli_query($con,"UPDATE `productos` SET `no. De parte` = '$parte', `nombre` = '$nombre', `oferta` = '$use_oferta', `precio_normal` = '$precio', `precio_oferta` = '$p_oferta', `stock` = '$stock' WHERE id = $id;");

        if (!mysqli_error($con))
        {
            echo '<script>location.href = "../products.php?pagina=1&update_producto=true"</script>';
        }else
        {
            echo '<script>location.href = "../products.php?pagina=1&noupdate_producto=true"</script>';
        }
    }
    else
    {
        echo '<script>location.href = "../products.php?pagina=1&noupdate_producto=true"</script>';
    }
?>