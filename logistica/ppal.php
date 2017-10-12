<?php
    //reanudo la session antes del contenido
    //rescato lo de la variable super global
    session_start();
    //compruebo,si se almaceno algo en la varible
    if(!isset($_SESSION["usuario"])){
            header("Location: login.php");
    }
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Index</title>
    <?php
        require_once($_SERVER['DOCUMENT_ROOT'].'/resources/config.php');
    ?>
</head>

<body>
    <!-- HEADER -->
    <?php
        require_once($_SERVER['DOCUMENT_ROOT'].'/resources/templates/header.php');
    ?>
    <div id="wrapper">
    <!-- Sidebar -->
    <?php
        require_once($_SERVER['DOCUMENT_ROOT'].'/resources/templates/sidebar.php');        
    ?>
    <!-- Page content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <!-- El contenido -->
                        <h3 class="">Bienvenido a la zona de administración</h3>
                    
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<!--
<script>
        
        $("#menu-toggle").click( function(e){
            alert("hola");
            
            e.preventDefault();
            $("#wrapper").toggleClass("mostrar");
        });
    </script>
-->
</html>