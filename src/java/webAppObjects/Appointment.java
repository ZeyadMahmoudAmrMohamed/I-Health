/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package webAppObjects;

import java.io.Serializable;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Ahmed_salah
 */
public class Appointment implements Serializable{
    private String Type;
    private Date appDate;
    private Time appTime;
    private String Status;
    private int appPrice;
    private int appID;
    private Doctor doctor;
    private boolean isOnline;
    private String clinicName;
    private String applink;
    
    //this attribute is just to put the clinic location and the app the status in the appinvoice
    private Clinic clinic;
    private AppInvoice appinv;
    //this attribute is just to store the patient info

    public Appointment(){
        
    }
    /*
    public Appointment(String Type, Date appDate, String Status, String drName) {
        this.Type = Type;
        this.appDate = appDate;
        this.Status = Status;
        this.drName = drName;
    }*/

    public String getType() {
        return Type;
    }

    public void setType(String Type) {
        this.Type = Type;
    }

    public Date getAppDate() {
        return appDate;
    }

    public void setAppDate(Date appDate) {
        this.appDate = appDate;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }
    
        public Time getAppTime() {
        return appTime;
    }

    public void setAppTime(Time appTime) {
        this.appTime = appTime;
    }

    public int getAppPrice() {
        return appPrice;
    }

    public void setAppPrice(int appPrice) {
        this.appPrice = appPrice;
    }

    public int getAppID() {
        return appID;
    }

    public void setAppID(int appID) {
        this.appID = appID;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public boolean isIsOnline() {
        return isOnline;
    }

    public void setIsOnline(boolean isOnline) {
        this.isOnline = isOnline;
    }

    public String getClinicName() {
        return clinicName;
    }

    public void setClinicName(String clinicName) {
        this.clinicName = clinicName;
    }

    public String getApplink() {
        return applink;
    }

    public void setApplink(String applink) {
        this.applink = applink;
    }

    public Clinic getClinic() {
        return clinic;
    }

    public void setClinic(Clinic clinic) {
        this.clinic = clinic;
    }

    public AppInvoice getAppinv() {
        return appinv;
    }

    public void setAppinv(AppInvoice appinv) {
        this.appinv = appinv;
    }

    
    
    
    public static int retrievePrice(String appid){
        DB d = new DB();
        int out = d.appPrice(appid);
        d.closeConnection();
        System.out.print(out);
        return out;
    }
    public static int freeApp(String update){
        DB d = new DB();
        int out = d.freeApp(update);
        d.closeConnection();
        System.out.print(out);
        return out;
    }
    
   public static Appointment checkSchedule(String ndate,String ntime) {
            DB d = new DB();
            Appointment out = d.checkSchedule(ndate, ntime);
            d.closeConnection();
            return out;
    }
   
   public static ArrayList<String> getApps() {
            DB d = new DB();
            ArrayList<String> out = d.retrieveAppnames();
            d.closeConnection();
            return out;
    }

}
