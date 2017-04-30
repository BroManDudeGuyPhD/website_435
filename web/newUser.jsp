<%-- 
    Document   : newUser
    Created on : Apr 29, 2017, 11:47:11 AM
    Author     : Andrew
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Session.manageDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Session.manageDB"%>
<jsp:useBean id="fpLName" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="fpFName" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="spLName" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="spFname" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="address" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="city" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="state" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="zip" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="username" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="password" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="role" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="position" scope="session" class="Session.SessionBean"/>
<!DOCTYPE html>

<%--(String fpLName, String fpFName, String spLName, String spFname, String address, String city, String state, int zip, int Hphone, int Bphone, String email)--%>


<html>
    
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
<!--        <script type="text/javascript">
        function checkform() {
            if(document.frmMr.password.value === "") {
                alert("Please Enter Password!");
                return false;
            } else {
                document.frmMr.submit();
            }
        }
        </script>-->
        
        
        <title>New User / Family</title>
        
        <style type="text/css">
        form  { display: table;      } 
	p     { display: table-row;  }
	label { display: table-cell; }
	input { display: table-cell; }

        </style>
        
        <%
        manageDB db = new manageDB();
        
        ResultSet roles = db.generalQuery
                 ("select ROLEID, ROLENAME from ROLE");
        
        ResultSet positions = db.generalQuery
                 ("select POSITIONID, POSITIONNAME from POSITION");

        %>

    
    </head>
    <body>
        <h1> New User </h1>
        <div class="container">
        <form action="createUser.jsp" method="post">
            
            <b>Account Info</b> <br>
            <p><label>Username</label> <input type="text" placeholder="" name="username" size="15" > </p> 
            <p><label>Password</label> <input type="text" placeholder="" name="password" size="15" > </p> 
            <p><label>Role</label>
                <select name = "role">
                    <%while (roles.next()) {%>
                    <option value = "<%=roles.getString(1)%>"><%=roles.getString(2)%> </option>
                    <% } %>
                </select> </p>

            <p><label>Position</label>
                <select name = "position">
                    <%while (positions.next()) {%>
                    <option value = "<%=positions.getString(1)%>"><%=positions.getString(2)%> </option>
                    <% }%>
                </select> </p>

                
            <br><b>User Information</b> <br>
            <p><label>First Name</label>    <input type="text" placeholder="" name="fpFName" size="15" > </p>
            <p><label>Last Name</label>    <input type="text" placeholder="" name="fpLName" size="15" > </p> 
            <p><label>Second Parent First Name</label>   <input type="text" placeholder="Optional" name="spLName" size="15" > </p>
            <p><label>Second Parent Last Name</label>    <input type="text" placeholder="Optional" name="spLName" size="15" > </p>
            <p><label>Address  </label>                  <input type="text" placeholder="" name="address" size="20" > </p>
            <p><label>City</label>                       <input type="text" placeholder="" name="city" size="10" > </p>
            <p><label>State (2 letter Code)</label>      <input type="text" placeholder="" name="state" size="5" > </p>
            <p><label>Zip </label>                       <input type="text" placeholder="" name="zip" size="5" > </p>

            
            <br> <br>
            <input type="submit" value="Add User"/>
          </form>
        </div>
        <FORM><INPUT Type="button" VALUE="Back" onClick="history.go(-1);return true;"></FORM>
    </body>
</html>

