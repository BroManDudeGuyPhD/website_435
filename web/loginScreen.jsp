<%-- 
    Document   : loginScreen
    Created on : Dec 4, 2016, 4:40:21 PM
    Author     : Andrew
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Secure Login</title>
    </head>
    <body>
        
        <center>
            <h1>Login Page</h1>
            <form action="LoginCheck.jsp" method="post">
            Username:<input type="text" name="username">
            <br/>Password:<input type="password" name="password">
            <br/><input type="submit" value="Submit">
            </form>
        </center>
    </body>
</html>


