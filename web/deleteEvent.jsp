<%-- 
    Document   : deleteEvent
    Created on : Apr 29, 2017, 10:05:50 PM
    Author     : Andrew
--%>

<%@page import="Session.manageDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="eventToDelete" scope="session" class="Session.SessionBean"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event Deleted</title>
        <%manageDB db = new manageDB();
          eventToDelete.setEventToDelete(request.getParameter("eventToDelete"));
          db.deleteEvent(eventToDelete.getEventToDelete());
        %>
        
        
    </head>
    <body>
        Event <%=request.getParameter("eventToDelete")%> deleted
        <FORM><INPUT Type="button" VALUE="Back" onClick="history.go(-1);return true;"></FORM>
        <FORM><INPUT Type="button" VALUE="Main Menu" onClick="history.go(-2);return true;"></FORM>

    </body>
</html>
