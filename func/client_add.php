<?php
    include 'db.php';
    db_sessionValidarNO();
    
    $nombre = strtoupper($_POST['nombre']);
    $direccion = strtoupper($_POST['direccion']);
    $telefono = strtoupper($_POST['telefono']);
    $p_descuento = $_POST['p_descuento'];
    $rfc = strtoupper($_POST['rfc']);
    $r_social = strtoupper($_POST['r_social']);
    $correo = $_POST['correo'];
    
    
    $con = db_conectar();  
    mysqli_query($con,"INSERT INTO `clients` (`nombre`, `direccion`, `telefono`, `descuento`, `rfc`, `razon_social`, `correo`) VALUES ('$nombre', '$direccion', '$telefono', '$p_descuento', '$rfc', '$r_social', '$correo');");

    if (!mysqli_error($con))
    {
        echo '<script>location.href = "../client_add.php?add=true"</script>';
    }else
    {
        echo '<script>location.href = "../client_add.php?noadd=true&nombre='.$nombre.'&direccion='.$direccion.'&telefono='.$telefono.'&p_descuento='.$p_descuento.'&r_social='.$r_social.'&rfc='.$rfc.'&correo='.$correo.'"</script>';
    }
?>