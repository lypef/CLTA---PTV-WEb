<?php
    include 'func/header.php';
    CompareFolioOpen($_GET["folio"]);
?>

<?php 
    if ($_GET["folio"])
    {
        echo table_sale_products_finaly_cotizacion($_GET["folio"]); 
    }else{
        echo '<script>location.href = "create_sale.php?pagina=1"</script>';
    }
?>

<!-- End Of Wishlist Area -->
<script>
if (getUrlVars()["delete"])
{
    var body = "<div class='alert alert-success alert-dismissible show' role='alert'>";
    body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
    body +="<span aria-hidden='true'>&times;</span>";
    body +="</button>";
    body +="<strong>REMOVIDO!</strong> Producto REMOVIDO con exito.";
    body +="</div>";
    document.getElementById("message").innerHTML = body;
}
if (getUrlVars()["nodelete"])
{
    var body = "<div class='alert alert-danger alert-dismissible show' role='alert'>";
    body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
    body +="<span aria-hidden='true'>&times;</span>";
    body +="</button>";
    body +="<strong>ERROR!</strong> No fue posible remover el producto, intente de nuevo.";
    body +="</div>";
    document.getElementById("message").innerHTML = body;
}
if (getUrlVars()["update"])
{
    var body = "<div class='alert alert-success alert-dismissible show' role='alert'>";
    body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
    body +="<span aria-hidden='true'>&times;</span>";
    body +="</button>";
    body +="<strong>ACTUALIZADO!</strong> Unidades actualizadas.";
    body +="</div>";
    document.getElementById("message").innerHTML = body;
}
if (getUrlVars()["noupdate"])
{
    var body = "<div class='alert alert-danger alert-dismissible show' role='alert'>";
    body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
    body +="<span aria-hidden='true'>&times;</span>";
    body +="</button>";
    body +="<strong>ERROR!</strong> No fue posible actualizar las unidades, intente de nuevo.";
    body +="</div>";
    document.getElementById("message").innerHTML = body;
}
if (getUrlVars()["nostock"])
{
    var body = "<div class='alert alert-danger alert-dismissible show' role='alert'>";
    body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
    body +="<span aria-hidden='true'>&times;</span>";
    body +="</button>";
    body +="<strong>ERROR!</strong> No hay existencias.";
    body +="</div>";
    document.getElementById("message").innerHTML = body;
}
</script>
<?php
    include 'func/footer.php';
    if ($_GET["folio"])
    {
        echo table_SalesModal($_GET["folio"]);
    }
?>
        
