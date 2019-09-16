<?php
    include 'func/header.php';
?>
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.2.620/styles/kendo.common.min.css"/>
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.2.620/styles/kendo.rtl.min.css"/>
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.2.620/styles/kendo.silver.min.css"/>
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.2.620/styles/kendo.mobile.all.min.css"/>

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="/kendo/kendo.all.min.js"></script>
  
    <div class="section-title-2 text-uppercase mb-40 text-center">
        <h4>SELECCIONE UNA FECHA ESPECIFICA</h4>
    </div>
    <form action="finance.php">

    <div class="row">
            
        <div class="col-md-3 text-right">
            <label>Fecha de inicio</label><br>
            <input id="datepicker0" name="inicio">
        </div>

        <div class="col-md-3 text-center">
            <label>Fecha de finalizacion</label><br>
            <input id="datepicker1" name="finaliza">
        </div>

        <div class="col-md-3 text-center">
            <label>Buscar por folio</label><br>
            <input id="folio" name="folio" value="<?php echo $_GET["folio"] ?>">
        </div>

        <div class="col-md-3 text-left">
            <button type="submit" style="
            background-color: #58ACFA;
            border: none;
            color: white;
            padding: 18px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 20px;
            margin: 4px 2px;
            cursor: pointer;
            ">Consultar</button>
            
            <a href="report_pdf_sales.php?inicio=<?php echo $_GET["inicio"]?>&finaliza=<?php echo $_GET["finaliza"]?>&folio=<?php echo $_GET["folio"]?>&usuario=<?php echo $_GET["usuario"]?>&sucursal=<?php echo $_GET["sucursal"]?>"style="
            background-color: #58ACFA;
            border: none;
            color: white;
            padding: 18px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 20px;
            margin: 4px 2px;
            cursor: pointer;
            ">IMP. PDF</a>
            
        </div>
        <hr>
    <div>
        <div class="col-md-6 text-center">
            <label>Seleccione usuario</label><br>
            <select id="usuario" name="usuario">
                    <?php echo Select_Usuarios() ?>
            </select>                                       
        </div>

        <div class="col-md-6 text-left">
            <label>Selecione sucursal</label><br>
            <select id="sucursal" name="sucursal">
                    <?php echo Select_sucursales() ?>
            </select>                                       
        </div>
    </div>
    </form>
    </div>
    <div class="section-title-2 text-uppercase mb-40 text-center">
        <br>
        <h4>REPORTE DE VENTAS <?php if ($_GET["inicio"]) {echo ': DESDE:'.$_GET["inicio"]; } if ($_GET["finaliza"]) {echo ' | HASTA:'.$_GET["finaliza"]; } ?></h4>
    </div>

<script id="cell-template" type="text/x-kendo-template">
    <span class="#= isInArray(data.date, data.dates) ? 'party' : '' #">#= data.value #</span>
</script>

<script>
  var fecha = new Date();

  $("#datepicker0").kendoDatePicker({
    value: new Date(),
    month: {
      content: $("#cell-template").html()
    }
  });

  $("#datepicker1").kendoDatePicker({
    value: new Date(),
    month: {
      content: $("#cell-template").html()
    },
    dates: [
      new Date(2000, 10, 10),
      new Date(2000, 10, 30)
    ] //can manipulate month template depending on this array.
  });

  function isInArray(date, dates) {
    for(var idx = 0, length = dates.length; idx < length; idx++) {
      var d = dates[idx];
      if (date.getFullYear() == d.getFullYear() &&
          date.getMonth() == d.getMonth() &&
          date.getDate() == d.getDate()) {
        return true;
      }
    }

    return false;
  }

    if (getUrlVars()["usuario"])
    {
        document.getElementById("usuario").value = getUrlVars()["usuario"];
    }

    if (getUrlVars()["sucursal"])
    {
        document.getElementById("sucursal").value = getUrlVars()["sucursal"];
    }
</script>

<!-- Start page content -->
        <section id="page-content" class="page-wrapper">
            <!-- Start Product List -->
            <div class="product-list-tab">
                <div class="container" style="width:99%; !important">
                    <div class="row">
                        <div class="product-list tab-content">
                            <div role="tabpanel" class="tab-pane fade in active" id="home">
                                <?php 
                                    echo table_finance($_GET["inicio"],$_GET["finaliza"],$_GET["folio"], $_GET["usuario"], $_GET["sucursal"]);
                                ?>
                                <center>
                                <a href="report_xls_sales.php?inicio=<?php echo $_GET["inicio"]?>&finaliza=<?php echo $_GET["finaliza"]?>&folio=<?php echo $_GET["folio"]?>&usuario=<?php echo $_GET["usuario"]?>&sucursal=<?php echo $_GET["sucursal"]?>"style="
                                background-color: #58ACFA;
                                border: none;
                                color: white;
                                padding: 18px 10px;
                                text-align: center;
                                text-decoration: none;
                                display: inline-block;
                                font-size: 20px;
                                margin: 4px 2px;
                                cursor: pointer;
                                ">Generar xls</a>
                                </center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End page content -->
<?php
    include 'func/footer.php';
    echo sales_delete_finance();
?>
        
