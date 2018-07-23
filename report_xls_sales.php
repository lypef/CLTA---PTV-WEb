<?php
    header("Content-type: application/vnd.ms-excel");
    header("Content-Disposition: attachment; filename=reporte_adicionales.xls");
    
    require_once 'func/db.php';
    require_once("dompdf/dompdf_config.inc.php");
    session_start();
    
    $inicio = $_GET["inicio"] . ' 00:00:00';
    $finaliza = $_GET["finaliza"] . ' 23:59:59';
    $total = 0;

    $con = db_conectar();  
    $sales = mysqli_query($con,"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta FROM folio_venta f, clients c, users v  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.fecha_venta >= '$inicio' and f.fecha_venta <= '$finaliza'");

    $body = '';
    while($row = mysqli_fetch_array($sales))
    {
        $body = $body.'
        <tr>
        <td class="item-des">'.$row[0].'</td>
        <td class="item-des"><p>'.$row[1].'</p></td>
        <td class="item-des"><p>'.$row[2].'</p></td>
        <td class="item-des"><p>'.$row[4].'</p></td>
        <td class="item-des"><p>'.$row[6].'</p></td>
        <td class="item-des"><center><p>'.$row[3].' %</p></center></td>
        <td class="item-des"><center><p>$ '.$row[5].' MXN</p></center></td>
        </tr>
        ';
        $total = $total + $row[5];
    }
    
    echo '
    <h1><center>'.$_SESSION['empresa_nombre'].'</center></h1>
    <h4><center>LISTADO DE VENTAS : DESDE:'.$inicio.' | HASTA:'.$finaliza.'</center></h4>
    <hr>
    <br><br>
    <table style="width:100%">
        <tr>
        <th class="table-head th-name uppercase">FOLIO</th>
        <th class="table-head th-name uppercase">VENDEDOR</th>
        <th class="table-head th-name uppercase">CLIENTE</th>
        <th class="table-head th-name uppercase">F.ALTA</th>
        <th class="table-head th-name uppercase">F.VENTA</th>
        <th class="table-head th-name uppercase">DESCUENTO</th>
        <th class="table-head th-name uppercase">COBRADO</th>
        </tr>
        '.$body.'
    </table>
    
    <br><br>
    <br>
    <center>
    <h3>TOTAL RECAUDADO: $ '.number_format($total,2,".",",").' MXN</h3>
    </center>
    <br>
    <footer>
      <center><p>CLTA DESARROLLO & DISTRIBUCION DE SOFTWARE<br><a href="http://www.cyberchoapas.com"> www.cyberchoapas.com</a></p></center>
    </footer>
    ';
?>