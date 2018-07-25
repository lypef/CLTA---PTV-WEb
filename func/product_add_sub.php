<?php
    include 'db.php';
    db_sessionValidarNO();
    
    $url = $_POST['url'];
    $almacen = $_POST['almacen'];
    $padre = $_POST['padre'];
    $stock = $_POST['stock'];

    $con = db_conectar();  
    mysqli_query($con,"INSERT INTO `productos_sub` (`padre`, `almacen`, `stock`) VALUES ('$padre', '$almacen', '$stock');");

    if (!mysqli_error($con))
    {
        echo '<script>location.href = "'.$url.'"</script>';
    }else
    {
        echo '<script>location.href = "'.$url.'"</script>';
    }
    
?>