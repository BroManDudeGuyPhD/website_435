<%-- 
    Document   : newEvent
    Created on : Apr 26, 2017, 6:25:15 PM
    Author     : Andrew
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Session.manageDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="eventName" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="eventID" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="areaID" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="desc" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="volunteersNeeded" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="controlledBy" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="familyCoord" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="eventDate" scope="session" class="Session.SessionBean"/>
<jsp:useBean id="hours" scope="session" class="Session.SessionBean"/>

<!DOCTYPE html>

<%--(String eventID, String areaID, String desc, String volunteersNeeded, String controlledBy, String familyCoord, String eventDate, String hours)--%>

<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Course</title>
        
        <style type="text/css">
        form  { display: table;      } 
	p     { display: table-row;  }
	label { display: table-cell; }
	input { display: table-cell; }

        </style>

    
    </head>
    <body>
        <%
        manageDB db = new manageDB();
        ResultSet areaNames = db.generalQuery
                 ("SELECT AREA.AREAID, AREA.LOCATION "
                + "FROM AREA "
                + "JOIN EVENT ON AREA.AREAID = EVENT.AREAID");
        
        ResultSet eventid = db.generalQuery
                 ("SELECT MAX(EVENTID) "
                + "FROM EVENT "
                + "WHERE EVENTID IS NOT NULL");
        
        
        
        eventid.next();
        String id = eventid.getString(1);
        id=String.valueOf(Integer.parseInt(id) + 1);
        
        
        ResultSet controlledIDS = db.generalQuery
                 ("select CONTROLID, ORGANAZATION  "
                + "from CONTROLL");
        
        ResultSet familyCoords = db.generalQuery
                 ("select FAMILYID, FAMILYNAME  "
                + "from FAMILY");
        
        %>
        <h1> New Course </h1>
        <div class="container">
        <form action="createEvent.jsp" method="post">
            

            <p><label>Event ID</label>  <input type="text" placeholder="" name="eventID" size="10" > SUGGESTED ID: <%= id%> </p> 
            <p><label>Event Title</label>  <input type="text" placeholder="" name="eventName" size="10" > </p> 
            <p><label>Date (YYYY-MM-DD)</label> <input type="text" placeholder="" name="eventDate" size="10" > </p>
            <p><label>Volunteer Area</label>    
                <select name = "areaID">
                    <%while(areaNames.next()){%>
                     <option value = "<%=areaNames.getString(1)%>"><%=areaNames.getString(2)%> </option>
                     
                     <% } %>
                
                </select> </p>
            <p> <label>Hours</label>   <input type="text" placeholder="" name="hours" size="10" > </p>
            <p><label>Family Coordinator</label>
                <select name = "familyCoord">
                    <%while(familyCoords.next()){%>
                     <option value = "<%=familyCoords.getString(2)%>"><%=familyCoords.getString(2)%> </option>
                     
                     <% } %>
                
                </select> </p>
            <p><label>Volunteers Needed  </label> <input type="text" placeholder="" name="volunteersNeeded" size="10" > </p>
            <p><label>Controlled By</label>
                <select name = "controlledBy">
                    <%while(controlledIDS.next()){%>
                     <option value = "<%=controlledIDS.getString(1)%>"><%=controlledIDS.getString(2)%> </option>
                     
                     <% } %>
                
                </select> </p>
            
            <br> <br>
            <input type="submit" value="Add Event"/>
          </form>
        </div>
        <FORM><INPUT Type="button" VALUE="Back" onClick="history.go(-1);return true;"></FORM>
    </body>
</html>
