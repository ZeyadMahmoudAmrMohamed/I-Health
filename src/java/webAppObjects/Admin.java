
package webAppObjects;

import java.io.Serializable;


public class Admin extends Account implements Serializable{
    private String adminId;

    public Admin(){
        super();
    }
    /*
    public Admin(String adminId) {
        this.adminId = adminId;
    }*/

    
    //theoritical feature does not make sense
    /*public void DeleteUser() {
        // code to delete user from the system
    }*/

    public static int addItem(String iname, int iprice, String man,int quan){
         DB d = new DB();
         int out = d.addPharItem(iname, iprice, quan, man);
         d.closeConnection();
         return out;
    }

    public static int DeleteItemFromPharDB(String iname) {
        DB d = new DB();
         int out = d.deletePharItem(iname);
         d.closeConnection();
         return out;
    }

    //might add this feature later no time now
    /*public void ChangeItemPrice() {
        // code to change the price of an item in the pharmacy database
    }*/

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }
}

