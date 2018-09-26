<?php
    include 'db.php';
    db_sessionValidarNO();
    
    $url = $_POST['url'];
    $id = $_POST['id'];
    
    $con = db_conectar();  
    mysqli_query($con,"DELETE FROM clients WHERE id = '$id';");

    if (!mysqli_error($con))
    {
        for($i=0;$i<strlen($url);$i++)
        {
            if ($url[$i] == "?")
            {
                $addpregunta = true;
            }
        }
        if ($addpregunta)
        {
            echo '<script>location.href = "'.$url.'&delete=true"</script>';
        }else{
            echo '<script>location.href = "'.$url.'?delete=true"</script>';
        }
    }else
    {
        echo '<script>location.href = "/clients.php?pagina=1&nodelete=true"</script>';
    }

?>