<%-- 
    Document   : createUser
    Created on : Apr 29, 2017, 11:47:52 AM
    Author     : Andrew
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Session.manageDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="fpLName" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="fpFName" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="spLName" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="spFName" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="address" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="city" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="state" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="zip" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="Hphone" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="Bphone" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="email" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="username" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="password" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="role" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="position" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="familyid" scope="session" class="Session.SessionBean"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success!</title>
    </head>
    <body>
        <%!manageDB db = new manageDB();%>
        
         <% 
            fpLName.setFpLName(request.getParameter("fpLName"));
            fpFName.setFpFName(request.getParameter("fpFName"));
            address.setAddress(request.getParameter("address"));
            city.setCity(request.getParameter("city"));
            state.setState(request.getParameter("state"));
            zip.setZip(request.getParameter("zip"));
            username.setUsername(request.getParameter("username"));
            password.setPassword(request.getParameter("password"));
            role.setRole(request.getParameter("role"));
            position.setPosition(request.getParameter("position"));
            
            ResultSet familyMax = db.generalQuery("SELECT MAX(FAMILYID) "
            + "FROM FAMILY ");

            familyMax.next();
            String newFamilyID = familyMax.getString(1);
            newFamilyID = String.valueOf(Integer.parseInt(newFamilyID) + 1);
            

            ResultSet familys = db.generalQuery("SELECT FAMILYID, FAMILYNAME "
            + "FROM FAMILY");
            
            Boolean familyIDSet = false;
            while(familys.next()){
                if(fpLName.equals(familys.getString(2))){
                    familyid.setFamilyID(familys.getString(1));
                    familyIDSet = true;
                }
            }
            
            if(familyIDSet == false){
                familyid.setFamilyID(newFamilyID);
                db.addFamily(familyid.getFamilyID(), fpLName.getFpLName());
                
            }
            
         %>
            
        <% db.addUser(familyid.getFamilyID(),fpLName.getFpLName(), fpFName.getFpFName(), address.getAddress(), city.getCity(), state.getState(), zip.getZip(), username.getUsername(), password.getPassword(), role.getRole(), position.getPosition());
        
        %>
            
        <h1>User Added!</h1>
        
                <FORM><INPUT Type="button" VALUE="Back" onClick="history.go(-2);return true;"></FORM>

    </body>
</html>
