<?php
    include 'db.php';
    db_sessionValidarNO();
    $con = db_conectar();  
    
    $folio = $_POST['folio'];
    $descuento = $_POST['descuento'];
    $url = $_POST['url'];
    
    mysqli_query($con,"UPDATE `folio_venta` SET `descuento` = '$descuento' WHERE folio = $folio;");

    if (!mysqli_error($con))
    {
        echo '<script>location.href = "'.$url.'"</script>';
    }else
    {
        echo '<script>location.href = "'.$url.'"</script>';
    }
?>