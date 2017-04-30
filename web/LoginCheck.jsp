<%-- 
    Document   : LoginCheck
    Created on : Dec 4, 2016, 4:40:58 PM
    Author     : Andrew
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Session.manageDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

        String username=request.getParameter("username");
        String password=request.getParameter("password");
       
        manageDB db = new manageDB();
        
        ResultSet users = db.generalQuery
                 ("SELECT USERNAME, PASSWORD, ROLEID "
                + "FROM PERSON");

        
        while(users.next()){
            if(users.getString(1).equals(username) && users.getString(2).equals(password)){
                
                if(users.getString(3).equals("5")){
                    response.sendRedirect("adminMainMenu.html");
                }
                
                else
                    response.sendRedirect("mainMenu.html");
             
            }
        }
        
        
            %>
            <b>Error Logging in!</b>
            
        <FORM><INPUT Type="button" VALUE="Try Again" onClick="history.go(-1);return true;"></FORM>
    </body>
</html>



