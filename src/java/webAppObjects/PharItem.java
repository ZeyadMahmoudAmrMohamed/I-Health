
package webAppObjects;

import java.io.Serializable;
import java.util.ArrayList;

public class PharItem implements Serializable{
    private String itemCode;
    private String itemName;
    private String itemManufacturer;
    private int itemPrice;
    private int itemQuantity;

    public PharItem(){
        
    }
    /*
    public PharItem(String itemCode, String itemName, String itemManufacturer, int itemPrice) {
        this.itemCode = itemCode;
        this.itemName = itemName;
        this.itemManufacturer = itemManufacturer;
        this.itemPrice = itemPrice;
    }*/

    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemManufacturer() {
        return itemManufacturer;
    }

    public void setItemManufacturer(String itemManufacturer) {
        this.itemManufacturer = itemManufacturer;
    }

    public int getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(int itemPrice) {
        this.itemPrice = itemPrice;
    }

    public int getItemQuantity() {
        return itemQuantity;
    }

    public void setItemQuantity(int itemQuantity) {
        this.itemQuantity = itemQuantity;
    }
    
   
    public static ArrayList<PharItem> retrPharItems (){
        DB d = new DB();
        ArrayList<PharItem> phs = d.retrPharitems();
        d.closeConnection();
        return phs;
    }
    public static int retrieveQuan(String iname){
        DB d = new DB();
        int out = d.retrieveQuan(iname);
        d.closeConnection();
        return out;
    }
    public static int decreaseQuan(String iname,int quan){
        DB d = new DB();
        int out = d.decreasequan(iname, quan);
        d.closeConnection();
        return out;
    }
}