/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package webAppObjects;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author ahmed_Salah
 */
public class AppInvoice implements Serializable{
    private String appStatus;
    private Patient patient;
    private Appointment appointment;
    private Timestamp invdate;
    
    public AppInvoice(){
        
    }
   /* public AppInvoice(String invoiceId, int price) {
        this.invoiceId = invoiceId;
        this.price = price;
    }*/

    public String getAppStatus() {
        return appStatus;
    }

    public void setAppStatus(String appStatus) {
        this.appStatus = appStatus;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Appointment getAppointment() {
        return appointment;
    }

    public void setAppointment(Appointment appointment) {
        this.appointment = appointment;
    }

    public Timestamp getInvdate() {
        return invdate;
    }

    public void setInvdate(Timestamp invdate) {
        this.invdate = invdate;
    }
    
    
    
    public static int confirmBooking(String appid, String patid){
        DB d = new DB();
        int out = d.addAppInv(appid, patid);
        d.closeConnection();
        return out;
    }
}
