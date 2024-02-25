
package webAppObjects;

import java.io.Serializable;


public class Clinic implements Serializable{
    private String clinicName;
    private String clinicLocation;
    private Doctor doctor;

    

    public String getClinicName() {
        return clinicName;
    }

    public void setClinicName(String clinicName) {
        this.clinicName = clinicName;
    }

    public String getClinicLocation() {
        return clinicLocation;
    }

    public void setClinicLocation(String clinicLocation) {
        this.clinicLocation = clinicLocation;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }
     public int addClinic(){
        DB d = new DB();
        int updated =0;
        updated = d.addClinic(this);
        d.closeConnection();
        return updated;
    }
}
