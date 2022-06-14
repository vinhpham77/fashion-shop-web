<?php
    if(isset($_COOKIE['username'])) {
        setcookie('username', null, time() -1);
        //header('location:index.php ');
        exit();
    }
    var_dump('5');
    echo'3';
?>
