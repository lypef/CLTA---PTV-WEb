<?php
/**
 * @author MultiFacturas.com
 * @copyright 2013
 * 
 * EL array $datos contiene la información de la factura a generar
 * 
 * GENERACION DEL CERTIFICADO Y LLAVE .PEM
 * ESTOS SE REQUIEREN PARA LA GENERACION DEL SELLO
 * SE RECOMIENDA GENERARLOS UNA SOLA VES Y ALMACENAR SU INFORMACION
 * PARA EVITAR PROCESAMIENTO ADICIONAL
 * 
 * $respuesta=certificado_pem($datos);
 * 
 * GENERA EL XML Y LO TIMBRA EN BASE A LA INFORMACION DEL ARREGLO $datos
 * 
 * VALIDADOR DE ESTRUCTURA DEL XML
 * https://www.consulta.sat.gob.mx/sicofi_web/moduloECFD_plus/ValidadorCFDI/Validador%20cfdi.html
 */
error_reporting(~E_NOTICE);

date_default_timezone_set('America/Mexico_City');

require_once 'db.php';
// Se incluye el SDK
require_once 'SDK2/sdk2.php';

//Variables
    $folio = $_POST['folio'];

    $data = mysqli_query(db_conectar(),"SELECT cfdi_lugare_expedicion, cfdi_rfc, nombre, cfdi_regimen, cfdi_cer, cfdi_key, cfdi_pass FROM `empresa`");

    while($row = mysqli_fetch_array($data))
    {
        $cfdi_lugare_expedicion = $row[0];
        $cfdi_rfc = $row[1];
        $cfdi_nombre = $row[2];
        $cfdi_regimen = $row[3];
        $cfdi_cer = $row[4];
        $cfdi_key = $row[5];
        $cfdi_pass = $row[6];
    }

    /////////////////////////////////////////////////////////////////////////////////
    ////////////     CREAR ARCHIVOS .PEM
    /////////////////////////////////////////////////////////////////////////////////

    $datos['cancelar']='SI';
    $datos['cfdi']='SDK2/timbrados/'.$folio.'.xml';
    $datos['PAC']['usuario'] = $cfdi_rfc;
    $datos['PAC']['pass'] = $cfdi_pass;
    $datos['PAC']['produccion'] = 'NO';
    $datos['conf']['cer'] = $cfdi_cer;
    $datos['conf']['key'] = $cfdi_key;
    $datos['conf']['pass'] = $cfdi_pass;

    $res = cfdi_cancelar($datos);

    if ($res["codigo_mf_texto"] == 0)
    {
        ///////////    MOSTRAR RESULTADOS DEL ARRAY $res   ///////////
        echo "<h1>Respuesta Generar XML y Timbrado</h1>";
        foreach($res AS $variable=>$valor)
        {
            $valor=htmlentities($valor);
            $valor=str_replace('&lt;br/&gt;','<br/>',$valor);
            echo "<b>[$variable]=</b>$valor<hr>";
        }
        mysqli_query(db_conectar(),"DELETE from `facturas` WHERE folio = '$folio';");
        echo '<script>location.href = "/facturas.php?pagina=1"</script>';
    }
?>