<?php
    include 'func/header.php';
?>
<div class="col-md-12">
    <div class="section-title-2 text-uppercase mb-40 text-center">
            <h4>SELECCIONE CLIENTE</h4>
    </div>
    <?php 
        if ($_GET["search"])
        {
            echo create_sale_SelectClientSearch($_GET["search"]);
        }else
        {
            echo create_sale_SelectClient($_GET["pagina"]);
        }
    ?>
</div>  
<?php
    include 'func/footer.php';
    if ($_GET["search"])
    {
        echo select_client_sale_modal_search($_GET["search"]);
    }else
    {
        echo select_client_sale_modal();
    }
?>
        
