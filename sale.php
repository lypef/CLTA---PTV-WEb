<?php
    include 'func/header.php'
?>
<!-- Start page content -->
<section id="page-content" class="page-wrapper">
    <!-- Start Product List -->
    <div class="product-list-tab">
        <div class="container">
            <div class="row">
                <div class="product-list tab-content">
                    <div role="tabpanel" class="tab-pane fade in active" id="home">
                        <?php 
                            if ($_GET["search"])
                            {
                                echo _getProducts_saleSearch($_GET["search"], $_GET["folio"]);
                            }
                            else
                            {
                                echo _getProducts_sale($_GET["pagina"], $_GET["folio"]);
                            }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End page content -->
<script >
    if (getUrlVars()["update_producto"])
    {
        var body = "<div class='alert alert-success alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>ACTUALIZADO!</strong> Producto ACTUALIZADO con exito.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }
    if (getUrlVars()["noupdate_producto"])
    {
        var body = "<div class='alert alert-danger alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>ERROR!</strong> Se encontraron errores al actualizar el producto.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }
    if (getUrlVars()["nostock"])
    {
        var body = "<div class='alert alert-danger alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>ERROR!</strong> No tenemos stock";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }
</script>
<?php
    include 'func/footer.php';
    
    if ($_GET["search"])
    {
        echo _getProductsModal_sale_search($_GET["search"], $_GET["folio"]);
    }
    else
    {
        echo _getProductsModal_sale($_GET["pagina"], $_GET["folio"]);
    }
?>
        

<!--Agragar producto a venta-->
<div class="modal fade" id="add_car_generic" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle"></h5>
            </button>
            </div>
            <div class="modal-body">
            <div class="row">
        <div class="col-md-12">
        <div class="col-md-12">
            <div class="section-title-2 text-uppercase mb-40 text-center">
                <h4>AGREGAR PRODUCTO GENERICO</h4>
            </div>
        </div>
        
        <form action="func/producst_add_sale_generic.php" autocomplete="off" method="post">
            <input type="hidden" id="url" name="url" value="<?php echo $_SERVER['REQUEST_URI'] 
            ?>">
            <input type="hidden" id="folio" name="folio" value="<?php echo $_GET["folio"] ?>">
            <input type="hidden" id="hijo" name="hijo" value="0">
            
            
            <div class="col-md-6">
                <label>Costo del producto</label>
                <input type="text" name="costo" id="costo" placeholder="Costo del producto" required>
            </div>

            <div class="col-md-6">
                <label>Numero de Unidades<</label>
                <input type="number" name="unidades" id="unidades" placeholder="Ingrese las unidades" required>
            </div>

            <div class="col-md-12">
                <br><label>Nombre del producto</label>
                <input type="text" name="p_generic" id="p_generic" placeholder="Ingrese las unidades" required>
            </div>
        </div>
        </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
            <button type="submit" class="btn btn-primary">Agregar</button>
            </form>
        </div>
</div>
</div>
</div>