<?php
    include 'db.php';
    db_sessionValidarNO();
    $con = db_conectar();  
    $con0 = db_conectar();  
    
    $folio = $_POST['folio'];
    $fecha = date("Y-m-d H:i:s");
    $descuento = Sale_Descuento($folio);
    $total = 0;

    $Lproducts = mysqli_query($con0,"SELECT product, unidades, precio FROM `product_venta` where folio_venta = '$folio';");
    while($row = mysqli_fetch_array($Lproducts))
    {
        $total = $total + ($row[1] * $row[2]);
        DescontarProductosStock($row[0], $row[1]);
    }
    $total = $total - ($total * ($descuento / 100));
    
    
    mysqli_query($con,"UPDATE `folio_venta` SET `open` = '0', `fecha_venta` = '$fecha', `cobrado` = '$total' WHERE folio = $folio;");

    if (!mysqli_error($con))
    {
        echo '<script>location.href = "/products.php?pagina=1&sale_ok=true&folio_sale='.$folio.'"</script>';
    }else
    {
        echo '<script>location.href = "/products.php?pagina=1&nosale_ok=true"</script>';
    }
?>