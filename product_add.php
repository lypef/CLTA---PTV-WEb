<?php
    include 'func/header.php'
?>
<!--Contenido-->
<!-- Start page content -->
<div class="col-md-12">
  <div class="message-box box-shadow white-bg">
      <form id="contact-form" action="mail.php" method="post">
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
                <input type="text" name="Proveedor" placeholder="Precio al publico">
            </div>

            <div class="col-md-6">
                <label>Precio oferta<span class="required">*</span></label>
                <input type="text" name="Proveedor" placeholder="Precio con oferta al publico">
            </div>

            <div class="col-md-6">
                <label>Unidades existentes<span class="required">*</span></label>
                <input type="text" name="Proveedor" placeholder="Stock">
            </div>

            <div class="col-md-6">
                <label>Tiempo de entrega</label>
                <input type="text" name="Proveedor" placeholder="1 Dia habil">
            </div>

              <div class="col-md-12">
              <label>Ingrese  una descripcion o caracteristicas del producto</label>
              <textarea placeholder="..." name="descripcion" class="custom-textarea"></textarea>
              </div>

              <div class="country-select shop-select col-md-6">
                <label> Seleccione Almacen <span class="required">*</span></label>
                <select>
                    <option value="volvo">Bangladesh</option>
                    <option value="saab">Algeria</option>
                    <option value="mercedes">Afghanistan</option>
                    <option value="audi">Ghana</option>
                    <option value="audi2">Albania</option>
                    <option value="audi3">Bahrain</option>
                    <option value="audi4">Colombia</option>
                    <option value="audi5">Dominican Republic</option>
                </select>                                       
            </div>
            <div class="country-select shop-select col-md-6">
                <label> Seleccione Departamento <span class="required">*</span></label>
                <select>
                    <option value="volvo">Bangladesh</option>
                    <option value="saab">Algeria</option>
                    <option value="mercedes">Afghanistan</option>
                    <option value="audi">Ghana</option>
                    <option value="audi2">Albania</option>
                    <option value="audi3">Bahrain</option>
                    <option value="audi4">Colombia</option>
                    <option value="audi5">Dominican Republic</option>
                </select>                                       
            </div>
            
            <div class="col-md-12">
                <br>
                <label>Especifique ubicacion exacta en almacen</label>
                <textarea placeholder="Anaquel b-15" name="ubicacion" class="custom-textarea"></textarea>
            </div>
            <div class="col-md-6">
                <input type="text" name="marca" placeholder="Marca">
            </div>
            <div class="col-md-6">
                <input type="text" name="Proveedor" placeholder="Proveedor">
            </div>


            <div class="country-select shop-select col-md-6">
                <label>Imagen 1 <span class="required">*</span></label>
                <input type="file" name="imagen1" accept="image/jpeg,image/jpg" >
            </div>

            <div class="country-select shop-select col-md-6">
                <label>Imagen 1 <span class="required">*</span></label>
                <input type="file" name="imagen1" accept="image/jpeg,image/jpg" >
            </div>

            <div class="country-select shop-select col-md-6">
                <label>Imagen 1 <span class="required">*</span></label>
                <input type="file" name="imagen1" accept="image/jpeg,image/jpg" >
            </div>

            <div class="country-select shop-select col-md-6">
                <label>Imagen 1 <span class="required">*</span></label>
                <input type="file" name="imagen1" accept="image/jpeg,image/jpg" >
            </div>

            <div class="country-select shop-select col-md-6">
                <button class="submit-btn mt-20" type="submit">Guardar</button>
            </div>


          </div>
      </form>
  </div>
</div>
<!--Finaliza contenido-->
<?php
    include 'func/footer.php'
?>
