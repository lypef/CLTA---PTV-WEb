<?php
    include 'func/header.php';
?>
<div class="col-md-12">
    <div class="table-responsive compare-wraper mt-30">
        <table class="cart table">
            <thead>
                <tr>
                    <th class="table-head th-name uppercase">NOMBRE CLIENTE</th>
                    <th class="table-head item-nam">DIRECCION</th>
                    <th class="table-head item-nam">OPCIONES</th>
                </tr>
            </thead>
            <tbody>
                <?php echo table_clientes(); ?>
            </tbody>
        </table>
    </div>
</div>  
<script>
    if (getUrlVars()["delete_departament"])
    {
        var body = "<div class='alert alert-success alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>ELIMINADO!</strong> El departamento y sus productos fueron eliminado con exito.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }
    
    if (getUrlVars()["update_departament"])
    {
        var body = "<div class='alert alert-success alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>ACTUALIZADO!</strong> El departamento se actualizo con exito.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }
    
    if (getUrlVars()["noupdate_departament"])
    {
        var body = "<div class='alert alert-danger alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>Error!</strong> El departamento no se actualizo.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }

    if (getUrlVars()["nodelete_departament"])
    {
        var body = "<div class='alert alert-danger alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>ERROR!</strong> El departamento fue eliminado.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }
</script>
<?php
    include 'func/footer.php';
    echo table_ClientesModal();
?>
        
