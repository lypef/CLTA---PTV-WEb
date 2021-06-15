 <?php
    require_once 'func/db.php';
    // Dompdf php 7
    //require_once 'dompdf_php7.1/autoload.inc.php';
    //use Dompdf\Dompdf;

    // Dompdf php 5
    require_once("dompdf_php5.6/dompdf_config.inc.php");
	
    $ColorBarr = ColorBarrReport();

    $folio = $_GET["folio_sale"];
    session_start();
    $usd = GetUsd();
    $con = db_conectar();  
    $venta = mysqli_query($con,"SELECT u.nombre, c.nombre, v.descuento, v.fecha, v.cobrado, v.fecha_venta, s.nombre, s.direccion, s.telefono, v.iva, c.razon_social, c.direccion, v.t_pago, c.correo FROM folio_venta v, users u, clients c, sucursales s WHERE v.vendedor = u.id and v.client = c.id and v.sucursal = s.id and v.folio = '$folio'");
    
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
        $r_social_contrato = $row[10];
        $cliente_direccion = $row[11];
        $t_pago = $row[12];
        $correo = $row[13];
    }
    
    if (!empty($r_social))
    {
        $r_social = ' | ' . $r_social;
    }
    
    $products = mysqli_query($con,"SELECT p.nombre, p.`no. De parte`, v.unidades, v.precio , a.nombre, p.loc_almacen, v.product_sub, p.stock FROM product_venta v, productos p, almacen a WHERE v.product = p.id and p.almacen = a.id and v.folio_venta = '$folio'");
    
    $body_products = '';
    $cont = 0; $first = true;

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

        if ($cont == 0)
        {
            $body_products .= '
            <table border="1" style="width:100%; border-collapse: collapse;">
            <tr>
                <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">CANT</th> 
                <th bgcolor="'.$ColorBarr .'" style="width:50%; border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">DESCRIPCION</th> 
                <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">UBIC</th>
                <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">P.U MXN</th>
                <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">IMP MXN</th>
            </tr>
            <tr>
            <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none"><center>'.$row[2].'</center></td>
            <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none">'.ucwords(strtolower(substr($asterisk.'('.$row[1].') '.$row[0], 0, 56))).'</td>
            <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; font-size:10; ">'.ucwords(strtolower(substr($ubicacion, 0, 15))).'</td>
            <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                <table border="0" width="100%">
                    <tr>
                        <td align="left"> $</td>
                        <td align="right">
                        '.number_format($row[3],GetNumberDecimales(),".",",").'
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                <table border="0" width="100%">
                    <tr>
                        <td align="left"> $</td>
                        <td align="right">
                        '.number_format(($row[2] * $row[3]),GetNumberDecimales(),".",",").'
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
            </tr>
            ';
        }

        if ($cont > 0)
        {
            $body_products .= '
            <tr>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none"><center>'.$row[2].'</center></td>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none">'.ucwords(strtolower(substr($asterisk.'('.$row[1].') '.$row[0], 0, 56))).'</td>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; font-size:10; ">'.ucwords(strtolower(substr($ubicacion, 0, 15))).'</td>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                    <table border="0" width="100%">
                        <tr>
                            <td align="left"> $</td>
                            <td align="right">
                            '.number_format($row[3],GetNumberDecimales(),".",",").'
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                    <table border="0" width="100%">
                        <tr>
                            <td align="left"> $</td>
                            <td align="right">
                            '.number_format(($row[2] * $row[3]),GetNumberDecimales(),".",",").'
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            ';
        }

        if ($first)
        {
            if ($cont == 27)
            {
                $cont = -1;
                $first = false;
                $body_products .= 
                '
                    </table>
                    <div style="page-break-after:always;"></div>
                ';
            }
        }else
        {
            if ($cont == 38)
            {
                $cont = -1;
                $body_products .= 
                '
                    </table>
                    <div style="page-break-after:always;"></div>
                ';
            }
        }

        $cont ++;
    }
    
    if ($cont >= 26)
    {
        $body_products .= '</table>';
    }

    while($row = mysqli_fetch_array($genericos))
    {
        $total_sin = $total_sin + ($row[0] * $row[2]);
        
        if ($cont == 0)
        {
            $body_products .= '
            <table border="1" style="width:100%; border-collapse: collapse;">
            <tr>
                <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">CANT</th> 
                <th bgcolor="'.$ColorBarr .'" style="width:50%; border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">DESCRIPCION</th> 
                <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">UBIC</th>
                <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">P.U MXN</th>
                <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">IMP MXN</th>
            </tr>
            <tr>
            <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none"><center>'.$row[0].'</center></td>
            <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none">*** (NA) '.$row[1].'</td>
            <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none"><center>NA</center></td>
            <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                <table border="0" width="100%">
                    <tr>
                        <td align="left"> $</td>
                        <td align="right">
                        '.number_format($row[2],GetNumberDecimales(),".",",").'
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                <table border="0" width="100%">
                    <tr>
                        <td align="left"> $</td>
                        <td align="right">
                        '.number_format(($row[0] * $row[2]),GetNumberDecimales(),".",",").'
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
            ';
        }

        if ($cont > 0)
        {
            $body_products .= '
            <tr>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none"><center>'.$row[0].'</center></td>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none">*** (NA) '.$row[1].'</td>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none"><center>NA</center></td>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                    <table border="0" width="100%">
                        <tr>
                            <td align="left"> $</td>
                            <td align="right">
                            '.number_format($row[2],GetNumberDecimales(),".",",").'
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                    <table border="0" width="100%">
                        <tr>
                            <td align="left"> $</td>
                            <td align="right">
                            '.number_format(($row[0] * $row[2]),GetNumberDecimales(),".",",").'
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            ';
        }

        if ($first)
        {
            if ($cont == 27)
            {
                $cont = -1;
                $first = false;
                $body_products .= 
                '
                    </table>
                    <div style="page-break-after:always;"></div>
                ';
            }
        }else
        {
            if ($cont == 38)
            {
                $cont = -1;
                $body_products .= 
                '
                    </table>
                    <div style="page-break-after:always;"></div>
                ';
            }
        }

        $cont ++;
    }
    
    if ($cont <= 38)
    {
        $body_products .= '</table>';
    }
    
    $ivac = '.'.$iva;

    $total_pagar = $total_sin - ($total_sin * ($descuento / 100));
    $total_pagar_ = $total_pagar;
    
    
    $descuento_body = "";
    
    if ($descuento > 0)
    {
        $descuento_body = '
        <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><strong>DESC '.$descuento .' %:</strong> $ '.number_format(($total_sin - $total_pagar_),GetNumberDecimales(),".",",").'</td>
        ';    
    }
    
    
    $subtotal = ($total_pagar / 1.160000);

    $iva_ = $total_pagar - $subtotal;

    $subtotal = number_format($subtotal,GetNumberDecimales(),".",",");
    $total_pagar = number_format($total_pagar,GetNumberDecimales(),".",",");
    $iva_ = number_format($iva_,GetNumberDecimales(),".",",");
    
    $codigoHTML='
    <style>
    @page {
        margin-top: 0.7em;
        margin-left: 0.6em;
        margin-right: 0.6em;
        margin-bottom: 0.1em;
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
    <td bgcolor="'.$ColorBarr .'" align="center"><strong>CLIENTE: </strong>'.strtoupper($cliente . $r_social).'</td>
    </tr>
    <tr>
    <td>
     <table width="100%">
    <tbody>
    <tr>
     
    <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><b>FECHA:</b> '.GetFechaText($fecha_ini).'</td>
    <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><b>NO. DE ORDEN: </b> '.$folio.'</td>
    </tr>
    </tbody>
    </table>
    
    <br>
    <table style="height: 5px;" width="100%">
    <tbody>
    <tr>
    <td bgcolor="'.$ColorBarr .'" align="center"><strong>'.numtoletras($total_pagar_).'</strong></td>
    </tr>
    <tr>
    <td>
     <table width="100%">
    <tbody>
    <tr>
     
    <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><strong> TOTAL:</strong> $ '.number_format($total_sin,GetNumberDecimales(),".",",").'</td>
    '.$descuento_body.'
    <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><strong> TOTAL PAGAR:</strong> $ '.$total_pagar.'</td>
    </tr>
    
    <tr>
    
    
    <table width="100%" border="0">
        <tr>
            <td align="right">Total a pagar expresado en dolares americanos:</td>

            <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><strong> TOTAL PAGAR:</strong> $ '.number_format($total_pagar_ / $usd,GetNumberDecimales(),".",",").' USD</td>
        </tr>
    </table>
    
    
    </tr>
    
    </tbody>
    </table>
     
     </td>
    </tr>
    </tbody>
    </table>
    '.$body_products.'';
    
    
    if (strtolower(str_replace(" ","",$t_pago)) == "transferencia")
    {
        $codigoHTML .= ReportCotTranfers();
    }

    if (strtolower(str_replace(" ","",$t_pago)) == "oxxo")
    {
        $codigoHTML .= '
        <center><strong style="font-size: 14px;"><span style="vertical-align: super;"><img src="images/OXXO-PAY.jpg" width="700"  height="218" /></span></strong></center>
        <p style="text-align: center;"><em>REFERECIA<br /></em><span style="font-size: 60px;"><strong>'.GenRefOxxo($total_pagar_, $folio).'</strong></span></p>
        <h3 style="text-align: center;"><strong>PAGA:&nbsp;</strong><strong>$ '.$total_pagar.' MXN</strong></h3>
        <p style="text-align: center;"><em>OXXO cobrar&aacute; una comisi&oacute;n adicional al momento de realizar el pago.</em></p>
        ';
    }
    
    if (strtolower(str_replace(" ","",$t_pago)) == "banamex")
    {
        $codigoHTML .= '
        <br>
        <table style="width: 100%; border-collapse: collapse;" border="0" cellspacing="0">
        <tbody>
        <tr>
        <td style="background-color: '.colorbarrreport().'; text-align: center; font-family: Arial, serif; font-size: x-small;"><span style="color: #000000;"><strong>BANAMEX</strong></span></td>
        </tr>
        <tr>
        <td>
        <h3 style="text-align: center;"><em>PAGAR: $ '.$total_pagar.' MXN</em>
        <p style="text-align: center;"><strong>CITIBANAMEX:&nbsp;</strong><span style="font-weight: 400;">FRANCISCO EDUARDO ASCENCIO DOMINGUEZ&nbsp;</span><span style="font-weight: 400;"><br /></span><strong>N. CTA:</strong> 8107838 <strong>C.INT</strong><strong>:</strong> 002873701581078386&nbsp;<strong>SUC</strong>: 7015</p>
        </td>
        </tr>
        <tr>
        <td style="background-color: '.colorbarrreport() .'; text-align: center; font-family: Arial, serif; font-size: X-small;"><strong><span style="color: #000000;"><em>| www.cyberchoapas.com | ::: GRUPO ASCGAR ::: | www.ascgar.com |</em></span></strong></td>
        </tr>
        </tbody>
        </table>
        ';
    }
    
    if (strtolower(str_replace(" ","",$t_pago)) == "saldazo")
    {
        $codigoHTML .= '
        <br>
        <table style="width: 100%; border-collapse: collapse;" border="0" cellspacing="0">
        <tbody>
        <tr>
        <td style="background-color: '.colorbarrreport().'; text-align: center; font-family: Arial, serif; font-size: x-small;"><span style="color: #000000;"><strong>BANAMEX OXXO SALDAZO</strong></span></td>
        </tr>
        <tr>
        <td>
        <h3 style="text-align: center;"><em>PAGAR: $ '.$total_pagar.' MXN</em>
        <p style="text-align: center;"><strong>OXXO SALDAZO</strong>: 4766 8408 6486 7697</p>
        </td>
        </tr>
        <tr>
        <td style="background-color: '.colorbarrreport() .'; text-align: center; font-family: Arial, serif; font-size: X-small;"><strong><span style="color: #000000;"><em>| www.cyberchoapas.com | ::: GRUPO ASCGAR ::: | www.ascgar.com |</em></span></strong></td>
        </tr>
        </tbody>
        </table>
        ';
    }
    
    if (strtolower(str_replace(" ","",$t_pago)) == "santander")
    {
        $codigoHTML .= '
        <br>
        <table style="width: 100%; border-collapse: collapse;" border="0" cellspacing="0">
        <tbody>
        <tr>
        <td style="background-color: '.colorbarrreport().'; text-align: center; font-family: Arial, serif; font-size: x-small;"><span style="color: #000000;"><strong>SANTANDER<br /></strong></span></td>
        </tr>
        <tr>
        <td>
        <h3 style="text-align: center;"><em>PAGAR: $ '.$total_pagar.' MXN</em>
        <p style="text-align: center;"><strong>SANTANDER</strong>: FRANCISCO EDUARDO ASCENCIO DOMINGUEZ<br /><strong>N. CTA</strong>: 20007053263 <strong>C.INT</strong>: 014873200070532631</p>
        </td>
        </tr>
        <tr>
        <td style="background-color: '.colorbarrreport() .'; text-align: center; font-family: Arial, serif; font-size: X-small;"><strong><span style="color: #000000;"><em>| www.cyberchoapas.com | ::: GRUPO ASCGAR ::: | www.ascgar.com |</em></span></strong></td>
        </tr>
        </tbody>
        </table>
        ';
    }
    
    if (strtolower(str_replace(" ","",$t_pago)) == "bancopel_arlene")
    {
        $codigoHTML .= '
        <br>
        <table style="width: 100%; border-collapse: collapse;" border="0" cellspacing="0">
        <tbody>
        <tr>
        <td style="background-color: '.colorbarrreport().'; text-align: center; font-family: Arial, serif; font-size: x-small;"><span style="color: #000000;"><strong>BANCOPPEL<br /></strong></span></td>
        </tr>
        <tr>
        <td>
        <h3 style="text-align: center;"><em>PAGAR: $ '.$total_pagar.' MXN</em>
        <p style="text-align: center;"><strong>BANCOPPEL</strong>: ARLENE GARCIA AGUILAR<br /><strong>N. CTA</strong>: 10313587261<strong> C.INT</strong>: 137873103135872618</p>
        </td>
        </tr>
        <tr>
        <td style="background-color: '.colorbarrreport() .'; text-align: center; font-family: Arial, serif; font-size: X-small;"><strong><span style="color: #000000;"><em>| www.cyberchoapas.com | ::: GRUPO ASCGAR ::: | www.ascgar.com |</em></span></strong></td>
        </tr>
        </tbody>
        </table>
        ';
    }
    
    if (strtolower(str_replace(" ","",$t_pago)) == "bancopel_isc")
    {
        $codigoHTML .= '
        <br>
        <table style="width: 100%; border-collapse: collapse;" border="0" cellspacing="0">
        <tbody>
        <tr>
        <td style="background-color: '.colorbarrreport().'; text-align: center; font-family: Arial, serif; font-size: x-small;"><span style="color: #000000;"><strong>BANCOPPEL<br /></strong></span></td>
        </tr>
        <tr>
        <td>
        <h3 style="text-align: center;"><em>PAGAR: $ '.$total_pagar.' MXN</em>
        <p style="text-align: center;"><strong>BANCOPPEL</strong>: FRANCISCO EDUARDO ASCENCIO DOMINGUEZ<br /><strong>N. CTA</strong>: 10373915195 <strong>C.INT</strong>: 137873103739151955</p>
        </td>
        </tr>
        <tr>
        <td style="background-color: '.colorbarrreport() .'; text-align: center; font-family: Arial, serif; font-size: X-small;"><strong><span style="color: #000000;"><em>| www.cyberchoapas.com | ::: GRUPO ASCGAR ::: | www.ascgar.com |</em></span></strong></td>
        </tr>
        </tbody>
        </table>
        ';
    }
    
    if (strtolower(str_replace(" ","",$t_pago)) == "paypal")
    {
        $codigoHTML .= '
        <br>
        <table style="width: 100%; border-collapse: collapse;" border="0" cellspacing="0">
        <tbody>
        <tr>
        <td style="background-color: '.colorbarrreport().'; text-align: center; font-family: Arial, serif; font-size: x-small;"><span style="color: #000000;"><strong>PAYPAL</strong></span></td>
        </tr>
        <tr>
        <td>
        <h3 style="text-align: center;"><em>PAGAR: $ '.number_format($total_pagar_ / $usd,GetNumberDecimales(),".",",").' USD</em>
        <p style="text-align: center;"><strong>PAYPAL</strong>: <br />pagos@cyberchoapas.com</p>
        </td>
        </tr>
        <tr>
        <td style="background-color: '.colorbarrreport() .'; text-align: center; font-family: Arial, serif; font-size: X-small;"><strong><span style="color: #000000;"><em>| www.cyberchoapas.com | ::: GRUPO ASCGAR ::: | www.ascgar.com |</em></span></strong></td>
        </tr>
        </tbody>
        </table>
        ';
    }
    
    $codigoHTML .= '
        </table>
        <div style="page-break-after:always;"></div>
        
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
        <td bgcolor="'.$ColorBarr .'" align="center"><strong>TERMINOS Y CONDICIONES | FOLIO: '.$folio.'</strong></td>
    </tr>
    </tbody>
    </table>
    
    <div width="90">
        <ol>
        
        <p style="text-align: left;"><em><strong>CLTA DD &amp; VS</strong> DENOMINADO EN LO SUCESIVO COMO <strong> LA EMPRESA</strong>.&nbsp;<br /></em><em><strong>'.$cliente.'</strong> DENOMINADO EN LO SUCESIVO COMO <strong> EL CLIENTE</strong>.&nbsp;</em></p>
        <p><em>El cliente acepta todos los t&eacute;rminos y condiciones aqu&iacute; establecidos, de igual manera manifiesta ser representante autorizado de la empresa:<strong> '.$r_social_contrato.',</strong> con correo electronico para notificaciones y avisos: <strong> '.$correo.'</strong><br /></em></p>
        
        <font face="Arial,Verdana" size=12;>
        <li>Errores del sistema es responsabilidad de la empresa solucionarlo lo antes posible</li>
        <li>Toda modificaci&oacute;n o correcciones se debe consultar agenda no son inmediatas ya que tenemos m&aacute;s clientes que atender (Si no tenemos modificaciones pendientes si pueden ser inmediatas)</li>
        <li>La empresa se responsabiliza en totalidad por el software y accesorios vendidos por la misma, NO por terceros o adquiridas por el cliente. No se aceptan cambios ni devoluciones.</li>
        <li>Configuraci&oacute;n de accesorios de terceros genera costo</li>
        <li>En caso de requerir factura CFDI SOLO MEXICO hacer transferencias a las cuentas indicadas (Precios no incluyen IVA)</li>
        <li>Todo sistema, servicio o licencias deber&aacute;n ser pagadas antes de ser entregadas</li>
        <li>Sistemas distribuido por la empresa no incluye ning&uacute;n tipo de soporte t&eacute;cnico gratuito o perpetuo. Por lo que si el cliente necesita asistencia este generara un costo monetario. (Servicios sin pagar generan interes de 10% mensuales)</li>
        <li>La empresa se responsabiliza por los m&oacute;dulos que contienen los sistemas, NO por los que el cliente suponga que debe tener</li>
        <li>Sistemas en renta reportar pago m&aacute;ximo 10 d&iacute;as despu&eacute;s del vencimiento o se suspende el servicio</li>
        <li>Sistemas hechos exclusivos o a pedido se requiere 50 % antes de iniciar proyecto y 50 % cuando est&eacute; finalizado y antes de entregarlo al cliente. El cliente se adapta al sistema no el sistema al cliente. Si requiere que el sistema se adapte al cliente favor de notificarlo para tener conocimiento al momento de realizar la cotizaci&oacute;n pertinente. Favor de enviar documento con requisitos solicitados, ser muy espec&iacute;ficos, No suponer nada, Todo ajuste que no se detalle oportunamente en los requisitos previos ser&aacute;n cobrados como adicionales. La empresa se compromete a solucionar errores o inconvenientes despu&eacute;s de ser entregado el proyecto, siempre y cuando se haya descrito dicha funci&oacute;n en requisitos de software previamente.</li>
        <li>Todo proyecto lleva un tiempo de desarrollo. Si la empresa en algun momento se excede en dichos tiempos acordados, no estara obligada a pagar multas, indemnizaciones o similares.</li>
        <li>Todo proyecto debe llevar la firma de la empresa con direcci&oacute;n a informaci&oacute;n de la misma</li>
        <li>Pagos de tercero o servicios adicionales son cubiertos por cliente</li>
        <li>Todo proyecto solicitado a medida o especifico se entrega para el usuario final&nbsp;la empresa es propietario del c&oacute;digo fuente por lo que si el cliente lo requiere este tendr&aacute; un costo adicional y la empresa debe estar de acuerdo en la venta de este.</li>
        </font>
        </ol>
    </div>
    
    <center>
        <p>______________________________________________</p>
        <p><b><i>'.$cliente.'</i></b></p>
    </center>
    
    <em>El cliente firma con tinta azul y adjunta documento de identificacion oficial. <br>Los terminos y condiciones que aqui se describen es para proteger la integridad de la empresa. Nunca para ofender, denigrar o mal tratar a persona alguna. CLTA siempre trata de apoyar a sus clientes en todo lo que se pueda y a veces un poco mas. La finalidad es crear herramientas digitales para mejorar procesos importantes.</em>
    ';
    
    $codigoHTML = mb_convert_encoding($codigoHTML, 'HTML-ENTITIES', 'UTF-8');
  
    $dompdf=new DOMPDF();
    $dompdf->set_paper('letter');
    $dompdf->load_html($codigoHTML);
    ini_set("memory_limit","128M");
    $dompdf->render();
    $dompdf->stream("orden".$_GET["folio_sale"].".pdf");
    // instantiate and use the dompdf class
?>