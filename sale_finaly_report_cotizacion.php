<?php
    require_once 'func/db.php';
    require_once("dompdf/dompdf_config.inc.php");
    $folio = $_GET["folio_sale"];
    session_start();

    $con = db_conectar();  
    $venta = mysqli_query($con,"SELECT u.nombre, c.nombre, v.descuento, v.fecha, v.cobrado, v.fecha_venta FROM folio_venta v, users u, clients c WHERE v.vendedor = u.id and v.client = c.id and v.folio = '$folio'");


    while($row = mysqli_fetch_array($venta))
    {
        $vendedor = $row[0];
        $cliente = $row[1];
        $descuento = $row[2];
        $fecha_ini = $row[3];;
        $cobrado = $row[4];
        $fecha_fini = 'PENDIENTE';
    }

    $products = mysqli_query($con,"SELECT p.nombre, p.`no. De parte`, v.unidades, v.precio FROM product_venta v, productos p WHERE v.product = p.id and v.folio_venta = '$folio'");
    $body_products = '';
    while($row = mysqli_fetch_array($products))
    {
        $total_sin = $total_sin + ($row[2] * $row[3]);

        $body_products = $body_products . '
        </tr>
        <tr>
        <td>'.$row[0].'<hr></td>
        <td><center>'.$row[1].'</center><hr></td>
        <td><center>'.$row[2].'</center><hr></td>
        <td><center>$ '.$row[3].' MXN</center><hr></td>
        <td><center>$ '.$row[2] * $row[3].' MXN</center><hr></td>
        </tr>
        ';
    }
    
    $codigoHTML='
    <h1><center>'.$_SESSION['empresa_nombre'].'</center></h1>
    <h4><center>COTIZACION DE VENTA: FOLIO: '.$folio.'</center></h4>
    <table width="100%">
     <tr>
        <td>
        <p>VENDEDOR: '.$vendedor.'</p>
        <p>FECHA CREAR VENTA: '.$fecha_ini.'</p>
        <p>FOLIO COTIZACION: '.$folio.'</p>
        </td>

        <td>
        <div align="right">
        <p>CLIENTE: '.$cliente.'</p>
        <p>TOTAL $: '.$cobrado.' MXN</p>
        <p>DESCUENTO : '.$descuento.' %</p>
        </div>
        </td>
     </tr>
    </table>
    <hr>
    <br><br>
    <table style="width:100%">
        <tr>
        <th>PRODUCTO</th> 
        <th>NO. PARTE</th> 
        <th>UNIDADES</th>
        <th>PRECIO</th>
        <th>TOTAL</th>
        </tr>
        '.$body_products.'
    </table>
    
    <br><br>
    <p>TOTAL SIN DESCUENTO: $ '.number_format($total_sin,2,".",",").' MXN</p>
    <p>DESCUENTO: $ '.$descuento.' % = $ '.number_format($total_sin * ($descuento / 100),2,".",",").' MXN</p>
    <p>TOTAL A PAGAR: $ '.number_format($total_sin - ($total_sin * ($descuento / 100)),2,".",",").' MXN</p>
    ';
    
    $codigoHTML=utf8_encode($codigoHTML);
    $dompdf=new DOMPDF();
    $dompdf->set_paper('letter', 'landscape');
    $dompdf->load_html($codigoHTML);
    ini_set("memory_limit","128M");
    $dompdf->render();
    $dompdf->stream("venta".$_GET["folio_sale"].".pdf");
?>