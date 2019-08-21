<?php
    include 'db.php';
    db_sessionValidarNO();
    
    $url = $_POST['url'];
    $nombre = $_POST['nombre'];
    $nombre_corto = $_POST['nombre_corto'];
    $direccion = $_POST['direccion'];
    $correo = $_POST['correo'];
    $telefono = $_POST['telefono'];
    $facebook = $_POST['facebook'];
    $twitter = $_POST['twitter'];
    $youtube = $_POST['youtube'];
    
    $con = db_conectar();  
    if ( 
        !empty(trim($nombre)) && 
        !empty(trim($nombre_corto)) && 
        !empty(trim($direccion)) && 
        !empty(trim($correo)) && 
        !empty(trim($telefono)) && 
        !empty(trim($facebook)) && 
        !empty(trim($twitter)) && 
        !empty(trim($youtube))
       )
    {
        mysqli_query($con,"UPDATE `empresa` SET `nombre` = '$nombre', `nombre_corto` = '$nombre_corto', `direccion` = '$direccion', `correo` = '$correo', `telefono` = '$telefono', `facebook` = '$facebook', `twitter` = '$twitter', `youtube` = '$youtube' WHERE id = 1;");
    }


    

    if (!mysqli_error($con))
    {
        db_sessionDestroy_login();
    }else
    {
        $addpregunta = false;

        for($i=0;$i<strlen($url);$i++)
        {
            if ($url[$i] == "?")
            {
                $addpregunta = true;
            }
        }

        if ($addpregunta)
        {
            echo '<script>location.href = "'.$url.'&error_update_empresa=true"</script>';
        }else{
            echo '<script>location.href = "'.$url.'?error_update_empresa=true"</script>';
        }
        
    }

?>