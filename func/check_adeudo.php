<?php
    include 'db.php';
    db_sessionValidarNO();
    session_start();
    
    if ($_SESSION['token'] == GetToken())
    {
        $client = $_GET['client'];
        
        if (!CheckCreditExistClient($client))
        {
            echo '<script>location.href = "/clients.php?pagina=1&search='.Return_NombreClient($client).'&no_adeudo=true"</script>';
        }else
        {
            echo '<script>location.href = "/credits.php?client='.$client.'&sucursal=0&adeudo=true"</script>';
        }   
    }
?>