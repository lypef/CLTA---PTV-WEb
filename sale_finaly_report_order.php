<?php
    require_once 'func/db.php';
    require_once("dompdf/dompdf_config.inc.php");
    $folio = $_GET["folio"];
    session_start();

    $con = db_conectar();  
    
    $venta = mysqli_query($con,"SELECT u.nombre, c.nombre, v.descuento, v.fecha, v.cobrado, v.fecha_venta, s.nombre, s.direccion, s.telefono, v.iva, v.folio_venta_ini FROM folio_venta v, users u, clients c, sucursales s WHERE v.vendedor = u.id and v.client = c.id and v.sucursal = s.id and v.folio = '$folio'");
    
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
        $folio_uno = $row[10];
    }

    $codigoHTML='
    <h1><center>'.$_SESSION['empresa_nombre'].'</center></h1>
    <h3><center>'.$_SESSION['empresa_direccion'].'</center></h3>
    <h3><center>MAIL: '.$_SESSION['empresa_correo'].' | TEL: '.$_SESSION['empresa_telefono'].'</center></h3>
    <hr>
    <h4><center>REMISION PEDIDO: FOLIO: '.$folio_uno.'</center></h4>
    <table width="100%">
     <tr>
        <td>
        <p>CAJERO: '.$vendedor.'</p>
        <p>FECHA ABONO: '.$fecha_fini.'</p>
        <p>FOLIO ABONO: '.$folio.'</p>
        </td>
    
        <td>
        <div align="center">
        <p>CLIENTE: '.$cliente.'</p>
        <p>ABONO: $ '.number_format($cobrado,2,".",",").' MXN</p>
        </div>
        </td>

        <td>
        <div align="right">
        <p>SUCURSAL: '.$sucursal.'</p>
        <p>DIRECCION: '.$direccion.'</p>
        <p>TELEFONO : '.$tel.'</p>
        </div>
        </td>
     </tr>
    </table>
    <hr>
    <br><br>
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