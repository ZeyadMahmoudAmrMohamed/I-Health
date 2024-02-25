
package webAppObjects;

import java.util.HashMap;


public class PharItemInvoice{
    private String invoiceId;
    
    private HashMap<PharItem , Integer> itemsBought;
    private int total_price;
    
    private Patient patient;

    public PharItemInvoice(){
        this.itemsBought = new HashMap<PharItem,Integer>();
    }

    public String getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(String invoiceId) {
        this.invoiceId = invoiceId;
    }

    public int getTotal_Price() {
        return total_price;
    }

    public void setTotal_Price(int total_price) {
        this.total_price = total_price;
    }
    
    public void InvoicetoDB(){
    }
    public void addItemBought(PharItem item,Integer quantity){
        
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }
    
    
}
