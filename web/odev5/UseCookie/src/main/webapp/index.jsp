<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ana Sayfa</title>
</head>
<body>
    <h2>Hoş Geldiniz!</h2>
    <button><a href="login.jsp">Giriş</a></button>

    <h3>Çerezler:</h3>
    <%
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                out.println("<p>" + cookie.getName() + ": " + cookie.getValue() + "</p>");
            }
        }
    %>
</body>
</html>
