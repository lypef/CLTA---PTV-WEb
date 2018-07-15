<?php
    include 'db.php';
    db_sessionValidarNO();

    $a = 'desc'. $_POST['id'];
    echo $_POST[$a];
?>