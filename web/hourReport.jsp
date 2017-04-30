<%-- 
    Document   : hourReport
    Created on : Apr 29, 2017, 5:07:11 PM
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
        
        
        <br>

        <table>
            <tr>
                <th>Family Name</th>
                <th>Total Hours</th>
            </tr>
            
            
                <%ResultSet results;
                results = db.hourTotals();
          
                //SELECT FNAME, LNAME, USERNAME, ROLEID FROM PERSON
          
                while(results.next()){%>
                <tr>
                    <td><%=results.getString(1)%> </td>
                    <td><%=results.getString(2)%> </td>    

                </tr>
                <% }%>
                
            
          
        </table>
        <FORM><INPUT Type="button" VALUE="Back" onClick="history.go(-1);return true;"></FORM>
    </body>
</html>

