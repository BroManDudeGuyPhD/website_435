package Session;

import java.sql.Date;

public class SessionBean {
    //Family Variables
    private String fpLName;
    private String fpFName;
    private String spLName;
    private String spFname;
    private String address;
    private String city;
    private String state;
    private String zip;
    private String Username;
    private String Password;
    private String Role;
    private String Position;
    private String FamilyID;
    
    //Event Variables
    private String eventID;
    private String areaID;
    private String desc;
    private String volunteersNeeded;
    private String controlledBy;
    private String familyCoord;
    private String eventDate;
    private String hours;
    private String eventName;
    
    //NewUserVariables
    private String userToDelete;
    private String eventToDelete;
    
    public SessionBean() {
        //Family Variables

        fpLName = "";
        fpFName = "";
        spLName = "";
        spFname = "";
        address = "";
        city = "";
        state = "";
        zip = "";
        Username= "";
        Password= "";
        Role= "";
        Position= "";
        FamilyID= "";


        
        //Event Variables
        eventID = "";
        areaID = "";
        desc = "";
        volunteersNeeded = "";
        controlledBy = "";
        familyCoord = "";
        eventDate = null;
        hours = "";
        eventName = "";
        
        
        //Delete Variables
        userToDelete="";
        eventToDelete="";
}

    public String getFpLName() {
        return fpLName;
    }

    public void setFpLName(String fpLName) {
        this.fpLName = fpLName;
    }

    public String getFpFName() {
        return fpFName;
    }

    public void setFpFName(String fpFName) {
        this.fpFName = fpFName;
    }

    public String getSpLName() {
        return spLName;
    }

    public void setSpLName(String spLName) {
        this.spLName = spLName;
    }

    public String getSpFname() {
        return spFname;
    }

    public void setSpFname(String spFname) {
        this.spFname = spFname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getPosition() {
        return Position;
    }

    public void setPosition(String Position) {
        this.Position = Position;
    }


    public String getEventID() {
        return eventID;
    }

    public void setEventID(String eventID) {
        this.eventID = eventID;
    }

    public String getAreaID() {
        return areaID;
    }

    public void setAreaID(String areaID) {
        this.areaID = areaID;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getVolunteersNeeded() {
        return volunteersNeeded;
    }

    public void setVolunteersNeeded(String volunteersNeeded) {
        this.volunteersNeeded = volunteersNeeded;
    }

    public String getControlledBy() {
        return controlledBy;
    }

    public void setControlledBy(String controlledBy) {
        this.controlledBy = controlledBy;
    }

    public String getFamilyCoord() {
        return familyCoord;
    }

    public void setFamilyCoord(String familyCoord) {
        this.familyCoord = familyCoord;
    }

    public String getEventDate() {
        return eventDate;
    }

    public void setEventDate(String eventDate) {
        this.eventDate = eventDate;
    }

    public String getHours() {
        return hours;
    }

    public void setHours(String hours) {
        this.hours = hours;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getRole() {
        return Role;
    }

    public void setRole(String Role) {
        this.Role = Role;
    }

    public String getFamilyID() {
        return FamilyID;
    }

    public void setFamilyID(String FamilyID) {
        this.FamilyID = FamilyID;
    }

    public String getUserToDelete() {
        return userToDelete;
    }

    public void setUserToDelete(String userToDelete) {
        this.userToDelete = userToDelete;
    }

    public String getEventToDelete() {
        return eventToDelete;
    }

    public void setEventToDelete(String eventToDelete) {
        this.eventToDelete = eventToDelete;
    }
    
    
    
    
    
    
}
