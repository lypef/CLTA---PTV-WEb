<?php
    require_once 'func/db.php';
    require_once("dompdf/dompdf_config.inc.php");
    $folio = $_GET["folio_sale"];
    session_start();
    $usd = GetUsd();
    $con = db_conectar();  
    $venta = mysqli_query($con,"SELECT u.nombre, c.nombre, v.descuento, v.fecha, v.cobrado, v.fecha_venta, s.nombre, s.direccion, s.telefono, v.iva, c.razon_social, c.direccion FROM folio_venta v, users u, clients c, sucursales s WHERE v.vendedor = u.id and v.client = c.id and v.sucursal = s.id and v.folio = '$folio'");
    
    $genericos = mysqli_query($con,"SELECT unidades, p_generico, precio, id FROM product_venta v WHERE p_generico != '' and folio_venta = '$folio'");

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
        $bodysucursal = $row[7] . '
        <br><span style="font-size: 14px;">RESPONSABLE: ' . $vendedor . '</span>';
        $r_social = $row[10];
        $cliente_direccion = $row[11];
    }
    
    if (!empty($r_social))
    {
        $r_social = ' | ' . $r_social;
    }
    
    $products = mysqli_query($con,"SELECT p.nombre, p.`no. De parte`, v.unidades, v.precio , a.nombre, p.loc_almacen, v.product_sub, p.stock FROM product_venta v, productos p, almacen a WHERE v.product = p.id and p.almacen = a.id and v.folio_venta = '$folio'");

    $body_products = '';
    while($row = mysqli_fetch_array($products))
    {
        if ($row[6])
        {
            if (ReturnStockSubProduct($row[6]) <= 0)
            {
                $asterisk = '***';            
            }else
            {
                $asterisk = '';            
            }

        }else
        {
            if ($row[7] <= 0)
            {
                $asterisk = '***';            
            }else
            {
                $asterisk = '';            
            }
        }

        $total_sin = $total_sin + ($row[2] * $row[3]);

        if (!$row[6])
        {
            $ubicacion = substr($row[4],0,3) . ' ' . $row[5];
        }
        else
        {
            $ubicacion = Almacen_ubicacion_p_sub($row[6]);
        }


        $body_products = $body_products . '
        </tr>
        <tr>
            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none"><center>'.$row[2].'</center></td>
            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none">'.$asterisk.' ('.$row[1].') '.$row[0].'</td>
            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; font-size:10; ">'.$ubicacion.'</td>
            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                <table border="0" width="100%">
                    <tr>
                        <td align="left"> $</td>
                        <td align="right">
                        '.number_format($row[3],2,".",",").'
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                <table border="0" width="100%">
                    <tr>
                        <td align="left"> $</td>
                        <td align="right">
                        '.number_format(($row[2] * $row[3]),2,".",",").'
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        ';
    }
    
    while($row = mysqli_fetch_array($genericos))
    {
        $total_sin = $total_sin + ($row[0] * $row[2]);

        $body_products = $body_products . '
        </tr>
        <tr>
            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none"><center>'.$row[0].'</center></td>
            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none">*** (NA) '.$row[1].'</td>
            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none"><center>NA</center></td>
            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                <table border="0" width="100%">
                    <tr>
                        <td align="left"> $</td>
                        <td align="right">
                        '.number_format($row[2],2,".",",").'
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                <table border="0" width="100%">
                    <tr>
                        <td align="left"> $</td>
                        <td align="right">
                        '.number_format(($row[0] * $row[2]),2,".",",").'
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        ';
    }

    $ivac = '.'.$iva;

    $total_pagar = $total_sin - ($total_sin * ($descuento / 100));
    $total_pagar_ = $total_pagar;
    
    
    $descuento_body = "";
    
    if ($descuento > 0)
    {
        $descuento_body = '
        <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><strong>DESC '.$descuento .' %:</strong> $ '.number_format(($total_sin - $total_pagar_),2,".",",").'</td>
        ';    
    }
    
    
    $subtotal = ($total_pagar / 1.160000);

    $iva_ = $total_pagar - $subtotal;

    $subtotal = number_format($subtotal,2,".",",");
    $total_pagar = number_format($total_pagar,2,".",",");
    $iva_ = number_format($iva_,2,".",",");
    
    $codigoHTML='
    <style>
    @page {
        margin-top: 0.3em;
        margin-left: 0.6em;
        margin-right: 0.6em;
        margin-bottom: 3.0em;
    }
    </style>
    <body>
    <table width="100%" border="0">
        <tr>
            <td width="35%">
                <img src="'.ReturnImgLogo().'" alt="Membrete" height="auto" width="350">
            </td>

            <td>
                <center>
                <h2 style="display:inline;">'.$sucursal.'</h2>
                <br>'.$bodysucursal.'
                </center>
            </td>
        </tr>
    </table>
    
    <table style="height: 5px;" width="100%">
    <tbody>
    <tr>
    <td bgcolor="#5a94dd" align="center"><strong>CLIENTE: </strong>'.strtoupper($cliente . $r_social).'</td>
    </tr>
    <tr>
    <td>
     <table width="100%">
    <tbody>
    <tr>
     
    <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><b>FECHA:</b> '.GetFechaText($fecha_ini).'</td>
    <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><b>FOLIO COTIZACION:</b> '.$folio.'</td>
    </tr>
    </tbody>
    </table>
    
    <br>
    <table border="1" style="width:100%; border-collapse: collapse;">
        <tr>
        <th bgcolor="#5a94dd" style="border-right:1px solid #5a94dd;border-left:1px solid #5a94dd;border-bottom:1px solid black;border-top:1px solid #5a94dd">CANT</th> 
        <th bgcolor="#5a94dd" style="width:50%; border-right:1px solid #5a94dd;border-left:1px solid #5a94dd;border-bottom:1px solid black;border-top:1px solid #5a94dd">DESCRIPCION</th> 
        <th bgcolor="#5a94dd" style="border-right:1px solid #5a94dd;border-left:1px solid #5a94dd;border-bottom:1px solid black;border-top:1px solid #5a94dd">UBIC</th>
        <th bgcolor="#5a94dd" style="border-right:1px solid #5a94dd;border-left:1px solid #5a94dd;border-bottom:1px solid black;border-top:1px solid #5a94dd">P.U MXN</th>
        <th bgcolor="#5a94dd" style="border-right:1px solid #5a94dd;border-left:1px solid #5a94dd;border-bottom:1px solid black;border-top:1px solid #5a94dd">IMP MXN</th>
        </tr>
        '.$body_products.'
    </table>
    <br>
    
    <table style="height: 5px;" width="100%">
    <tbody>
    <tr>
    <td bgcolor="#5a94dd" align="center"><strong>'.numtoletras($total_pagar_).'</strong></td>
    </tr>
    <tr>
    <td>
     <table width="100%">
    <tbody>
    <tr>
     
    <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><strong> TOTAL:</strong> $ '.number_format($total_sin,2,".",",").'</td>
    '.$descuento_body.'
    <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><strong> TOTAL PAGAR:</strong> $ '.$total_pagar.'</td>
    </tr>
    
    <tr>
    
    
    <table width="100%" border="0">
        <tr>
            <td align="right">Total a pagar expresado en dolares americanos:</td>

            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><strong> TOTAL PAGAR:</strong> $ '.number_format($total_pagar_ / $usd,2,".",",").' USD</td>
        </tr>
    </table>
    
    
    </tr>
    
    </tbody>
    </table>
     
     </td>
    </tr>
    </tbody>
    </table>
    <br>';
    
    $codigoHTML .= 
    '
    <table style="width: 100%; border-collapse: collapse;" border="1" cellspacing="0">
    <tbody>
    <tr>
    <th style="border-right: 1px solid #5a94dd; border-left: 1px solid #5a94dd; border-bottom: 0px solid black; border-top: 1px solid #5a94dd;" bgcolor="#5a94dd">
    <p>NUMEROS DE CUENTA</p>
    </th>
    </tr>
    <tr>
    <td>
    <table style="height: 27px;" width="100%" cellspacing="0">
    <tbody>
    <tr>
    <td style="border-right: 1px solid  #000000;" width="50%"><strong>BANCOPPEL (SIN FACTURA)<br /></strong><em><strong>NOMBRE:</strong> ARLENE GARCIA AGUILAR<br /></em><strong>NUMERO DE CUENTA:</strong> 10313587261 <br /><strong>CLABE INT:</strong> 137873103135872618</td>
    <td style="border-left: 0px solid  #000000;"><strong>CITIBANAMEX<br /></strong><em><span style="font-weight: 400;"><strong>NOMBRE:</strong> FRANCISCO EDUARDO ASCENCIO DOMINGUEZ |&nbsp;</span></em><strong>SUC</strong><span style="font-weight: 400;">: 7015<br /></span><strong>N&Uacute;MERO DE CUENTA:</strong> 8107838 <br /><strong>CLABE INT:</strong> 002873701581078386</td>
    </tr>
    <tr>
    <td style="border-right: 1px solid  #000000; border-top: 1px solid  #000000;" width="50%"><strong>BANCOPPEL<br /></strong><em><span style="font-weight: 400;"><strong>NOMBRE:</strong> FRANCISCO EDUARDO ASCENCIO DOMINGUEZ</span></em><span style="font-weight: 400;"><br /></span><strong>NUMERO DE CUENTA:</strong> 10373915195 <strong><br>CLABE INT:</strong> 137873103739151955</td>
    <td style="border-top: 1px solid  #000000;"><strong>SANTANDER SERFIN<br /></strong><em><span style="font-weight: 400;"><strong>NOMBRE:</strong> FRANCISCO EDUARDO ASCENCIO DOMINGUEZ</span></em><span style="font-weight: 400;"><br /></span><strong>NUMERO DE CUENTA:</strong> 20007053263 <strong><br>CLABE INT:</strong> 014873200070532631</td>
    </tr>
    </tbody>
    </table>
    </td>
    </tr>
    <tr>
    <td>
    <table width="100%" cellspacing="0">
    <tbody>
    <tr>
    <td style="border-right: 1px solid #000000; text-align: left;"><strong>PAGO EN OXXO&nbsp;</strong><em><span style="font-weight: 400;"><br /></span></em>4766 8408 6486 7697</td>
    <td style="border-right: 1px solid #000000; text-align: left;" width="35%"><strong>PAGO POR PAYPAL&nbsp;</strong><em>&nbsp;&nbsp;<br /></em>pagos@cyberchoapas.com</td>
    <td style="text-align: left;"><strong>MERCADOPAGO</strong><em>&nbsp;&nbsp;<br /></em>ventas@cyberchoapas.com</td>
    </tr>
    </tbody>
    </table>
    </td>
    </tr>
    </tbody>
    </table>
    <h5 style="background-color: #1a4f7d; text-align: center;"><span style="background-color: #1a4f7d; color: #ffffff;"><em><strong>| www.cyberchoapas.com | ::: GRUPO ASCGAR ::: | www.ascgar.com |</strong></em></span><span style="background-color: #1a4f7d; color: #ffffff;"><em><strong><br /></strong></em></span></h5>
    ';

    $codigoHTML = mb_convert_encoding($codigoHTML, 'HTML-ENTITIES', 'UTF-8');
    $dompdf=new DOMPDF();
    $dompdf->set_paper('letter');
    $dompdf->load_html($codigoHTML);
    ini_set("memory_limit","128M");
    $dompdf->render();
    $dompdf->stream("cotizacion".$_GET["folio_sale"].".pdf");
?>