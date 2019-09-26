<?php
    require_once 'db.php';
    
    $url = $_POST['url'];

    $asunto = $_POST['asunto'];

    $url = str_replace("&sendmail=true","",$url);
    $url = str_replace("?sendmail=true","",$url);
    $url = str_replace("&nosendmail=true","",$url);
    $url = str_replace("?nosendmail=true","",$url);

    $mail_receptor = $_POST['mail_cliente'];
    
    $body = $_POST['body_msg'];

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
  
    $mail->msgHTML(file_get_contents($body), __DIR__);
    //Replace the plain text body with one created manually  
    $mail->Body = $body;
    
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