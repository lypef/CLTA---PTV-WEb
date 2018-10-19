<?php
// Se desactivan los mensajes de debug
error_reporting(~(E_WARNING|E_NOTICE));
//error_reporting(E_ALL);

// Se especifica la zona horaria
date_default_timezone_set('America/Mexico_City');

//Variables
$folio = $_POST['folio'];
$cfdi_f_pago = $_POST['cfdi_f_pago'];
$cfdi_uso = $_POST['cfdi_uso'];
$cfdi_tipo = $_POST['cfdi_tipo'];
$cfdi_m_pago = $_POST['cfdi_m_pago'];
$cfdi_moneda = $_POST['cfdi_moneda'];
$cfdi_serie = $_POST['cfdi_serie'];

require_once 'db.php';

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

$cliente = mysqli_query(db_conectar(),"SELECT c.rfc, c.razon_social, c.correo FROM folio_venta v, clients c WHERE v.client = c.id and v.folio = '$folio'");

while($row = mysqli_fetch_array($cliente))
{
    $cfdi_cliente_rfc = $row[0];
    $cfdi_cliente_r_social = $row[1];
    $cfdi_cliente_correo = $row[2];
}


// Se incluye el SDK
require_once 'SDK2/sdk2.php';

// Se especifica la version de CFDi 3.3
$datos['version_cfdi'] = '3.3';

// Ruta del XML Timbrado
$datos['cfdi']='SDK2/timbrados/'.$folio.'.xml';

// Ruta del XML de Debug
$datos['xml_debug']='SDK2/timbrados/'.$folio.'.xml';

// Credenciales de Timbrado
$datos['PAC']['usuario'] = $cfdi_rfc;;
$datos['PAC']['pass'] = $cfdi_pass;;
$datos['PAC']['produccion'] = 'NO';

// Rutas y clave de los CSD
$datos['conf']['cer'] = $cfdi_cer;
$datos['conf']['key'] = $cfdi_key;
$datos['conf']['pass'] = $cfdi_pass;

// Datos de la Factura
$datos['factura']['condicionesDePago'] = 'CONDICIONES';
$datos['factura']['descuento'] = '0.00';
$datos['factura']['fecha_expedicion'] = date('Y-m-d\TH:i:s', time() - 120);
$datos['factura']['folio'] = $folio;
$datos['factura']['forma_pago'] = $cfdi_f_pago;
$datos['factura']['LugarExpedicion'] = $cfdi_lugare_expedicion;
$datos['factura']['metodo_pago'] = $cfdi_m_pago;
$datos['factura']['moneda'] = $cfdi_moneda;
$datos['factura']['serie'] = $cfdi_serie;
$datos['factura']['tipocambio'] = 1.00;
$datos['factura']['tipocomprobante'] = $cfdi_tipo;
$datos['factura']['RegimenFiscal'] = $cfdi_regimen;

// Datos del Emisor
$datos['emisor']['rfc'] = $cfdi_rfc; //RFC DE PRUEBA
$datos['emisor']['nombre'] = strtoupper ($cfdi_nombre);  // EMPRESA DE PRUEBA

// Datos del Receptor
$datos['receptor']['rfc'] = $cfdi_cliente_rfc;
$datos['receptor']['nombre'] = $cfdi_cliente_r_social;
$datos['receptor']['UsoCFDI'] = $cfdi_uso;

// Se agregan los conceptos

        $data = mysqli_query(db_conectar(),"SELECT v.unidades, _p.nombre, v.precio, v.id, _p.descripcion, _p.foto0, _p.id, _p.`no. De parte`, _p.marca, _p.stock, _p.cv, _p.um, _p.id FROM product_venta v, productos _p WHERE v.product = _p.id and v.folio_venta = '$folio' ");
		$genericos = mysqli_query(db_conectar(),"SELECT unidades, p_generico, precio, id FROM product_venta v WHERE p_generico != '' and folio_venta = '$folio'");

        $cont = 0;
        $total = 0;
        $total_iva = 0;

        while($row = mysqli_fetch_array($data))
		{
			$cont = $cont + 1;
            
            $total_tmp = ($row[0] * $row[2]);
            $iva_tmp = ($row[0] * $row[2]) * 0.160000;
            
            $total = $total +  $total_tmp;
            $total_iva = $total_iva + $iva_tmp;
            
            $datos['conceptos'][$cont]['cantidad'] = $row[0];
            $datos['conceptos'][$cont]['unidad'] = 'NA';
            $datos['conceptos'][$cont]['ID'] = $row[12];
            $datos['conceptos'][$cont]['descripcion'] = $row[1];
            $datos['conceptos'][$cont]['valorunitario'] = $row[2];
            $datos['conceptos'][$cont]['importe'] = number_format($total_tmp - $iva_tmp,2,".",",");
            $datos['conceptos'][$cont]['ClaveProdServ'] = $row[10];
            $datos['conceptos'][$cont]['ClaveUnidad'] = $row[11];
            
            
            $datos['conceptos'][$cont]['Impuestos']['Traslados'][0]['Base'] = $row[0] * $row[2];
            $datos['conceptos'][$cont]['Impuestos']['Traslados'][0]['Impuesto'] = '002';
            $datos['conceptos'][$cont]['Impuestos']['Traslados'][0]['TipoFactor'] = 'Tasa';
            $datos['conceptos'][$cont]['Impuestos']['Traslados'][0]['TasaOCuota'] = '0.160000';
            $datos['conceptos'][$cont]['Impuestos']['Traslados'][0]['Importe'] = ($row[0] * $row[2]) * 0.160000;

		}

        while($row = mysqli_fetch_array($genericos))
		{
			$cont = $cont + 1;
            
            $total_tmp = ($row[0] * $row[2]);
            $iva_tmp = ($row[0] * $row[2]) * 0.160000;
            
            $total = $total +  $total_tmp;
            $total_iva = $total_iva + $iva_tmp;
            
            $datos['conceptos'][$cont]['cantidad'] = $row[0];
            $datos['conceptos'][$cont]['unidad'] = 'NA';
            $datos['conceptos'][$cont]['ID'] = $row[3];
            $datos['conceptos'][$cont]['descripcion'] = $row[1];
            $datos['conceptos'][$cont]['valorunitario'] = $row[2];
            $datos['conceptos'][$cont]['importe'] = number_format($total_tmp - $iva_tmp,2,".",",");
            $datos['conceptos'][$cont]['ClaveProdServ'] = '01010101';
            $datos['conceptos'][$cont]['ClaveUnidad'] = 'ACT';
            
            
            $datos['conceptos'][$cont]['Impuestos']['Traslados'][0]['Base'] = $row[0] * $row[2];
            $datos['conceptos'][$cont]['Impuestos']['Traslados'][0]['Impuesto'] = '002';
            $datos['conceptos'][$cont]['Impuestos']['Traslados'][0]['TipoFactor'] = 'Tasa';
            $datos['conceptos'][$cont]['Impuestos']['Traslados'][0]['TasaOCuota'] = '0.160000';
            $datos['conceptos'][$cont]['Impuestos']['Traslados'][0]['Importe'] = ($row[0] * $row[2]) * 0.160000;

		}

// Se agregan los Impuestos
$datos['impuestos']['translados'][0]['impuesto'] = '002';
$datos['impuestos']['translados'][0]['tasa'] = '0.160000';
$datos['impuestos']['translados'][0]['importe'] =  $total_iva;
$datos['impuestos']['translados'][0]['TipoFactor'] = 'Tasa';


$datos['impuestos']['TotalImpuestosTrasladados'] =  $total_iva;

//Se agregan totales
$datos['factura']['subtotal'] = $total - $total_iva;
$datos['factura']['total'] = $total;

// Se ejecuta el SDK
$res = mf_genera_cfdi($datos);


///////////    MOSTRAR RESULTADOS DEL ARRAY $res   ///////////
/*echo "<pre>";
print_r($datos);
echo "</pre>";*/

    if ($res["codigo_mf_texto"] == 0)
    {
        
        echo "<h1>Respuesta Generar XML y Timbrado</h1>";
        foreach ($res AS $variable => $valor) {
            $valor = htmlentities($valor);
            $valor = str_replace('&lt;br/&gt;', '<br/>', $valor);
            echo "<b>[$variable]=</b>$valor<hr>";
        }
        
        //Generar pdf
        $datosHTML['RESPUESTA_UTF8'] = "SI";
        //MODULO MULTIFACTURAS : CONVIERTE UN XML CFDI A HTML
        $datosHTML['modulo']="cfdi2html";                                                //NOMBRE MODULO
        $datosHTML['rutaxml']='SDK2/timbrados/'.$folio.'.xml';    //RUTA DEL XML CFDI
        $datosHTML['titulo']='<b>'. strtoupper ($cfdi_nombre).'</b>';                                          //TITULO DE FACTURA
        $datosHTML['tipo']="FACTURA";                                                    //TIPO DE FACTURA VENTA,NOMINA,ARRENDAMIENTO, ETC
        $datosHTML['path_logo']="../images/logolola.jpg";                          //RUTA DE LOGOTIPO DE FACTURA
        $datosHTML['notas']="";                                       //NOTA IMPRESA EN FACTURA
        $datosHTML['color_marco']="#013ADF";                                             //COLOR DEL MARCO DE LA FACTURA
        $datosHTML['color_marco_texto']="#FFFFF";                                       //COLOR DEL TEXTO DEL MARCO DE LA FACTURA
        $datosHTML['color_texto']="#0174DF";                                             //COLOR DEL TEXTO EN GENERAL
        $datosHTML['fuente_texto']="arial";                                          //FUENTE DEL TEXTO EN GENERAL
        
        $res = mf_ejecuta_modulo($datosHTML);                                  //FUNCION QUE CARGA EL MODULO cfdi2html
        $HTML=$res['html'];                                     //HTML DEL XML           //RESPUESTA DE LA FUNCION CARGAR MODULO

        //////////////////////////////////////////////////////////////////////////////
        //CONVERTIR EL HTML DEL XML CFDI A PDF
        $datosPDF['PAC']['usuario'] = "DEMO700101XXX";
        $datosPDF['PAC']['pass'] = "DEMO700101XXX";
        $datosPDF['PAC']['produccion'] = "NO";
        $datosPDF['modulo']="html2pdf";                                                   //NOMBRE MODULO
        $datosPDF['html']="$HTML";                                                        // HTML DE XML CFDI A CONVERTIR A PDF
        $datosPDF['archivo_html']="";                                                     // OPCION SI SE TIENE UN ARCHIVO .HTML       
        $datosPDF['archivo_pdf']='SDK2/timbrados/'.$folio.'.pdf';
        //$datosPDF['archivo_pdf']="RUTA DONDE SE CREARA EL PDF/nombrearhivo.pdf";          //RUTA DONDE SE GUARDARA EL PDF

        $res = mf_ejecuta_modulo($datosPDF);                                    //RESPUESTA DE LA FUNCION CARGAR MODULO  
        //$res = ___html2pdf($datosPDF);                                    //RESPUESTA DE LA FUNCION CARGAR MODULO

        echo "<pre>";
        print_r($res);
        echo "</pre>";

        echo '<script>location.href = "SDK2/timbrados/'.$folio.'.pdf"</script>';
    }