<?php
    include 'db.php';
    db_sessionValidarNO();
    
    $nombre = $_POST['nombre'];
    $direccion = $_POST['direccion'];
    $telefono = $_POST['telefono'];
    
    $con = db_conectar();  
    mysqli_query($con,"INSERT INTO `sucursales` (`nombre`, `direccion`, `telefono`) VALUES ('$nombre', '$direccion', '$telefono');");

    if (!mysqli_error($con))
    {
        echo '<script>location.href = "../sucursales.php?add=true"</script>';
    }else
    {
        echo '<script>location.href = "../sucursales.php?noadd=true"</script>';
    }
?>