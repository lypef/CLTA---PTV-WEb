<?php
    include 'db.php';
    db_sessionValidarNO();

    $unidades = $_POST['unidades'];
    $product = $_POST['product'];
    $folio = $_POST['folio'. $product];
    $url = $_POST['url'];
    $precio = $_POST['costo'];

    $con = db_conectar();  
    mysqli_query($con,"INSERT INTO `product_venta` (`folio_venta`, `product`, `unidades`, `precio`) VALUES ('$folio', '$product', '$unidades', '$precio');");

    $url = str_replace("&add_product_sale=true", "", $url);
    $url = str_replace("?add_product_sale=true", "", $url);
    $url = str_replace("&noadd_product_sale=true", "", $url);
    $url = str_replace("?noadd_product_sale=true", "", $url);
    
    if (!mysqli_error($con))
    {
        $addpregunta = false;

        for($i=0;$i<strlen($url);$i++)
        {
            if ($url[$i] == "?")
            {
                $addpregunta = true;
            }
        }

        if ($addpregunta)
        {
            echo '<script>location.href = "'.$url.'&add_product_sale=true"</script>';
        }else{
            echo '<script>location.href = "'.$url.'?add_product_sale=true"</script>';
        }
    }else
    {
        $addpregunta = false;

        for($i=0;$i<strlen($url);$i++)
        {
            if ($url[$i] == "?")
            {
                $addpregunta = true;
            }
        }

        if ($addpregunta)
        {
            echo '<script>location.href = "'.$url.'&noadd_product_sale=true"</script>';
        }else{
            echo '<script>location.href = "'.$url.'?noadd_product_sale=true"</script>';
        }
    }
?>