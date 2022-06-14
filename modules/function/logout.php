<?php
    if(isset($_COOKIE['username'])) {
        setcookie('username', null, time() -1);
    }
?>
