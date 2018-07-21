<?php
    include 'func/header.php';
    if ($_SESSION['client_add'] == 0)
    {
        echo '<script>location.href = "products.php?pagina=1"</script>';
    }
?>
<!--Contenido-->
<!-- Start page content -->
<div class="col-md-12">
  <div class="message-box box-shadow white-bg">
      <form id="contact-form" action="func/client_add.php" method="post" autocomplete="off">
          <div class="row">
              <div class="col-md-12">
                  <div class="section-title text-uppercase mb-40">
                      <h4>Alta cliente</h4>
                  </div>
              </div>
              <div class="col-md-6">
                <label>Ingrese nombre de cliente<span class="required">*</span></label>
                <input type="text" name="nombre" id="nombre" placeholder="Nombre o razon social" required>
              </div>
              <div class="col-md-6">
                <label>Ingrese direccion de cliente</label>
                <input type="text" name="direccion" id="direccion" placeholder="Direccion fisica de cliente">
              </div>
              
              <div class="col-md-6">
                <label>Ingrese telefono. (Puede ser mas de uno)</label>
                <input type="text" name="telefono" id="telefono" placeholder="Telefono de contacto">
            </div>

            <div class="col-md-6">
                <label>Ingrese porcentaje de descuento<span class="required">*</span></label>
                <input type="number" name="p_descuento" id="p_descuento" placeholder="Ingrese el porcentaje para descuento en compras" min="0" max="100" value="0" required>
            </div>

            <div class="col-md-4">
                <label>Ingrese rfc para emitir factura</label>
                <input type="text" name="rfc" id="rfc" placeholder="Rfc de cliente o empresa">
            </div>

            <div class="col-md-4">
                <label>Ingrese razon social</label>
                <input type="text" name="r_social" id="r_social" placeholder="Razon social de cliente o empresa">
            </div>

            <div class="col-md-4">
                <label>Ingrese correo electronico</label>
                <input type="email" name="correo" id="correo" placeholder="Email de cliente o empresa">
            </div>

            <div class="country-select shop-select col-md-12">
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
        body +="<strong>ERROR!</strong> Verifique informacion de cliente";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }
    if (getUrlVars()["nombre"])
    {
        document.getElementById("nombre").value = getUrlVars()["nombre"];    
    }
    if (getUrlVars()["direccion"])
    {
        document.getElementById("direccion").value = getUrlVars()["direccion"];    
    }
    if (getUrlVars()["telefono"])
    {
        document.getElementById("telefono").value = getUrlVars()["telefono"];    
    }
    if (getUrlVars()["p_descuento"])
    {
        document.getElementById("p_descuento").value = getUrlVars()["p_descuento"];    
    }
    if (getUrlVars()["r_social"])
    {
        document.getElementById("r_social").value = getUrlVars()["r_social"];    
    }
    if (getUrlVars()["rfc"])
    {
        document.getElementById("rfc").value = getUrlVars()["rfc"];    
    }
    if (getUrlVars()["correo"])
    {
        document.getElementById("correo").value = getUrlVars()["correo"];    
    }
</script>
<!--Finaliza contenido-->
<?php
    include 'func/footer.php'
?>
