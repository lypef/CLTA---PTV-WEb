<?php
    require_once 'func/db.php';
    require_once("dompdf/dompdf_config.inc.php");
    session_start();

    $vendedor = $_SESSION['users_id'];
    $con = db_conectar();  
    $sales = mysqli_query($con,"SELECT u.nombre, c.nombre, v.descuento, v.fecha, v.cobrado, v.fecha_venta, v.folio FROM folio_venta v, users u, clients c WHERE v.vendedor = u.id and v.client = c.id and v.open = 0 and v.cut = 0 and v.vendedor = '$vendedor'");


    while($row = mysqli_fetch_array($sales))
    {
        $vendedor = $row[0];
        $total = $total + $row[4];

        $logs = $logs . '
        </tr>
        <tr>
        <td>'.$row[1].'</td>
        <td><center>'.$row[2].' %</center></td>
        <td><center>'.$row[6].'</center></td>
        <td><center>'.$row[3].'</center></td>
        <td><center>$ '.$row[4].' MXN</center></td>
        </tr>
        ';
    }

    
    $codigoHTML='
    <h1><center>'.$_SESSION['empresa_nombre'].'</center></h1>
    <h4><center>CORTE X USUARIO: '.$_SESSION['users_nombre'].'</center></h4>
    <p>FECHA Y HORA DE GENERACION: '.date("Y-m-d H:i:s").'</p>
    <hr>
    <table style="width:100%">
        <tr>
        <th>CLIENTE</th> 
        <th>DESCUENTO</th> 
        <th>FOLIO</th> 
        <th>FECHA DE VENTA</th>
        <th>COBRADO</th>
        </tr>
        '.$logs.'
    </table>
    <br><br>
    <br><br>
    <footer>
      <center><strong><p>TOTAL RECAUDADO: $ '.number_format($total,2,".",",").' MXN</strong></p>
      <p>CLTA DESARROLLO & DISTRIBUCION DE SOFTWARE<br><a href="http://www.cyberchoapas.com"> www.cyberchoapas.com</a></p></center>
    </footer>';
    
    $codigoHTML=utf8_encode($codigoHTML);
    $dompdf=new DOMPDF();
    $dompdf->set_paper('letter', '');
    $dompdf->load_html($codigoHTML);
    ini_set("memory_limit","128M");
    $dompdf->render();
    $dompdf->stream("CorteX".$vendedor.date("YmdHis").".pdf");
?>