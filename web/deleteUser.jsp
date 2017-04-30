<%-- 
    Document   : deleteUser
    Created on : Apr 29, 2017, 3:47:13 PM
    Author     : Andrew
--%>

<%@page import="Session.manageDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="userToDelete" scope="session" class="Session.SessionBean"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Deleted</title>
        <%manageDB db = new manageDB();
          userToDelete.setUserToDelete(request.getParameter("userToDelete"));
          db.deleteUser(userToDelete.getUserToDelete());
        %>
        
        
    </head>
    <body>
        User <%=request.getParameter("userToDelete")%> deleted
        <FORM><INPUT Type="button" VALUE="Back" onClick="history.go(-1);return true;"></FORM>
        <FORM><INPUT Type="button" VALUE="Main Menu" onClick="history.go(-2);return true;"></FORM>

    </body>
</html>
