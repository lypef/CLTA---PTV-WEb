<?php
    include 'db.php';
    db_sessionValidarNO();
    $con = db_conectar();  
    
    $folio = $_POST['folio'];
    $fecha = date("Y-m-d H:i:s");
    
    mysqli_query($con,"UPDATE `folio_venta` SET `open` = '0', `fecha_venta` = '$fecha' WHERE folio = $folio;");

    if (!mysqli_error($con))
    {
        echo '<script>location.href = "/products.php?pagina=1"</script>';
    }else
    {
        echo '<script>location.href = "/products.php?pagina=1"</script>';
    }
?>