<?php
    include 'db.php';
    db_sessionValidarNO();
    $con = db_conectar();  
    
    $id = $_POST['id'];
    $stock = $_POST['stock'];
    $url = $_POST['url'];
    $ubicacion = $_POST['ubicacion'];
    
    mysqli_query($con,"UPDATE `productos_sub` SET `stock` = '$stock', `ubicacion` = '$ubicacion' WHERE `id` = $id;");

    if (!mysqli_error($con))
    {
        echo '<script>location.href = "'.$url.'"</script>';
    }else
    {
        echo '<script>location.href = "'.$url.'"</script>';
    }
?>