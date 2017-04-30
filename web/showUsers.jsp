<%-- 
    Document   : viewUser
    Created on : Apr 29, 2017, 2:47:14 PM
    Author     : Andrew
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Session.manageDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>

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
        
        <%!manageDB db = new manageDB();%>
        
        
        <form action="deleteUser.jsp" method="post">
            <input type="text" placeholder="Username" name="userToDelete" size="15" >
            <input type="submit" value="Delete"/>
        </form>
        
        <br>

        <table>
            <tr>
                <th>User Name</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Role</th>
            </tr>
            
            
                <%ResultSet results;
                results = db.listUsers();
          
                //SELECT FNAME, LNAME, USERNAME, ROLEID FROM PERSON
          
                while(results.next()){%>
                <tr>
                    <td><%=results.getString(1)%> </td>
                    <td><%=results.getString(2)%> </td>    
                    <td><%=results.getString(3)%> </td>   
                    <td><%=results.getString(4)%> </td>
                </tr>
                <% }%>
                
            
          
        </table>
        <FORM><INPUT Type="button" VALUE="Back" onClick="history.go(-1);return true;"></FORM>
    </body>
</html>
