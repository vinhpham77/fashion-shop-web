<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style/sttyle.css"/>

</head>
<body>

<form method="post" action="register.php" class="form ">

<h2>Đăng ký thành viên</h2>

Username: <input type="text"id="username" name="Username" value="" required>
Password: <input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one upper and lower case letter and at least 8 characters" required id="password" name="Password" value="" required>
Full Name :<input type="text" id="name" name="Name" value="" required>
Current address: <input type="text" id="current" name="Current" value="" required>
Email: <input type="email" id="emaill" name="Email" value="" required>
Phone: <input type="text" name="sdt"  id="phone" value="" required>
<input type="submit" name="dangky" class="register" value="Đăng Ký"/>
 </form>
 <script src="js/Xuly.js"></script>
 <!-- <script>
     Validator({
          form:'#form',
          rules:[
              Validator.isEmail('#email')
          ]
     });
 </script> -->
</body>
</html>
