<?php
#error_reporting(0);
session_start();
include 'db.php';
$con = new mysqli($host,$user,$password,$db);
if ($con->connect_errno)
{
    echo '
      <script>
        Metro.notify.create("No hay coneccion con la base de datos", "DATABASE", {cls: "alert"});
      </script>';
    exit();
}
@mysqli_query($con, "SET NAMES 'utf8'");
if ($_POST['username'] == null || $_POST['password'] == null)
{
  echo '
    <script>
      Metro.notify.create("Complete todos los campos", "Imcompleto", {cls: "warning"});
    </script>';
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
            }
            echo '<script>location.href = "control.php"</script>';
    }
    else
    {
      echo '<script>location.href = "?no_session=true"</script>';
    }
}
?>
