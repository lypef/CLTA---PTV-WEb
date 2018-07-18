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
        
