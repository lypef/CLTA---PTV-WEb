<?php
    include 'db.php';
    db_sessionValidarNO();
    
    $folio = $_POST['folio'];
    $url = $_POST['url'];
    $cfdi_cliente_correo = $_POST['cfdi_cliente_correo'];
    $cfdi_serie = $_POST['cfdi_serie'];

    $from = "contacto@distribuidoradetractopartesloaiza.com";
    $to = $cfdi_cliente_correo;
    $subject = "FACTURA CFDI: " . $cfdi_serie;

    $cabecera = "From: DTPL-CONTACTO <contacto@distribuidoradetractopartesloaiza.com>"."\r\n";
    $cabecera .= "Content-type: text/html;  charset=utf-8"; 

    $message = 'SE REENVIA PDF Y XML DE SU FACTURA VALIDA ANTE EL SAT. <br><br>Fichero XML: <a href="http://www.distribuidoradetractopartesloaiza.com/func/SDK2/timbrados/' . $folio . '.xml" target="_blank">Factura XML</a><br><br>Fichero PDF: <a href="http://www.distribuidoradetractopartesloaiza.com/func/SDK2/timbrados/' . $folio . '.pdf" target="_blank">Factura PDF</a>';

    $headers = "From:" . $from;

    mail($to,$subject,$message, $cabecera);

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
        echo '<script>location.href = "'.$url.'&send_mail=true"</script>';
    }else{
        echo '<script>location.href = "'.$url.'?send_mail=true"</script>';
    }
?>
