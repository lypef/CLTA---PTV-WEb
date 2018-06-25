<?php
    include 'func/header.php'
?>
<!--Contenido-->
<!-- Start page content -->
<div class="col-md-12">
  <div class="message-box box-shadow white-bg">
      <form id="contact-form" action="func/product_add.php" method="post" enctype="multipart/form-data">
          <div class="row">
              <div class="col-md-12">
                  <div class="section-title text-uppercase mb-40">
                      <h4>Agregar producto</h4>
                  </div>
              </div>
              <div class="col-md-6">
                <label>Numero de parte</label>
                <input type="text" name="parte" placeholder="AEF594-S">
              </div>
              <div class="col-md-6">
                <label>Nombre del producto</label>
                <input type="text" name="name" placeholder="Nombre producto">
              </div>
              
              <div class="col-md-6">
                <label>Precio normal<span class="required">*</span></label>
                <input type="text" name="precio" placeholder="Precio al publico">
            </div>

            <div class="col-md-6">
                <label>Precio oferta<span class="required">*</span></label>
                <input type="text" name="p_oferta" placeholder="Precio con oferta al publico">
            </div>

            <div class="col-md-6">
                <label>Unidades existentes<span class="required">*</span></label>
                <input type="text" name="stock" placeholder="Stock">
            </div>

            <div class="col-md-6">
                <label>Tiempo de entrega</label>
                <input type="text" name="t_entrega" placeholder="1 Dia habil">
            </div>

              <div class="col-md-12">
              <label>Ingrese  una descripcion o caracteristicas del producto</label>
              <textarea placeholder="..." name="descripcion" class="custom-textarea"></textarea>
              </div>

              <div class="country-select shop-select col-md-6">
                <label> Seleccione Almacen <span class="required">*</span></label>
                <select id="almacen" name="almacen">
                    <?php echo Select_Almacen() ?>
                </select>                                       
            </div>
            <div class="country-select shop-select col-md-6">
                <label> Seleccione Departamento <span class="required">*</span></label>
                <select id="departamento" name = "departamento">
                    <?php echo Select_Departamento() ?>
                </select>                                       
            </div>
            
            <div class="col-md-12">
                <br>
                <label>Especifique ubicacion exacta en almacen</label>
                <textarea placeholder="Anaquel b-15" name="ubicacion" class="custom-textarea"></textarea>
            </div>
            <div class="col-md-6">
                <br><label>Ingres la marca del producto</label>
                <input type="text" name="marca" placeholder="Marca">
            </div>
            <div class="col-md-6">
                <br><label>Ingrese proveedor</label>
                <input type="text" name="proveedor" placeholder="Proveedor">
            </div>


            <div class="country-select shop-select col-md-6">
                <label>Imagen 1 <span class="required">*</span></label>
                <input type="file" name="imagen0" id="imagen0" accept="image/jpeg,image/jpg" >
            </div>

            <div class="country-select shop-select col-md-6">
                <label>Imagen 2 <span class="required">*</span></label>
                <input type="file" name="imagen1" accept="image/jpeg,image/jpg" >
            </div>

            <div class="country-select shop-select col-md-6">
                <label>Imagen 3 <span class="required">*</span></label>
                <input type="file" name="imagen2" accept="image/jpeg,image/jpg" >
            </div>

            <div class="country-select shop-select col-md-6">
                <label>Imagen 4 <span class="required">*</span></label>
                <input type="file" name="imagen3" accept="image/jpeg,image/jpg" >
            </div>

            <div class="country-select shop-select col-md-6">
                <label> Usar precio de oferta ? <span class="required">*</span></label>
                <select id="use_oferta" name = "use_oferta">
                    <option value='si'>Si usar</option>
                    <option value='no' selected>No usar</option>
                </select>                                       
            </div>

            <div class="country-select shop-select col-md-6">
                <button class="submit-btn mt-20" type="submit">Guardar</button>
            </div>


          </div>
      </form>
  </div>
</div>
<script>
    if (getUrlVars()["add"])
    {
        var body = "<div class='alert alert-success alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>AGREGADO!</strong> Producto agregado con exito.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }
    if (getUrlVars()["noadd"])
    {
        var body = "<div class='alert alert-danger alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>ERROR!</strong> Se encontraron errores en el alta del producto.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }

    if (getUrlVars()["price_error"])
    {
        var body = "<div class='alert alert-danger alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>ERROR!</strong> Verifique sus precios.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }
</script>
<!--Finaliza contenido-->
<?php
    include 'func/footer.php'
?>
