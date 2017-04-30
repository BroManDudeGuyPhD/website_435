package Session;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.sql.CLOB;

public class manageDB {

    Connection connection;

    public manageDB() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
        } catch (Exception e) {
            System.out.println("Driver Error");
        }

        String url = "jdbc:oracle:thin:@localhost:1521:engineerdb";

        String admin = "AUSTINDB";
        String adminPw = "root";

        try {
            connection = DriverManager.getConnection(url, admin, adminPw);
             System.out.println("Connection SUCCESS");
             
        } catch (SQLException e) {
            System.out.println("Connection Error");
            e.printStackTrace();
            return;
        }

    }
    
    
    //List Queries
    public ResultSet listEvents() {

        try {
            Statement statement = connection.createStatement();
            
            ResultSet result;

            result = statement.executeQuery("SELECT EVENTID, EVENTNAME, EVENTDATE, AMTVOLUNTEERSNEEDED, FAMILYCOORDINATOR, HOURS FROM EVENT ORDER BY EVENTDATE");
            
            return result;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public ResultSet listUsers() {

        try {
            Statement statement = connection.createStatement();
            
            ResultSet result;

            result = statement.executeQuery
                     ("SELECT PERSON.USERNAME, PERSON.FNAME, PERSON.LNAME, ROLE.ROLENAME "
                    + "FROM PERSON "
                    + "INNER JOIN ROLE "
                    + "ON PERSON.ROLEID=ROLE.ROLEID");
            
            return result;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    
    
    //Add queries
    public void addUser(String familyID, String fpLName, String fpFName, String address, String city, String state, String zip, String username, String password, String role, String position) {

        try {
            Statement statement = connection.createStatement();
            ResultSet result;

            ResultSet personID = generalQuery("SELECT MAX(PERSONID) "
            + "FROM PERSON ");

            personID.next();
            String id = personID.getString(1);
            id = String.valueOf(Integer.parseInt(id) + 1);
        
            
            result = statement.executeQuery(
                    "INSERT INTO PERSON(PERSONID, FAMILYID, FNAME, LNAME, STREETADDRESS, CITY, STATE, ZIP, USERNAME, PASSWORD, ROLEID, POSITIONID) VALUES('"
                    + id+ "', '"+ familyID + "', '"+ fpFName + "', '" + fpLName + "', '" + address + "', '" + city + "', '" + state + "', '" + zip + "', '" + username + "', '" + password + "', '" + role + "','" + position+ "')"
            );
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    
    public void addFamily(String familyID, String familyName) {
        try {
            Statement statement = connection.createStatement();
            ResultSet result;
            
            result = statement.executeQuery("INSERT INTO FAMILY(FAMILYID, FAMILYNAME) VALUES ('"+familyID +"', '"+familyName+"')");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
    public void addEvent(String eventID, String areaID, String volunteersNeeded, String controlledBy, String familyCoord, String eventDate, String hours, String eventName) {

        try {
            Statement statement = connection.createStatement();
            ResultSet result;

            result = statement.executeQuery(
                    "INSERT INTO EVENT(EVENTID,AREAID,AMTVOLUNTEERSNEEDED,CONTROLLEDBY,FAMILYCOORDINATOR,EVENTDATE,HOURS,EVENTNAME) VALUES('"
                    + eventID + "', '"  + areaID + "','"  +volunteersNeeded+ "','" +controlledBy+ "', '" +familyCoord+ "','" +eventDate+ "', '" +hours+ "', '" +eventName+ "')"
            );
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    
    //DELETE queries
    public void deleteUser(String userName) {

        try {
            Statement statement = connection.createStatement();
            ResultSet result;

            result = statement.executeQuery("DELETE from PERSON where USERNAME = '"+userName+"'");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    
    public void deleteEvent(String eventID) {

        try {
            Statement statement = connection.createStatement();
            ResultSet result;

            result = statement.executeQuery("DELETE from EVENT where EVENTID = '"+eventID+"'");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    
    
    //Hour Total Query
    public ResultSet hourTotals() {

        try {
            Statement statement = connection.createStatement();
            ResultSet result;

            result = statement.executeQuery
                     ("SELECT FAMILYCOORDINATOR, SUM(EVENT.HOURS) FROM EVENT GROUP BY EVENT.FAMILYCOORDINATOR");
            return result;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

    }
    
    
    public ResultSet generalQuery(String query) {

        try {
            Statement statement = connection.createStatement();
            
            ResultSet result;

            result = statement.executeQuery(query);
            
            return result;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    
    
    


    
}
