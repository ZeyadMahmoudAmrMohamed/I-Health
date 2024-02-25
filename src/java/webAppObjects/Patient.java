
package webAppObjects;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

public class Patient extends Account implements Serializable {
    private String NID;
    private String[] chronicDiseases;
    private String bloodType;
    private Date birthdate;
    private String patEmail;
    private String fullName;
    private String userName;
    private String userPass;
    private String confirmPass;
    private ArrayList<Credit> creditCards;
    private ArrayList<Document> documents;
    private ArrayList<Appointment> appointments;
    private ArrayList<Insurance> insurances;
    private String gender;

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
       
     public Patient(String gender,String NID, ArrayList<String> chronicDiseases, String bloodType, Date birthdate, String patEmail, String fullName, String userName, String userPass,String confirmPass, ArrayList<Credit> creditCards, ArrayList<Document> documents, ArrayList<Appointment> appointments, ArrayList<Insurance> insurances) {
        this.NID = NID;
        //this.chronicDiseases = chronicDiseases;
        this.bloodType = bloodType;
        this.birthdate = birthdate;
        this.patEmail = patEmail;
        this.fullName = fullName;
        this.userName = userName;
        this.userPass = userPass;
        this.creditCards = creditCards;
        this.documents = documents;
        this.appointments = appointments;
        this.insurances = insurances;
        this.confirmPass=confirmPass;
        this.gender=gender;
    }
    public Patient(){
       
    }

    public String getConfirmPass() {
        return confirmPass;
    }

    public void setConfirmPass(String confirmPass) {
        this.confirmPass = confirmPass;
    }
    
    public String getPatEmail() {
        return patEmail;
    }

    public void setPatEmail(String patEmail) {
        this.patEmail = patEmail;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPass() {
        return userPass;
    }

    /*
    public Patient(String insuranceCompany, String patientInsuranceID, String insuranceLevel,
    String NID, String[] chronicDiseases, String bloodType, Date birthdate) {
    super(insuranceCompany, patientInsuranceID, insuranceLevel);
    this.NID = NID;
    this.chronicDiseases = Arrays.asList(chronicDiseases);
    this.bloodType = bloodType;
    this.birthdate = birthdate;
    this.creditCards = new ArrayList<>();
    this.documents = new ArrayList<>();
    this.appointments = new ArrayList<>();
    }*/
    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getNID() {
        return NID;
    }

    public void setNID(String NID) {
        this.NID = NID;
    }

    public String getBloodType() {
        return bloodType;
    }

    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public String[] getChronicDiseases() {
        return chronicDiseases;
    }

    public void setChronicDiseases(String[] chronicDiseases) {
        this.chronicDiseases = chronicDiseases;
    }

    public ArrayList<Credit> getCreditCards() {
        return creditCards;
    }

    public void setCreditCards(ArrayList<Credit> creditCards) {
        this.creditCards = creditCards;
    }

    public ArrayList<Document> getDocuments() {
        return documents;
    }

    public void setDocuments(ArrayList<Document> documents) {
        this.documents = documents;
    }

    public ArrayList<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(ArrayList<Appointment> appointments) {
        this.appointments = appointments;
    }

    public ArrayList<Insurance> getInsurances() {
        return insurances;
    }

    public void setInsurances(ArrayList<Insurance> insurances) {
        this.insurances = insurances;
    }
    
    public void addCreditCardToDB(Credit credit) {
        DB database = new DB();
        
    }

  public static ArrayList<Credit> getCardsFromDB(String nid) {
         DB d = new DB();
        ArrayList<Credit> credit = d.retrieveCredit(nid);
        d.closeConnection();
        return credit;
    }

    public void addInsurancetoDB(Insurance insurance) {
        
    }

    public void getInsurancesFromDB() {
        
    }
    public int registerPatient(){
        DB database = new DB();
        
        return database.registerPatient(this);
    }
    public int addDisease(String disease){
        DB database = new DB();
        return database.addPatientDisease(disease, NID);
    }
    
    public  static ArrayList<Appointment> retAvOnAppForBooking(String apptype){
        DB d = new DB();
        ArrayList<Appointment> apps = d.retrieveFreeOnlineApp(apptype);
        d.closeConnection();
        return apps;
    }
    public  static ArrayList<Appointment> retAvPhAppForBooking(String apptype){
        DB d = new DB();
        ArrayList<Appointment> apps = d.retrieveFreePhysApp(apptype);
        d.closeConnection();
        return apps;
    }
      public static int scheduleAppointment(String update) {
            DB d = new DB();
            int out = d.bookAPP(update);
            d.closeConnection();
            return out;
    }
    
    public static ArrayList<Appointment> viewAppStatus(String patid) {
        DB d = new DB();
        ArrayList<Appointment> apps = d.viewAppStatus(patid);
        d.closeConnection();
        return apps;
    }
        
    public static ArrayList<Document> requestDocuments(String patid) {
       DB d = new DB();
        ArrayList<Document> docs = d.retrieveDocuments(patid);
        d.closeConnection();
        return docs;
    }
    
    

}
