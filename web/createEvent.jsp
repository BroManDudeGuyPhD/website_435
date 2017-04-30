<%-- 
    Document   : createEvent
    Created on : Apr 26, 2017, 6:25:24 PM
    Author     : Andrew
--%>

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


<%--(String eventID, String areaID, String desc, String volunteersNeeded, String controlledBy, String familyCoord, String eventDate, String hours)--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success!</title>
    </head>
    <body>
        <%!manageDB db = new manageDB();%>
        
         <% 
            eventID.setEventID(request.getParameter("eventID"));
            areaID.setAreaID(request.getParameter("areaID"));
            
            volunteersNeeded.setVolunteersNeeded(request.getParameter("volunteersNeeded"));
            controlledBy.setControlledBy(request.getParameter("controlledBy"));
            familyCoord.setFamilyCoord(request.getParameter("familyCoord"));
            eventDate.setEventDate(request.getParameter("eventDate"));
            hours.setHours(request.getParameter("hours"));
            eventName.setEventName(request.getParameter("eventName"));
         %>
            
         <% db.addEvent(eventID.getEventID(), areaID.getAreaID(), volunteersNeeded.getVolunteersNeeded(), controlledBy.getControlledBy(), familyCoord.getFamilyCoord(), eventDate.getEventDate(), hours.getHours(), eventName.getEventName());%>
        
        <h1>Event Added!</h1>
        
                <FORM><INPUT Type="button" VALUE="Back" onClick="history.go(-2);return true;"></FORM>

    </body>
</html>