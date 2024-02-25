
package webAppObjects;

import java.io.Serializable;


public class Credit implements Serializable{
    private String cardNumber;
    private String holderName;
    private Patient patient;

    public Credit(){
        
    }
    
    public int addCredit(String patID){
        DB d = new DB();
        int updated =0;
        updated = d.addCard(this,patID);
        d.closeConnection();
        return updated;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getHolderName() {
        return holderName;
    }

    public void setHolderName(String holderName) {
        this.holderName = holderName;
    }
        public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

}
