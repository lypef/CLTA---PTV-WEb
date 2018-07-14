<?php
    include 'func/header.php';
?>
<div class="col-md-12">
    <div id="areaImprimir">
        
    <div class="section-title-2 text-uppercase mb-40 text-center">
            <h4>ORDEN DE COMPRA: <?php echo $_SESSION['empresa_nombre']; echo ' | ' . date("d-m-Y"); ?></h4>
    </div>
        
        <?php  echo g_orden_compra(); ?>
    </div>
</div>  

<div align="right">
    <a class="button large mb-20" onclick="printDiv('areaImprimir')"><span>Imprimir</span> </a>
</div>


<script>
function printDiv(nombreDiv) {
     var contenido= document.getElementById(nombreDiv).innerHTML;
     var contenidoOriginal= document.body.innerHTML;

     document.body.innerHTML = contenido;

     window.print();

     document.body.innerHTML = contenidoOriginal;
}
</script>
<?php
    include 'func/footer.php';
    echo g_compra_modal();
?>
        
