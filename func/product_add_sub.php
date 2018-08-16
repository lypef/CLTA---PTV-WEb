<?php
    include 'db.php';
    db_sessionValidarNO();
    
    $url = $_POST['url'];
    $almacen = $_POST['almacen'];
    $padre = $_POST['padre'];
    $stock = $_POST['stock'];
    $ubicacion = $_POST['ubicacion'];

    $con = db_conectar();  
    mysqli_query($con,"INSERT INTO `productos_sub` (`padre`, `almacen`, `stock`, `ubicacion`) VALUES ('$padre', '$almacen', '$stock', '$ubicacion');");

    if (!mysqli_error($con))
    {
        echo '<script>location.href = "'.$url.'"</script>';
    }else
    {
        echo '<script>location.href = "'.$url.'"</script>';
    }
    
?>