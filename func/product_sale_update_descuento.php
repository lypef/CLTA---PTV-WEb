<?php
    include 'db.php';
    db_sessionValidarNO();
    $con = db_conectar();  
    
    $folio = $_POST['folio'];
    $descuento = $_POST['descuento'];
    $iva = $_POST['iva'];
    $url = $_POST['url'];
    $cliente = $_POST['cliente'. $folio];
    
    mysqli_query($con,"UPDATE `folio_venta` SET `descuento` = '$descuento', `iva` = '$iva', `client` = '$cliente' WHERE folio = $folio;");

    if (!mysqli_error($con))
    {
        echo '<script>location.href = "'.$url.'"</script>';
    }else
    {
        echo '<script>location.href = "'.$url.'"</script>';
    }
?>