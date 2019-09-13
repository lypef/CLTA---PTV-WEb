<?php
    $url = $_POST['url'];

    $header = $_POST['header'];

    $url = str_replace("&sendmail=true","",$url);
    $url = str_replace("?sendmail=true","",$url);
    $url = str_replace("&nosendmail=true","",$url);
    $url = str_replace("?nosendmail=true","",$url);

    $current_url = $_POST['url_web']; 

    $mail = $_POST['mail'];
    $body = $_POST['body'];

    $folio = $_POST['folio'];

    $from = "noreply@ascgar.com";
    $to = $mail;
    $subject = "COTIZACION: " . $folio;

    $cabecera = 'From: '.$header.' <ventas@cyberchoapas.com>'."\r\n" . 
                "Reply-To: ventas@cyberchoapas.com"."\r\n";
    $cabecera .= "Content-type: text/html;  charset=utf-8"; 

    $message = str_replace("%cot_cot%", '<a href="'.$current_url.'/sale_finaly_report_cotizacion.php?folio_sale='.$folio.'" target="_blank">Visualizar cotizacion</a>', $body);
    
    /*$message = $message . '<br><br><b>Si no puede acceder a el enlace, ingrese manualmente aqui.</b><br>' . $current_url.'/sale_finaly_report_cotizacion.php?folio_sale='.$folio;*/
    
    $headers = "From:" . $from;

    $r = mail($to,$subject,$message, $cabecera);
        
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
        if ($r)
        {
            echo '<script>location.href = "'.$url.'&sendmail=true"</script>';
        }else {echo '<script>location.href = "'.$url.'&nosendmail=true"</script>';}
    }else{
        if ($r)
        {
            echo '<script>location.href = "'.$url.'?sendmail=true"</script>';
        }else {echo '<script>location.href = "'.$url.'?nosendmail=true"</script>';}
    } 
?>
        
