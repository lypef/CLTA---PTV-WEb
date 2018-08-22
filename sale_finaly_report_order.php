<?php
    require_once 'func/db.php';
    require_once("dompdf/dompdf_config.inc.php");
    $folio = $_GET["folio"];
    session_start();

    $con = db_conectar();  
    
    $venta = mysqli_query($con,"SELECT u.nombre, c.nombre, v.descuento, v.fecha, v.cobrado, v.fecha_venta, s.nombre, c.direccion, c.razon_social, v.iva, v.folio_venta_ini, s.nombre, s.direccion, s.telefono FROM folio_venta v, users u, clients c, sucursales s WHERE v.vendedor = u.id and v.client = c.id and v.sucursal = s.id and v.folio = '$folio'");
    
    while($row = mysqli_fetch_array($venta))
    {
        $vendedor = $row[0];
        $cliente = $row[1];
        $descuento = $row[2];
        $fecha_ini = $row[3];
        $cobrado = $row[4];
        $fecha_fini = $row[5];
        $sucursal = $row[6];
        $cliente_direccion = $row[7];
        $r_social = $row[8];
        $tel = $row[8];
        $iva = $row[9];
        $folio_uno = $row[10];
        $bodysucursal = 'DIRECCION: ' . $row[12] . '<br>TELEFONO:' . $row[13];
    }

    $codigoHTML='
    <body style="background: url(images/reports/abono.png) center fixed no-repeat">
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
    <br>
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
    <br><hr>
    <p>ABONO: $ '.number_format($cobrado,2,".",",").' MXN | '.numtoletras(number_format($cobrado,2,".",",")).'</p>
    <br>
    <p>RECIBIMOS LA CANTIDAD DE : $ '.number_format($cobrado,2,".",",").' MXN ('.numtoletras(number_format($cobrado,2,".",",")).') EN CALIDAD DE ABONO POR CONCEPTO DE EL PEDIDO CON FOLIO: '.$folio.'</p>
    <footer>
      <center><p>CLTA DESARROLLO & DISTRIBUCION DE SOFTWARE<br><a href="http://www.cyberchoapas.com"> www.cyberchoapas.com</a></p></center>
    </footer>';
    
    $codigoHTML=utf8_encode($codigoHTML);
    $dompdf=new DOMPDF();
    $dompdf->set_paper('letter', '');
    $dompdf->load_html($codigoHTML);
    ini_set("memory_limit","128M");
    $dompdf->render();
    $dompdf->stream("Abono_pedido".$folio_uno.".pdf");
?>