/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package webAppObjects;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;


/**
 *
 * @author Ahmed_salah
 */
public class Doctor extends Account implements Serializable {

  
    private String specialization;
    private String docEmail;
    private String fullName;
    private String userName;
    private String userPass;
    private ArrayList<Clinic> clinics;    
    private String confirmPass;
    private String gender;
    private String NID;
    private ArrayList<Appointment> appointments;

    public Doctor() {
        super();
        this.clinics = new ArrayList<>();
        this.appointments = new ArrayList<>();
    }

    /*public Doctor(String NID,String gender, String specialization, String docEmail, String fullName, String userName, String userPass, Clinic clinic,String confirmPass) {
       
        this.specialization = specialization;
        this.docEmail = docEmail;
        this.fullName = fullName;
        this.userName = userName;
        this.userPass = userPass;
        this.clinics = clinics;
        this.confirmPass= confirmPass;
        this.gender=gender;
        this.NID=NID;
    }*/

    public String getNID() {
        return NID;
    }

    public void setNID(String NID) {
        this.NID = NID;
    }
    
     public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getConfirmPass() {
        return confirmPass;
    }

    public void setConfirmPass(String confirmPass) {
        this.confirmPass = confirmPass;
    }
    

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public String getDocEmail() {
        return docEmail;
    }

    public void setDocEmail(String docEmail) {
        this.docEmail = docEmail;
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

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public ArrayList<Clinic> getClinics() {
        return clinics;
    }

    public void setClinic(ArrayList<Clinic> clinics) {
        this.clinics = clinics;
    }
    public int registerDoctor(){
        DB database = new DB();
        database.openConnection();
        return database.registerDoctor(this);
    }
    public static ArrayList<Appointment> retrieveAppfromDB(String nid){
            DB d = new DB();
            ArrayList<Appointment> out = d.retrieveSpecificDocApp(nid);
            d.closeConnection();
          return out;
    }
    public static ArrayList<Clinic> retrieveClinicsFromDB(String nid){
            DB d = new DB();
            ArrayList<Clinic> out = d.retrieveClinic(nid);
            d.closeConnection();
          return out;
    }
    public void addClinicToDB(String name, String location, ArrayList<Clinic> clinics) {
        // add a clinic to the array of clinics
    }
    

    public String getClinicLocation(ArrayList<Clinic> clinics) {
        // return the location of the first clinic with the same clinic name
        return "yesy";
    }
    public static int addApp(String spec,Date appdate,String nid, int appPrice,Time apptime, String isOnline, String clinicName,String applink){
        int out = 0;
      DB d = new DB();
      out = d.addApp(spec, appdate, nid, appPrice, apptime, isOnline, clinicName, applink);
      d.closeConnection();
      return out;
    }

    public static int rescheduleAppointment(String ndate,String ntime,Date olddate,Time oldTime) {
        DB d = new DB();
        int out = d.changeSchedule(ndate, ntime,olddate,oldTime);
        d.closeConnection();
        return out;
    }

    public static int deleteAppointment(String cancel) {
        DB d = new DB();
        int out = d.deleteApp(cancel);
        d.closeConnection();
        return out;
    }

    public static ArrayList<Appointment> viewAppointments(String nid) {
        DB d = new DB();
        ArrayList<Appointment> apps = d.viewAppointments(nid);
        d.closeConnection();
        return apps;
    }
    
    public static ArrayList<AppInvoice> viewHistory(String appid) {
        DB d = new DB();
        ArrayList<AppInvoice> apps = d.viewHistory(appid);
        d.closeConnection();
        return apps;
    }

    public void uploadDocument(Document document) {
        // upload a new document
    }
}