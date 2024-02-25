
package webAppObjects;

import java.io.Serializable;


public class Insurance implements Serializable{
    private String insuranceCompany;
    private String patientInsuranceID;
    private String insuranceLevel;
    private Patient patient;

    public Insurance(){
        
    }
   
    public String getInsuranceCompany() {
        return insuranceCompany;
    }

    public void setInsuranceCompany(String insuranceCompany) {
        this.insuranceCompany = insuranceCompany;
    }

    public String getPatientInsuranceId() {
        return patientInsuranceID;
    }

    public void setPatientInsuranceID(String patientInsuranceID) {
        this.patientInsuranceID = patientInsuranceID;
    }

    public String getInsuranceLevel() {
        return insuranceLevel;
    }

    public void setInsuranceLevel(String insuranceLevel) {
        this.insuranceLevel = insuranceLevel;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }
    
}