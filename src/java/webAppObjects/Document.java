
package webAppObjects;

import java.io.Serializable;
import java.util.Date;

public class Document implements Serializable{
    private int documentid;
    private String documentname;
    private String documentType;
    private Date documentDate;
    private Doctor doctor;
    private Patient patient;
    
    public Document(){
        
    }

    public int getDocumentid() {
        return documentid;
    }

    public void setDocumentid(int documentid) {
        this.documentid = documentid;
    }

    public String getDocumentname() {
        return documentname;
    }

    public void setDocumentname(String documentname) {
        this.documentname = documentname;
    }

    public String getDocumentType() {
        return documentType;
    }

    public void setDocumentType(String documentType) {
        this.documentType = documentType;
    }

    public Date getDocumentDate() {
        return documentDate;
    }

    public void setDocumentDate(Date documentDate) {
        this.documentDate = documentDate;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

     public int uploadDocument(String patNID){
        DB d = new DB();
        int updated =0;
        updated = d.uploadDocument(this,patNID);
        d.closeConnection();
        return updated;
    }

}
