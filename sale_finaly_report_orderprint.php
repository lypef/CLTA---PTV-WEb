<?php
    require_once 'func/db.php';
    require_once("dompdf/dompdf_config.inc.php");
    $folio = $_GET["folio_sale"];
    session_start();

    $con = db_conectar();  
    $venta = mysqli_query($con,"SELECT u.nombre, c.nombre, v.descuento, v.fecha, v.cobrado, v.fecha_venta, s.nombre, s.direccion, s.telefono, v.iva FROM folio_venta v, users u, clients c, sucursales s WHERE v.vendedor = u.id and v.client = c.id and v.sucursal = s.id and v.folio = '$folio'");
    $genericos = mysqli_query($con,"SELECT unidades, p_generico, precio, id, product  FROM product_pedido v WHERE folio_venta =  $folio ");


    while($row = mysqli_fetch_array($venta))
    {
        $vendedor = $row[0];
        $cliente = $row[1];
        $descuento = $row[2];
        $fecha_ini = $row[3];;
        $cobrado = $row[4];
        $fecha_fini = 'PENDIENTE';
        $sucursal = $row[6];
        $direccion = $row[7];
        $tel = $row[8];
        $iva = $row[9];
    }

    while($row = mysqli_fetch_array($genericos))
    {
        if ($row[1])
        {
           $nombre = $row[1]; 
        }else
        {
            $nombre = Return_NombreProduct($row[4]); 
        }

        $total_sin = $total_sin + ($row[0] * $row[2]);

        $body_products = $body_products . '
        </tr>
        <tr>
        <td><center>'.$nombre.'</center><hr></td>
        <td><center>'.$row[0].'</center><hr></td>
        <td><center>$ '.$row[2].' MXN</center><hr></td>
        <td><center>$ '.$row[2] * $row[0].' MXN</center><hr></td>
        </tr>
        ';
    }
    
    $ivac = '1.'.$iva;

    $total_pagar = $total_sin - ($total_sin * ($descuento / 100));
    
    $subtotal = $total_pagar / $ivac;

    $iva_ = $total_pagar - $subtotal;

    $subtotal = number_format($total_pagar / $ivac,2,".",",");
    $total_pagar = number_format($total_pagar,2,".",",");
    $iva_ = number_format($iva_,2,".",",");

    $codigoHTML='
    <h1><center>'.$_SESSION['empresa_nombre'].'</center></h1>
    <h3><center>'.$_SESSION['empresa_direccion'].'</center></h3>
    <h3><center>MAIL: '.$_SESSION['empresa_correo'].' | TEL: '.$_SESSION['empresa_telefono'].'</center></h3>
    <hr>
    <h4><center>PEDIDO: FOLIO: '.$folio.'</center></h4>
    <table width="100%">
     <tr>
        <td>
        <p>VENDEDOR: '.$vendedor.'</p>
        <p>FECHA CREAR VENTA: '.$fecha_ini.'</p>
        <p>FOLIO PEDIDO: '.$folio.'</p>
        </td>

        <td>
        <div align="center">
        <p>CLIENTE: '.$cliente.'</p>
        <p>TOTAL A PAGAR: $ '.number_format($total_sin - ($total_sin * ($descuento / 100)),2,".",",").' MXN</p>
        <p>DESCUENTO: $ '.$descuento.' % = $ '.number_format($total_sin * ($descuento / 100),2,".",",").' MXN</p>
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
    <table style="width:100%">
        <tr>
        <th>PRODUCTO</th> 
        <th>UNIDADES</th>
        <th>PRECIO</th>
        <th>TOTAL</th>
        </tr>
        '.$body_products.'
    </table>
    
    <br><br>
    <table border="0" width="100%">
        <tr>
            <td>
                <p>TOTAL SIN DESCUENTO: $ '.number_format($total_sin,2,".",",").' MXN</p>
                <p>DESCUENTO: $ '.$descuento.' % = $ '.number_format($total_sin * ($descuento / 100),2,".",",").' MXN</p>
            </td

            <td align="center">
                <p>SUBTOTAL $ '.$subtotal.' MXN</p>
                <p>IVA: '.$iva.' % = $ '.$iva_.' MXN</p>
            </td

            <td align="center">
                <p>TOTAL A PAGAR: $ '.$total_pagar.' MXN</p>
            </td
        </tr>
    </table>
    
    <footer>
      <center><p>CLTA DESARROLLO & DISTRIBUCION DE SOFTWARE<br><a href="http://www.cyberchoapas.com"> www.cyberchoapas.com</a></p></center>
    </footer>
    ';
    
    $codigoHTML=utf8_encode($codigoHTML);
    $dompdf=new DOMPDF();
    $dompdf->set_paper('letter', 'landscape');
    $dompdf->load_html($codigoHTML);
    ini_set("memory_limit","128M");
    $dompdf->render();
    $dompdf->stream("pedido_folio_".$_GET["folio_sale"].".pdf");
?>