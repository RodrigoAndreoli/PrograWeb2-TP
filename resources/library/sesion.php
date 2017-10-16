<?php
    class Sesion{
        public function _construct(){}
        
        public function iniciarSesion(){
            session_start();
            if(!isset($_SESSION['usuario'])) {
                header('Location: login.php');
            }
        }
        
        public function destruirSesion(){
            unset($_SESSION['usuario']);
            session_destroy();
            header('Location: login.php');
            exit();
        }
    }
?>