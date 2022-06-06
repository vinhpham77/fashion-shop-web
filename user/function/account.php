<?php
    function directToLogin() {
        if (!$_COOKIE['username']) {
            header('Location: login.php');
        }
    }
?>
