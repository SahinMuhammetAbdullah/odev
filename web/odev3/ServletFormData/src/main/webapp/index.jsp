<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="col-xl-3 col-md-3 col-sm-12" id="form">
		<h2 class="form-title">Kullanıcı Kayıt Formu</h2>
    	<form action="UserRegister" method="post">
    	    <label for="ad">Ad:</label><br>
    	    <input type="text" id="ad" name="ad" required><br>
    	    <label for="soyad">Soyad:</label><br>
    	    <input type="text" id="soyad" name="soyad" required><br>
    	    <label for="eposta">E-posta:</label><br>
    	    <input type="email" id="eposta" name="eposta" required><br>
    	    <label for="sifre">Şifre:</label><br>
    	    <input type="password" id="sifre" name="sifre" required><br>
     	   <input type="submit" value="Kayıt Ol">
    	</form>
	</div>
	
</body>
</html>