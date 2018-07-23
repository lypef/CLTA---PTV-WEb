<?php
    require_once 'func/db.php';
    require_once("dompdf/dompdf_config.inc.php");
    session_start();
    
    $con = db_conectar();  
    $sales = mysqli_query($con,"SELECT p.id, p.`no. De parte`,p.nombre, a.nombre, d.nombre, p.marca, p.precio_normal, p.stock FROM productos p, almacen a, departamentos d WHERE p.almacen = a.id and p.departamento = d.id ORDER by p.nombre asc");

    $body = '';
    while($row = mysqli_fetch_array($sales))
    {
        $body = $body.'
        <tr>
        <td class="item-des"><p>'.$row[0].'</p></td>
        <td class="item-des"><p>'.$row[1].'</p></td>
        <td class="item-des"><p>'.$row[2].'</p></td>
        <td class="item-des"><p>'.$row[3].'</p></td>
        <td class="item-des"><p>'.$row[4].'</p></td>
        <td class="item-des"><p>'.$row[5].'</p></td>
        <td class="item-des"><p>'.$row[6].'</p></td>
        <td class="item-des"><p>$ '.$row[7].' MXN</p></td>
        </tr>
        ';
        $total = $total + $row[5];
    }
    
    $codigoHTML='
    <h1><center>'.$_SESSION['empresa_nombre'].'</center></h1>
    <h3><center>'.$_SESSION['empresa_direccion'].'</center></h3>
    <h3><center>MAIL: '.$_SESSION['empresa_correo'].' | TEL: '.$_SESSION['empresa_telefono'].'</center></h3>
    <h4><center>LISTA DE PRODUCTOS EN EXISTENCIA</center></h4>
    <hr>
    <br><br>
    <table style="width:100%">
        <tr>
        <th class="table-head th-name uppercase">ID</th>
        <th class="table-head th-name uppercase">NO. PARTE</th>
        <th class="table-head th-name uppercase">PRODUCTO</th>
        <th class="table-head th-name uppercase">ALMACEN</th>
        <th class="table-head th-name uppercase">DEPARTAMENTO</th>
        <th class="table-head th-name uppercase">PROVEEDOR</th>
        <th class="table-head th-name uppercase">PRECIO</th>
        <th class="table-head th-name uppercase">EXISTENCIA</th>
        </tr>
        '.$body.'
    </table>
    
    <br><br>
    <br>
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
    $dompdf->stream("reporte_productos.pdf");
?>