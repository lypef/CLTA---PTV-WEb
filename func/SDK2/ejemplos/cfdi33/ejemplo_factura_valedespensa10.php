<?php
// Se desactivan los mensajes de debug
error_reporting(0);

// Se especifica la zona horaria
date_default_timezone_set('America/Mexico_City');

// Se incluye el SDK
require_once '../../sdk2.php';

// Se especifica la version de CFDi 3.3
$datos['version_cfdi'] = '3.3';

// SE ESPECIFICA EL COMPLEMENTO
$datos['complemento'] = 'valesdedespensa10';

// Ruta del XML Timbrado
$datos['cfdi']='../../timbrados/ejemplo_factura_valedespensa10.xml';

// Ruta del XML de Debug
$datos['xml_debug']='../../timbrados/debug_ejemplo_factura_valedespensa10.xml';

// Credenciales de Timbrado
$datos['PAC']['usuario'] = 'DEMO700101XXX';
$datos['PAC']['pass'] = 'DEMO700101XXX';
$datos['PAC']['produccion'] = 'NO';

// Rutas y clave de los CSD
$datos['conf']['cer'] = '../../certificados/AAA010101AAA.cer.pem';
$datos['conf']['key'] = '../../certificados/AAA010101AAA.key.pem';
$datos['conf']['pass'] = '12345678a';

// Datos de la Factura
$datos['factura']['condicionesDePago'] = 'CONDICIONES';
$datos['factura']['descuento'] = '0.00';
$datos['factura']['fecha_expedicion'] = date('Y-m-d\TH:i:s', time() - 120);
$datos['factura']['folio'] = '100';
$datos['factura']['forma_pago'] = '01';
$datos['factura']['LugarExpedicion'] = '45079';
$datos['factura']['metodo_pago'] = 'PUE';
$datos['factura']['moneda'] = 'MXN';
$datos['factura']['serie'] = 'A';
$datos['factura']['subtotal'] = '100.00';
$datos['factura']['tipocambio'] = '1.0';
$datos['factura']['tipocomprobante'] = 'I';
$datos['factura']['total'] = '100.00';
$datos['factura']['RegimenFiscal'] = '601';

// Datos del Emisor
$datos['emisor']['rfc'] = 'AAA010101AAA'; //RFC DE PRUEBA
$datos['emisor']['nombre'] = 'CINDEMEX SA DE CV';  // EMPRESA DE PRUEBA

// Datos del Receptor
$datos['receptor']['rfc'] = 'XAXX010101000';
$datos['receptor']['nombre'] = 'Publico en General';
$datos['receptor']['UsoCFDI'] = 'G01';

// Se agregan los conceptos
for ($i = 1; $i <= 1; $i++)
{
    $datos['conceptos'][$i]['cantidad'] = '1.00';
    $datos['conceptos'][$i]['unidad'] = 'PZ';
    $datos['conceptos'][$i]['ID'] = "COD$i";
    $datos['conceptos'][$i]['descripcion'] = "PRODUCTO $i";
    $datos['conceptos'][$i]['valorunitario'] = '100.00';
    $datos['conceptos'][$i]['importe'] = '100.00';
    $datos['conceptos'][$i]['ClaveProdServ'] = '01010101';
    $datos['conceptos'][$i]['ClaveUnidad'] = 'C81';
}

// Se agregan los Impuestos
$datos['impuestos']['TotalImpuestosTrasladados'] = '0.00';
$datos['impuestos']['translados'][0]['impuesto'] = '003';
$datos['impuestos']['translados'][0]['tasa'] = '0.160000';
$datos['impuestos']['translados'][0]['importe'] = '0.00';
$datos['impuestos']['translados'][0]['TipoFactor'] = 'Tasa';

// Complemento Vales de Despensa
$datos['valesdedespensa10']['tipoOperacion']='gref';
$datos['valesdedespensa10']['registroPatronal']='908545';
$datos['valesdedespensa10']['numeroDeCuenta']='8947.50';
$datos['valesdedespensa10']['total']='12345.50';

$datos['valesdedespensa10']['Conceptos'][0]['identificador']='123';
$datos['valesdedespensa10']['Conceptos'][0]['fecha']='05-04-2017';
$datos['valesdedespensa10']['Conceptos'][0]['rfc']='gaar930830mcl';
$datos['valesdedespensa10']['Conceptos'][0]['curp']='8';
$datos['valesdedespensa10']['Conceptos'][0]['nombre']='4';
$datos['valesdedespensa10']['Conceptos'][0]['numSeguridadSocial']='oil';
$datos['valesdedespensa10']['Conceptos'][0]['importe']='142.00';

$datos['valesdedespensa10']['Conceptos'][1]['identificador']='456';
$datos['valesdedespensa10']['Conceptos'][1]['fecha']='05-04-2017';
$datos['valesdedespensa10']['Conceptos'][1]['rfc']='gaar930830mcl';
$datos['valesdedespensa10']['Conceptos'][1]['curp']='8';
$datos['valesdedespensa10']['Conceptos'][1]['nombre']='4';
$datos['valesdedespensa10']['Conceptos'][1]['numSeguridadSocial']='oil';
$datos['valesdedespensa10']['Conceptos'][1]['importe']='142.00';

// Se ejecuta el SDK
$res= mf_genera_cfdi($datos);


///////////    MOSTRAR RESULTADOS DEL ARRAY $res   ///////////
 
echo "<h1>Respuesta Generar XML y Timbrado</h1>";
foreach($res AS $variable=>$valor)
{
    $valor=htmlentities($valor);
    $valor=str_replace('&lt;br/&gt;','<br/>',$valor);
    echo "<b>[$variable]=</b>$valor<hr>";
}



?>