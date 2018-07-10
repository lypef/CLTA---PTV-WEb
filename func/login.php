<?php
//error_reporting(0);
session_start();
include 'db.php';
$con = db_conectar();

if ($con->connect_errno)
{
    echo '<script>location.href = "?db_noconect=true"</script>';
    exit();
}

if ($_POST['username'] == null || $_POST['password'] == null)
{
  echo '<script>location.href = "?db_empty=true"</script>';
}
else
{
    $user = mysqli_real_escape_string($con, $_POST['username']);
    $pass = mysqli_real_escape_string($con, md5($_POST['password']));
    $consulta = mysqli_query($con, "SELECT * FROM users WHERE username = '$user' AND password = '$pass'");
    if (mysqli_num_rows($consulta) > 0)
    {
            while($row = mysqli_fetch_array($consulta))
            {
              $_SESSION['users_id'] = $row[0];
              $_SESSION['users_username'] = $row[1];
              $_SESSION['users_nombre'] = $row[3];
              $_SESSION['users_foto'] = $row[4];
            }
             
            $tmp = mysqli_query($con, "SELECT * FROM empresa");
            while($row = mysqli_fetch_array($tmp))
            {
              $_SESSION['empresa_nombre'] = $row[1];
              $_SESSION['empresa_nombre_corto'] = $row[2];
              $_SESSION['empresa_direccion'] = $row[3];
              $_SESSION['empresa_correo'] = $row[4];
              $_SESSION['empresa_telefono'] = $row[5];
              $_SESSION['empresa_mision'] = $row[6];
              $_SESSION['empresa_vision'] = $row[7];
              $_SESSION['empresa_contacto'] = $row[8];
              $_SESSION['empresa_fb'] = $row[9];
              $_SESSION['empresa_yt'] = $row[10];
              $_SESSION['empresa_tw'] = $row[11];
            }
  
            echo '<script>location.href = "products.php?pagina=1"</script>';
    }
    else
    {
      echo '<script>location.href = "?no_session=true"</script>';
    }
}
?>
