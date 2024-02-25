
package webAppObjects;

import java.io.Serializable;


public class Account implements Serializable{
    private String fullName;
    private String username;
    private String password;
    private String type;
    public Account(){
        
    }
    /*
    public Account(String fullName, String username, String password) {
        this.fullName = fullName;
        this.username = username;
        this.password = password;
    }*/

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void login(String username, String password) {
        // check if the provided username and password match the account's username and password
    }

    public void register() {
        // (create a new account for the user)
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword(){
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public static int cancelAppointment(String cancel) {
            DB d = new DB();
            int out = d.cancelAPP(cancel);
            d.closeConnection();
            return out;
    }
    public String checkAccount(){
        DB d = new DB();
        String x = d.checkAccount(this);
        if("invalid".equals(x)) {
        
            return "invalid";
        }
        else {
           
            return x;
        }
        
    }
    
    public static int deleteAppInv(String cancel) {
            DB d = new DB();
            int out = d.deleteAppInv(cancel);
            d.closeConnection();
            return out;
    }
}

