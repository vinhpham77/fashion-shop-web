<?php
    require 'connect_db.php';
    $sql = "SELECT cate_name FROM category LIMIT 1";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="" method="post">
        <input type="text" name="abc">
        <button type="submit" style="padding: 15px;">Nút</button>
    </form>
</body>
</html>
