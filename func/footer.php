</div>
                </div>
            </div>
            <!-- End of Banner Area --> 
        </section>
        <!-- End page content -->
        <!-- Start footer area -->
        <footer id="footer" class="footer-area">
            <div class="footer-top-area gray-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="footer-widget">
                                <div class="footer-widget-img pb-30">
                                    <a href="#">
                                        <img src="images/logo/logo-2.png" alt="">
                                    </a>
                                </div>
                                <ul class="toggle-footer text-white">
                                    <li class="mb-30 pl-45">
                                        <i class="zmdi zmdi-pin"></i>
                                        <p><?php echo $_SESSION['empresa_direccion'];?></p>
                                    </li>
                                    <li class="mb-30 pl-45">
                                        <i class="zmdi zmdi-email"></i>
                                        <p><?php echo $_SESSION['empresa_correo'];?></p>
                                    </li>
                                    <li class="pl-45">
                                        <i class="zmdi zmdi-phone"></i>
                                        <p><?php echo $_SESSION['empresa_telefono'];?></p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="text-white footer-about-us">
                                <h4 class="pb-40 m-0 text-uppercase">Mision</h4>
                                <p><?php echo $_SESSION['empresa_mision'];?></p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="text-white footer-about-us">
                                <h4 class="pb-40 m-0 text-uppercase">Vision</h4>
                                <p><?php echo $_SESSION['empresa_vision'];?></p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="text-white footer-about-us">
                                <h4 class="pb-40 m-0 text-uppercase">Contacto</h4>
                                <p><?php echo $_SESSION['empresa_contacto'];?></p>
                                <ul class="footer-social-icon">
                                    <li><a target="_blank" href="<?php echo $_SESSION['empresa_fb'];?>"><i class="zmdi zmdi-facebook"></i></a></li>
                                    <li><a target="_blank" href="<?php echo $_SESSION['empresa_yt'];?>"><i class="zmdi zmdi-instagram"></i></a></li>
                                    <li><a target="_blank" href="<?php echo $_SESSION['empresa_tw'];?>"><i class="zmdi zmdi-twitter"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom black-bg ptb-15">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="copyright text-white">
                                <p>Desarrollado por <a target="_blank" href="http://www.cyberchoapas.com"> CLTA DESARROLLO & DISTRIBUCION DE SOFTWARE</a>.</p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="footer-img">
                                <img src="images/payment.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End footer area -->
    </div>
    <!-- Body main wrapper end -->

    <!-- Placed js at the end of the document so the pages load faster -->

    <!-- jquery latest version -->
    <script src="js/vendor/jquery-3.1.1.min.js"></script>
    <!-- Bootstrap framework js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Particles js -->
    <script src="js/particles.js"></script>
    <!-- All js plugins included in this file. -->
    <script src="js/plugins.js"></script>
    <!-- Main js file that contents all jQuery plugins activation. -->
    <script src="js/main.js"></script>
    
    <!-- Ventanas modal-->
    <div class="modal fade" id="Empresa_datos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">ACTUALIZAR DATOS DE: <?php echo $_SESSION['empresa_nombre'];?></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
        <form action="../func/updateEmpresaDatos.php" autocomplete="off" method="post">
        <div class="row">

            <input type="hidden" name="url" id="url" value="<?php echo $_SERVER['REQUEST_URI']
            ;?>">

            <div class="col-md-12">
            <label>Nombre</label>
            <input type="text" name="nombre" id="nombre" value="<?php echo $_SESSION['empresa_nombre'];?>">
            </div>

            <div class="col-md-12">
            <label>Nombre corto</label>
            <input type="text" name="nombre_corto" id="nombre_corto" value="<?php echo $_SESSION['empresa_nombre_corto'];?>">
            </div>

            <div class="col-md-12">
            <label>Direccion</label>
            <input type="text" name="direccion" id="direccion" value="<?php echo $_SESSION['empresa_direccion'];?>" >
            </div>

            <div class="col-md-12">
            <label>Correo</label>
            <input type="text" name="correo" id="correo" value="<?php echo $_SESSION['empresa_correo'];?>">
            </div>

            <div class="col-md-12">
            <label>Telefono</label>
            <input type="text" name="telefono" id="telefono" value="<?php echo $_SESSION['empresa_telefono'];?>">
            </div>

            <div class="col-md-12">
            <label>Url Facebook</label>
            <input type="text" name="facebook" id="facebook" value="<?php echo $_SESSION['empresa_fb'];?>">
            </div>

            <div class="col-md-12">
            <label>Url twitter</label>
            <input type="text" name="twitter" id="twitter" value="<?php echo $_SESSION['empresa_tw'];?>">
            </div>

            <div class="col-md-12">
            <label>Url Youtube</label>
            <input type="text" name="youtube" id="youtube" value="<?php echo $_SESSION['empresa_yt'];?>" >
            </div>

        </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
            <button type="submit" class="btn btn-primary">Actualizar</button>
            </form>
        </div>
        </div>
    </div>
    </div>
    <!--Mision-->
    <div class="modal fade" id="Empresa_Mision" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">ACTUALIZAR MISION DE: <?php echo $_SESSION['empresa_nombre'];?></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
        <form action="../func/updateEmpresaDatos_mision.php" autocomplete="off" method="post">
            <input type="hidden" name="url" id="url" value="<?php echo $_SERVER['REQUEST_URI']
            ;?>">
            <textarea name="mision_new" id="mision_new" cols="30" rows="8"><?php echo $_SESSION['empresa_mision'];?></textarea>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
            <button type="submit" class="btn btn-primary">Actualizar</button>
            </form>
        </div>
        </div>
    </div>
    </div>
    <!--Vision-->
    <div class="modal fade" id="Empresa_Vision" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">ACTUALIZAR VISION DE: <?php echo $_SESSION['empresa_nombre'];?></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
        <form action="../func/updateEmpresaDatos_vision.php" autocomplete="off" method="post">
            <input type="hidden" name="url" id="url" value="<?php echo $_SERVER['REQUEST_URI']
            ;?>">
            <textarea name="vision_new" id="vision_new" cols="30" rows="8"><?php echo $_SESSION['empresa_vision'];?></textarea>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
            <button type="sumbit" class="btn btn-primary">Actualizar</button>
            </form>
        </div>
        </div>
    </div>
    </div>
    <!--Contacto-->
    <div class="modal fade" id="Empresa_Contacto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">ACTUALIZAR DATOS DE CONTACTO: <?php echo $_SESSION['empresa_nombre'];?></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
        <form action="../func/updateEmpresaDatos_contacto.php" autocomplete="off" method="post">
            <input type="hidden" name="url" id="url" value="<?php echo $_SERVER['REQUEST_URI']
            ;?>">
            <textarea name="contacto_new" id="contacto_new" cols="30" rows="8"><?php echo $_SESSION['empresa_contacto'];?></textarea>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
            <button type="submit" class="btn btn-primary">Actualizar</button>
            </form>
        </div>
        </div>
    </div>
    </div>
    <!--add departamento-->
    <div class="modal fade" id="departament_add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Nuevo departamento</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
        <form action="../func/departamento_add.php" autocomplete="off" method="post">
        
        <div class="row">
            <input type="hidden" name="url" id="url" value="<?php echo $_SERVER['REQUEST_URI']
            ;?>">

            <div class="col-md-12">
            <label>Nombre departamento</label>
            <input type="text" name="departamento_add_nombre" id="departamento_add_nombre" placeholder="Ingrese nombre">
            </div>
            
            <div class="col-md-12">
            <br>
            <label>Descripcion departamento</label>
            <textarea name="departamento_add_descripcion" id="departamento_add_descripcion" cols="30" rows="4"></textarea>
            </div>

        </div>

        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
            <button type="sumbit" class="btn btn-primary">Actualizar</button>
            </form>
        </div>
        </div>
    </div>
    </div> 
    <!--add almacen-->
    <div class="modal fade" id="almacen_add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Nuevo almacen</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
        <form action="../func/almacen_add.php" autocomplete="off" method="post">
        
        <div class="row">
            <input type="hidden" name="url" id="url" value="<?php echo $_SERVER['REQUEST_URI']
            ;?>">

            <div class="col-md-12">
            <label>Nombre</label>
            <input type="text" name="almacen_nombre" id="almacen_nombre" placeholder="Ingrese nombre">
            </div>
            
            <div class="col-md-12">
            <br><label>Ubicacion</label>
            <input type="text" name="almacen_ubicacion" id="almacen_ubicacion" placeholder="Ingrese ubicacion">
            </div>

            <div class="col-md-12">
            <br><label>Telefono</label>
            <input type="text" name="almacen_telefono" id="almacen_telefono" placeholder="Ingrese telefono">
            </div>

        </div>

        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
            <button type="sumbit" class="btn btn-primary">Actualizar</button>
            </form>
        </div>
        </div>
    </div>
    </div> 
    <!-- Finaliza Ventanas modal-->
    <script>
    if (getUrlVars()["error_update_empresa"])
    {
        var body = "<div class='alert alert-danger alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>ERROR!</strong> No se actualizaron los datos de la empresa.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }

    if (getUrlVars()["add_department"])
    {
        var body = "<div class='alert alert-success alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>HECHO!</strong> Departamento agregado con exito.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }

    if (getUrlVars()["noadd_department"])
    {
        var body = "<div class='alert alert-danger alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>Error!</strong> El departamento no se agrego.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }
    if (getUrlVars()["add_almacen"])
    {
        var body = "<div class='alert alert-success alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>HECHO!</strong> Almacen agregado con exito.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }

    if (getUrlVars()["noadd_almacen"])
    {
        var body = "<div class='alert alert-danger alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>Error!</strong> El almacen no se agrego.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }
    </script>
</body>

</html>
