<?php
    include 'db.php';
    db_sessionValidarNO();
    $con = db_conectar();  
    
    $folio = $_POST['folio'];
    $descuento = $_POST['descuento'];
    $iva = $_POST['iva'];
    $url = $_POST['url'];
    
    mysqli_query($con,"UPDATE `folio_venta` SET `descuento` = '$descuento', `iva` = '$iva' WHERE folio = $folio;");

    if (!mysqli_error($con))
    {
        echo '<script>location.href = "'.$url.'"</script>';
    }else
    {
        echo '<script>location.href = "'.$url.'"</script>';
    }
?>