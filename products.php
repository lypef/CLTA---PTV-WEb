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
                                <?php echo _getProducts($_GET["pagina"]) ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Start Shop Full Grid View -->
            <div class="shop-view-area pb-90">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-10 hidden-xs">
                            <div class="shop-pagination">
                                <ul>
                                    <li><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>

                                    <li><a href="#"><i class="zmdi zmdi-chevron-right"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Of Shop Full Grid View -->

        </section>
        <!-- End page content -->
<?php
    include 'func/footer.php';
    echo _getProductsModal('SELECT p.nombre, p.stock, p.oferta, p.precio_normal, p.precio_oferta, p.foto0, p.foto1, p.foto2, p.foto3, p.id, p.descripcion, p.`tiempo de entrega`, p.`no. De parte`, a.nombre, d.nombre, p.marca, p.loc_almacen FROM productos p, almacen a, departamentos d where p.almacen = a.id and p.departamento = d.id
    ');
?>
        
