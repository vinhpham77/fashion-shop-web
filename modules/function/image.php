<?php
    function getImages($folder_path) {
        return array_slice(scandir($folder_path), 2);
    }
?>
