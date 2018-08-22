<?php
    require_once 'func/db.php';
    require_once("dompdf/dompdf_config.inc.php");
    $folio = $_GET["folio_sale"];
    session_start();

    $con = db_conectar();  
    $venta = mysqli_query($con,"SELECT u.nombre, c.nombre, v.descuento, v.fecha, v.cobrado, v.fecha_venta, s.nombre, s.direccion, s.telefono, v.iva, c.razon_social, c.direccion FROM folio_venta v, users u, clients c, sucursales s WHERE v.vendedor = u.id and v.client = c.id and v.sucursal = s.id and v.folio = '$folio'");
    $genericos = mysqli_query($con,"SELECT unidades, p_generico, precio, id, product  FROM product_pedido v WHERE p_generico != '' and folio_venta = $folio");

    while($row = mysqli_fetch_array($venta))
    {
        $vendedor = $row[0];
        $cliente = $row[1];
        $descuento = $row[2];
        $fecha_ini = $row[3];
        $cobrado = $row[4];
        $fecha_fini = $row[5];
        $sucursal = $row[6];
        $direccion = $row[7];
        $tel = $row[8];
        $iva = $row[9];
        $bodysucursal = 'DIRECCION: ' . $row[7] . '<br>TELEFONO:' . $row[8];
        $r_social = $row[10];
        $cliente_direccion = $row[11];
    }

    $products = mysqli_query($con,"SELECT p.nombre, p.`no. De parte`, v.unidades, v.precio , a.nombre, p.loc_almacen FROM product_pedido v, productos p, almacen a WHERE v.product = p.id and p.almacen = a.id and v.folio_venta = '$folio'");
    $body_products = '';
    while($row = mysqli_fetch_array($products))
    {
        if (!$row[6])
        {
            $ubicacion = $row[4] . ', ' . $row[5];
        }
        else
        {
            $ubicacion = Almacen_ubicacion_p_sub($row[6]);
        }

        $total_sin = $total_sin + ($row[2] * $row[3]);

        $body_products = $body_products . '
        </tr>
        <tr>
            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom:none;border-top:none"><center>'.$row[2].'</center></td>
            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom:none;border-top:none"><center>'.$row[1].'</center></td>
            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom:none;border-top:none">'.$row[0].'</td>
            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom:none;border-top:none"><center>'.$ubicacion.'</center></td>
            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom:none;border-top:none"><center>$ '.$row[3].' MXN</center></td>
            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom:none;border-top:none"><center>$ '.$row[2] * $row[3].' MXN</center></td>
        </tr>
        ';
    }
    
    while($row = mysqli_fetch_array($genericos))
    {
        $total_sin = $total_sin + ($row[0] * $row[2]);

        $body_products = $body_products . '
        </tr>
        <tr>
        <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom:none;border-top:none"><center>'.$row[0].'</center></td>
        <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom:none;border-top:none"><center>NA</center></td>
        <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom:none;border-top:none">'.$row[1].'</td>
        <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom:none;border-top:none"><center>NA</center></td>
        <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom:none;border-top:none"><center>$ '.$row[2].' MXN</center></td>
        <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom:none;border-top:none"><center>$ '.$row[2] * $row[0].' MXN</center></td>
        </tr>
        ';
    }

    $ivac = '1.'.$iva;

    $total_pagar = $total_sin - ($total_sin * ($descuento / 100));
    $total_pagar_ = $total_pagar;
    
    $subtotal = $total_pagar / $ivac;

    $iva_ = $total_pagar - $subtotal;

    $subtotal = number_format($total_pagar / $ivac,2,".",",");
    $total_pagar = number_format($total_pagar,2,".",",");
    $iva_ = number_format($iva_,2,".",",");
    
    $abonos = mysqli_query($con,"SELECT folio, cobrado, fecha_venta FROM folio_venta WHERE folio_venta_ini = '$folio'");

    while($row = mysqli_fetch_array($abonos))
    {
        if ($row[1] > 0)
        {
            $pagos .= '<p>ABONOS $ '.$row[1].' MXN</p>';
            $total_abono = $total_abono + $row[1];
        }
    }
    $pagos .= '<p><strong>ADEUDO</strong> $ '.number_format(($total_pagar_ - $total_abono),2,".",",").' MXN</p>';

    $codigoHTML='
    <body style="background: url(images/reports/pedido.png) center fixed no-repeat">
    <table width="100%" border="0">
        <tr>
            <td width="35%">
                <img src="images/membrete.png" alt="Membrete" height="auto" width="350">
            </td>

            <td>
                <h3><center>SUC. '.$sucursal.'</center></h3>
                <p><center>'.$bodysucursal.'</p>
            </td>
        </tr>
    </table>
    
    <table width="100%" border="1" style="border-collapse: collapse;">
        <tr>
            <td width="70%">
                <center><strong>RAZON SOCIAL:'.$r_social.'</strong></center>
                <br><strong>NOMBRE: </strong>'.$cliente.'
                <br><strong>DIRECCION: </strong>'.$cliente_direccion.'
            </td>

            <td style="padding-left: 20px; border-right:1px solid white;border-left:1px solid black;border-bottom:1px solid white;border-top:1px solid white">
                FECHA: <br>'.$fecha_ini.'
                <br><br>FOLIO: <br>'.$folio.'
            </td>
        </tr>
    </table>
    <br>
    <table border="1" style="width:100%; border-collapse: collapse;">
        <tr>
        <th bgcolor="#FFBF00" style="border-right:1px solid #FFBF00;border-left:1px solid #FFBF00;border-bottom:1px solid black;border-top:1px solid #FFBF00">CANTIDAD</th> 
        <th bgcolor="#FFBF00" style="border-right:1px solid #FFBF00;border-left:1px solid #FFBF00;border-bottom:1px solid black;border-top:1px solid #FFBF00">N/P</th> 
        <th bgcolor="#FFBF00" style="width:50%; border-right:1px solid #FFBF00;border-left:1px solid #FFBF00;border-bottom:1px solid black;border-top:1px solid #FFBF00">DESCRIPCION</th> 
        <th bgcolor="#FFBF00" style="border-right:1px solid #FFBF00;border-left:1px solid #FFBF00;border-bottom:1px solid black;border-top:1px solid #FFBF00">UBICACION</th>
        <th bgcolor="#FFBF00" style="border-right:1px solid #FFBF00;border-left:1px solid #FFBF00;border-bottom:1px solid black;border-top:1px solid #FFBF00">P. UNITARIO</th>
        <th bgcolor="#FFBF00" style="border-right:1px solid #FFBF00;border-left:1px solid #FFBF00;border-bottom:1px solid black;border-top:1px solid #FFBF00">IMPORTE</th>
        </tr>
        '.$body_products.'
    </table>
    
    <br>
    <table width="100%" border="0" style="border-collapse: collapse;" style="padding: 20px;">
        <tr>
            <td width="45%" style="padding-left: 20px; border-right:1px solid black;border-left:1px solid black;border-bottom:1px solid black;border-top:1px solid black">
                '.numtoletras($total_pagar_ - $total_abono).'
            </td>

            <td style="padding-left: 20px;">
                <strong> SUBTOTAL: </strong> $ '.$subtotal.' MXN
                <br><strong> IVA: </strong>'.$iva.' % = $ '.$iva_.' MXN
                <br><strong> TOTAL: </strong>$ '.$total_pagar.' MXN
                '.$pagos.'
            </td>
        </tr>
    </table>
    <br>
    <footer>
      <p>
      ** NO SE ACEPTAN DEVOLUCIONES<br>
      ** PRECIOS Y EXISTENCIAS SUJETAS A CAMBIO SIN PREVIO AVISO
      <br><br>
      <center>
      CLTA DESARROLLO & DISTRIBUCION DE SOFTWARE<br><a href="http://www.cyberchoapas.com"> www.cyberchoapas.com</a></p></center>
    </footer>';
    
    $codigoHTML=utf8_encode($codigoHTML);
    $dompdf=new DOMPDF();
    $dompdf->set_paper('letter');
    $dompdf->load_html($codigoHTML);
    ini_set("memory_limit","128M");
    $dompdf->render();
    $dompdf->stream("pedido".$_GET["folio_sale"].".pdf");
?>