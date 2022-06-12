<?php
    function directToLogin() {
        if (!isset($_COOKIE['username'])) {
            header('Location: login.php');
            exit;
        }
    }

    function logOut() {
        if(isset($_COOKIE['username'])) {
        setcookie('username', null, time() -1);
        }
    }
?>
