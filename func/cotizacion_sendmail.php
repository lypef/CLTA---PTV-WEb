<?php
    //ini_set( 'display_errors', 1 );
    //error_reporting( E_ALL );
    
    $url = $_POST['url'];

    $header = $_POST['header'];

    $url = str_replace("&sendmail=true","",$url);
    $url = str_replace("?sendmail=true","",$url);
    $url = str_replace("&nosendmail=true","",$url);
    $url = str_replace("?nosendmail=true","",$url);

    $current_url = $_POST['url_web']; 

    $mail_receptor = $_POST['mail'];
    
    $body = $_POST['body'];
    
    $folio = $_POST['folio'];
    
    $message = str_replace("%cot_cot%", '<a href="'.$current_url.'/sale_finaly_report_cotizacion.php?folio_sale='.$folio.'" target="_blank">Visualizar cotizacion</a>', $body);
    
    //$message = $message . '<br><br><b>Si no puede acceder a el enlace, ingrese manualmente aqui.</b><br>' . $current_url.'/sale_finaly_report_cotizacion.php?folio_sale='.$folio;

    $asunto = $_POST['header'];
    
    $folio = $_POST['folio'];
    
    require '../phpmailer/PHPMailerAutoload.php';
    
    //Create a new PHPMailer instance
    $mail = new PHPMailer;
    //Tell PHPMailer to use SMTP
    
    $mail->isSMTP();
    //$mail->SMTPDebug = 2;
    $mail->Host = 'smtp.gmail.com';
    $mail->Port = 587;
    $mail->SMTPSecure = 'tls';
    $mail->SMTPAuth = true;
    
    $mail->Username = "documentos@cyberchoapas.com";
    $mail->Password = "Zxasqw10";
    $mail->setFrom('contacto@cyberchoapas.com', 'CLTA | GRUPO ASCGAR');
    $mail->AddReplyTo('ventas@cyberchoapas.com', 'VENTAS CLTA | GRUPO ASCGAR');
    
    //Email receptor
    $ArrMail = explode(",",$mail_receptor);
    
    foreach ($ArrMail as $valor) {
        $mail->addAddress($valor);
    }

    
    //Asunto
    $mail->Subject = $asunto;
  
    $mail->msgHTML(file_get_contents($message), __DIR__);
    //Replace the plain text body with one created manually  
    $mail->Body = $message;
    
    $r = $mail->send();
    
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
    }else
    {
        if ($r)
        {
            echo '<script>location.href = "'.$url.'?sendmail=true"</script>';
        }else {echo '<script>location.href = "'.$url.'?nosendmail=true"</script>';
            
        }
    }
?>