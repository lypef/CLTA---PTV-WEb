<?php
    require_once 'func/db.php';
    require_once("dompdf/dompdf_config.inc.php");
    session_start();
    
    $con = db_conectar();  
    $id = $_GET['almacen'];

    if ($_GET["almacen"])
    {
        $sales = mysqli_query($con,"SELECT p.id, p.`no. De parte`,p.nombre, a.nombre, d.nombre, p.marca, p.precio_normal, p.stock, p.loc_almacen FROM productos p, almacen a, departamentos d WHERE p.almacen = a.id and p.departamento = d.id and a.id = '$id' ORDER by p.nombre asc");
    }
    
    if ($_GET["almacen"] == 'full')
    {
        $sales = mysqli_query($con,"SELECT p.id, p.`no. De parte`,p.nombre, a.nombre, d.nombre, p.marca, p.precio_normal, p.stock, p.loc_almacen FROM productos p, almacen a, departamentos d WHERE p.almacen = a.id and p.departamento = d.id ORDER by p.nombre asc");
    }

    
    $body = '';
    while($row = mysqli_fetch_array($sales))
    {
        $body = $body.'
        <tr>
        <td class="item-des"><p>'.$row[0].'</p></td>
        <td class="item-des"><p>'.$row[1].'</p></td>
        <td class="item-des"><p>'.$row[8].'</p></td>
        <td class="item-des"><p>'.$row[2].'</p></td>
        <td class="item-des"><p>'.$row[3].'</p></td>
        <td class="item-des"><p>'.$row[5].'</p></td>
        <td class="item-des"><p>$ '.$row[6].' MXN</p></td>
        <td class="item-des"><p>'.$row[7].' UDS</p></td>
        </tr>
        ';

        // Add hijos
        if ($_GET["almacen"])
        {
            $hijos = mysqli_query($con,"SELECT s.id, s.padre, a.nombre, s.stock FROM productos_sub s, almacen a where s.almacen = a.id and padre = '$row[0]' and a.id = '$id' ");
        }
        
        if ($_GET["almacen"] == 'full')
        {
            $hijos = mysqli_query($con,"SELECT s.id, s.padre, a.nombre, s.stock FROM productos_sub s, almacen a where s.almacen = a.id and padre = '$row[0]'");
        }
        
        
        while($item = mysqli_fetch_array($hijos))
        {
            $body = $body.'
            <tr>
            <td class="item-des"><p>'.$row[0].'</p></td>
            <td class="item-des"><p>'.$row[1].'</p></td>
            <td class="item-des"><p>'.$row[8].'</p></td>
            <td class="item-des"><p>'.$row[2].'</p></td>
            <td class="item-des"><p>'.$item[2].'</p></td>
            <td class="item-des"><p>'.$row[5].'</p></td>
            <td class="item-des"><p>$ '.$row[6].' MXN</p></td>
            <td class="item-des"><p>'.$item[3].' UDS</p></td>
            </tr>
            ';
        } //Finaliza hijos
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
        <th class="table-head th-name uppercase">UBICACION</th>
        <th class="table-head th-name uppercase">PRODUCTO</th>
        <th class="table-head th-name uppercase">ALMACEN</th>
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