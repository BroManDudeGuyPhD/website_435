<%-- 
    Document   : showEvent
    Created on : Apr 26, 2017, 3:58:55 PM
    Author     : Andrew
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Session.manageDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Events</title>
        
        <style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
        </style>
        
    </head>
    <body>
        
        <form action="deleteEvent.jsp" method="post">
            <input type="text" placeholder="EventID" name="eventToDelete" size="15" >
            <input type="submit" value="Delete"/>
        </form>

        <hr>
        
        <table>
            <tr>
                <th>Event ID</th>
                <th>Event Name</th>
                <th>Event Date</th>
                <th>Volunteers Needed</th>
                <th>Family Coordinator</th>
                <th>Hours</th>
                
            </tr>

            <%!manageDB db = new manageDB();%>
            
                <%ResultSet results;
            results = db.listEvents();
            
            //result = statement.executeQuery("SELECT EVENTID, EVENTNAME, EVENTDATE, AMTVOLUNTEERSNEEDED, FAMILYCOORDINATOR, HOURS FROM EVENT ORDER BY EVENTDATE");


            while (results.next()) {%>
            <tr>
                <td><%=results.getString(1)%> </td>
                <td><%=results.getString(2)%> </td>
                <td><%=results.getString(3).replace("00:00:00.0", "")%></td>
                <td><%=results.getString(4)%> </td>
                <td><%=results.getString(5)%> </td>    
                <td><%=results.getString(6)%> </td>
            </tr>


                <% }%>
            
        </table>
            
        <FORM><INPUT Type="button" VALUE="Back" onClick="history.go(-1);return true;"></FORM>
    </body>
</html>
