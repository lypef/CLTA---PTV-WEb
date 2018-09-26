<?php
    require_once 'func/db.php';
    require_once("dompdf/dompdf_config.inc.php");
    session_start();
    
    $inicio = $_GET["inicio"] . ' 00:00:00';
    $finaliza = $_GET["finaliza"] . ' 23:59:59';
    $total = 0;

    $con = db_conectar();  
    if ($folio != "" && $vendedor == 0 && $sucursal == 0)
    {
        $sales = mysqli_query($con,"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.t_pago FROM folio_venta f, clients c, users v, sucursales s  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.sucursal = s.id and f.folio = '$folio'");
    }
    elseif ($folio == "" && $vendedor > 0 && $sucursal == 0)
    {
        $sales = mysqli_query($con,"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.t_pago FROM folio_venta f, clients c, users v, sucursales s  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.sucursal = s.id and f.fecha_venta >= '$inicio' and f.fecha_venta <= '$finaliza' and f.vendedor = '$vendedor'");
    }
    elseif ($folio == "" && $vendedor == 0 && $sucursal > 0)
    {
        $sales = mysqli_query($con,"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.t_pago FROM folio_venta f, clients c, users v, sucursales s  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.sucursal = s.id and f.fecha_venta >= '$inicio' and f.fecha_venta <= '$finaliza' and f.sucursal = '$sucursal'");
    }
    elseif ($folio == "" && $vendedor > 0 && $sucursal > 0)
    {
        $sales = mysqli_query($con,"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.t_pago FROM folio_venta f, clients c, users v, sucursales s  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.sucursal = s.id and f.fecha_venta >= '$inicio' and f.fecha_venta <= '$finaliza' and f.sucursal = '$sucursal' and f.vendedor = '$vendedor' ");
    }
    else
    {
        $sales = mysqli_query($con,"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.t_pago FROM folio_venta f, clients c, users v, sucursales s  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.sucursal = s.id and f.fecha_venta >= '$inicio' and f.fecha_venta <= '$finaliza'");
    }
    
    $body = '';
    while($row = mysqli_fetch_array($sales))
    {
        if ($row[8] == "efectivo")
        {
            $efectivo = $efectivo + $row[5];
        }
        elseif ($row[8] == "transferencia")
        {
            $transferencia = $transferencia + $row[5];
        }
        elseif ($row[8] == "cheque")
        {
            $cheque = $cheque + $row[5];
        }
            
        $body = $body.'
        <tr>
        <td class="item-des">'.$row[0].'</td>
        <td class="item-des"><p>'.$row[1].'</p></td>
        <td class="item-des"><p>'.$row[2].'</p></td>
        <td class="item-des"><p>'.$row[7].'</p></td>
        <td class="item-des"><p>'.$row[6].'</p></td>
        <td class="item-des"><center><p>'.$row[3].' %</p></center></td>
        <td class="item-des"><center><p>$ '.$row[5].' MXN</p></center></td>
        <td class="item-des uppercase"><center><p>'.strtoupper($row[8]).'</p></center></td>
        </tr>
        ';
        $total = $total + $row[5];
    }
    
    $codigoHTML='
    <h1><center>'.$_SESSION['empresa_nombre'].'</center></h1>
    <h3><center>'.$_SESSION['empresa_direccion'].'</center></h3>
    <h3><center>MAIL: '.$_SESSION['empresa_correo'].' | TEL: '.$_SESSION['empresa_telefono'].'</center></h3>
    <h4><center>LISTADO DE VENTAS : DESDE:'.$inicio.' | HASTA:'.$finaliza.'</center></h4>
    <hr>
    <br><br>
    <table style="width:100%">
        <tr>
        <th class="table-head th-name uppercase">FOLIO</th>
        <th class="table-head th-name uppercase">VENDEDOR</th>
        <th class="table-head th-name uppercase">CLIENTE</th>
        <th class="table-head th-name uppercase">SUCURSAL</th>
        <th class="table-head th-name uppercase">F.VENTA</th>
        <th class="table-head th-name uppercase">DESCUENTO</th>
        <th class="table-head th-name uppercase">COBRADO</th>
        <th class="table-head th-name uppercase">M. PAGO</th>
        </tr>
        '.$body.'
    </table>
    
    <br><br>
    <br>
    <div align="right">';
    
    if ($efectivo > 0)
		{
			$codigoHTML .= '
			<h5>Efectivo: $ '.number_format($efectivo,2,".",",").' MXN</h5>
			';
		}

		if ($transferencia > 0)
		{
			$codigoHTML .= '
			<h5>Tranferencia: $ '.number_format($transferencia,2,".",",").' MXN</h5>
			';
		}

		if ($cheque > 0)
		{
			$codigoHTML .= '
			<h5>Cheque: $ '.number_format($cheque,2,".",",").' MXN</h5>
			';
		}
    
    $codigoHTML .= '<h3>TOTAL RECAUDADO: $ '.number_format($total,2,".",",").' MXN</h3>
    </div>
    <br>
    <footer>
      <center><p>CLTA DESARROLLO & DISTRIBUCION DE SOFTWARE<br><a href="http://www.cyberchoapas.com"> www.cyberchoapas.com</a></p></center>
    </footer>
    ';
    
    $codigoHTML = mb_convert_encoding($codigoHTML, 'HTML-ENTITIES', 'UTF-8');
    $dompdf=new DOMPDF();
    $dompdf->set_paper('letter', 'landscape');
    $dompdf->load_html($codigoHTML);
    ini_set("memory_limit","128M");
    $dompdf->render();
    $dompdf->stream("venta_ini".$_GET["inicio"]."_fin".$_GET["finaliza"].".pdf");
?>