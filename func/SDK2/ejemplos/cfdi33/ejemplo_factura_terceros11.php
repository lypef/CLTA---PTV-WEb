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
$datos['complemento'] = 'terceros11';

// Ruta del XML Timbrado
$datos['cfdi']='../../timbrados/ejemplo_factura_terceros11.xml';

// Ruta del XML de Debug
$datos['xml_debug']='../../timbrados/debug_ejemplo_factura_terceros11.xml';

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

// Complemento Terceros
$datos['terceros11']['rfc'] = 'O';
$datos['terceros11']['nombre'] = '2016-10-31';

$datos['terceros11']['InformacionFiscalTercero']['calle'] = '2016-10-16';
$datos['terceros11']['InformacionFiscalTercero']['noExterior'] = '2016-10-16';
$datos['terceros11']['InformacionFiscalTercero']['noInterior'] = '2016-10-16';
$datos['terceros11']['InformacionFiscalTercero']['colonia'] = '2016-10-16';
$datos['terceros11']['InformacionFiscalTercero']['localidad'] = '2016-10-16';
$datos['terceros11']['InformacionFiscalTercero']['referencia'] = '2016-10-16';
$datos['terceros11']['InformacionFiscalTercero']['municipio'] = '2016-10-16';
$datos['terceros11']['InformacionFiscalTercero']['estado'] = '2016-10-16';
$datos['terceros11']['InformacionFiscalTercero']['pais'] = '2016-10-16';
$datos['terceros11']['InformacionFiscalTercero']['codigoPostal'] = '2016-10-16';

$datos['terceros11']['InformacionAduanera']['numero'] = '2016-10-31';
$datos['terceros11']['InformacionAduanera']['fecha'] = '2016-10-31';
$datos['terceros11']['InformacionAduanera']['aduana'] = '2016-10-31';

$datos['terceros11']['Parte'][0]['InformacionAduanera'][0]['numero'] = '15';
$datos['terceros11']['Parte'][0]['InformacionAduanera'][0]['fecha'] = '2012';
$datos['terceros11']['Parte'][0]['InformacionAduanera'][0]['aduana'] = '56vs';

$datos['terceros11']['Parte'][0]['cantidad'] = '56vs';
$datos['terceros11']['Parte'][0]['unidad'] = '56vs';
$datos['terceros11']['Parte'][0]['noIdentificacion'] = '56vs';
$datos['terceros11']['Parte'][0]['descripcion'] = '56vs';
$datos['terceros11']['Parte'][0]['valorUnitario'] = '56vs';
$datos['terceros11']['Parte'][0]['importe'] = '56vs';

$datos['terceros11']['CuentaPredial']['numero'] = '56vs';

$datos['terceros11']['Impuestos']['Retenciones'][0]['impuesto'] = '54';
$datos['terceros11']['Impuestos']['Retenciones'][0]['importe'] = '76';

$datos['terceros11']['Impuestos']['Traslados'][0]['impuesto'] = '3';
$datos['terceros11']['Impuestos']['Traslados'][0]['tasa'] = '65';
$datos['terceros11']['Impuestos']['Traslados'][0]['importe'] = '87';

$res= cfdi_generar_xml($datos);


///////////    MOSTRAR RESULTADOS DEL ARRAY $res   ///////////
 
echo "<h1>Respuesta Generar XML y Timbrado</h1>";
foreach($res AS $variable=>$valor)
{
    $valor=htmlentities($valor);
    $valor=str_replace('&lt;br/&gt;','<br/>',$valor);
    echo "<b>[$variable]=</b>$valor<hr>";
}



?>