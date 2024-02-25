/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package webAppObjects;

import java.sql.Date;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
//import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;
import java.sql.*;
import java.time.LocalDateTime;
import javax.servlet.http.HttpSession;

/**
 *
 * @author zizof
 */
public class DB {
    private  Connection con;

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }
   
    public DB(){
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			// Establish a connection
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/?useSSL=false","root","advancedprogramming");
		}
		catch(ClassNotFoundException | SQLException e){
			e.printStackTrace();
		}
		
	}
    public void openConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","advancedprogramming");
            System.out.println("CONNECTED");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }


    }
    public void closeConnection(){
        try {
		if(con != null)
			con.close();
	    } catch (SQLException e) {
                System.out.println("Error:: "+e.getMessage());
	    }
            }
    /*----------------whatever----------------*/
      public Admin getAdminObj(String userName, String userPass) {
          Admin a= new Admin() ;
         try {
           Statement stmt = con.createStatement();
           PreparedStatement ps ;
           String sql="select adminID,fullName from project.admin where userName=? and userPass=?";
           ps=con.prepareStatement(sql);
           ps.setString(1, userName);
           ps.setString(2, userPass);
           ResultSet rs =   ps.executeQuery();
           while(rs.next()){
            String nid = rs.getString("adminID");
            String fullName = rs.getString("fullName");
            a.setAdminId(nid);
            a.setFullName(fullName);
            a.setUsername(userName);
            
        }
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
    return a;
    }
    public Patient getPatientObj(String userName,String userPass){
        Patient p= new Patient() ;
         try {
           Statement stmt = con.createStatement();
           PreparedStatement ps ;
           String sql="select NID,fullName,gender from project.patient where userName=? and userPass=?";
           ps=con.prepareStatement(sql);
           ps.setString(1, userName);
           ps.setString(2, userPass);
           ResultSet rs =   ps.executeQuery();
           while(rs.next()){
            String nid = rs.getString("NID");
            String fullName = rs.getString("fullName");
            String gender = rs.getString("gender");
            p.setNID(nid);
            p.setFullName(fullName);
            p.setGender(gender);
            p.setUserName(userName);
            
        }
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
    return p;
    }
    public Doctor getDoctorObj(String userName,String userPass){
        Doctor dr= new Doctor() ;
         try {
           Statement stmt = con.createStatement();
           PreparedStatement ps ;
           String sql="select NID,fullName,specialization,gender from project.doctor where userName=? and userPass=?";
           ps=con.prepareStatement(sql);
           ps.setString(1, userName);
           ps.setString(2, userPass);
           ResultSet rs =   ps.executeQuery();
           while(rs.next()){
            String nid = rs.getString("NID");
            String fullName = rs.getString("fullName");
            String spec = rs.getString("specialization");
            String gender = rs.getString("gender");
            dr.setNID(nid);
            dr.setFullName(fullName);
            dr.setUserName(userName);
            dr.setSpecialization(spec);
            dr.setGender(gender);
        }
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
    return dr;
    }
    /*----------------Login----------------*/
    public int updatePassword(String newPassword, String email){
        int updated= 0;
        String sql="update project.patient set userPass = ? where patEmail = ?";
        PreparedStatement ps ;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, email);
            updated= ps.executeUpdate();
            closeConnection();
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return updated ;
    }
    public String checkAccount(Account acc){
       String sql;
       PreparedStatement ps ;
               // System.out.print(acc.getType());
                if("Admin".equals(acc.getType())){
                          sql = "select * from project.admin where userName=? and userPass=?";
                        }
                        else if("Doctor".equals(acc.getType())){
                            sql = "select * from project.doctor where userName=? and userPass=?";
                             }
                        else {
                            sql = "select * from project.patient where userName=? and userPass=?";
                            }
                
                try {
            
			ps = con.prepareStatement(sql);
                        ps.setString(1,acc.getUsername());
                        ps.setString(2,acc.getPassword());
			ResultSet rs  = ps.executeQuery();
                        
                       

            if(rs.next()) return acc.getUsername();
           
           
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return null;
        
    }
    /*----------------registeration----------------*/
     int addCard(Credit credit,String patID) {
        int updated = 0;
        try {
			
			String sql = "insert into project.credit(creditnumber,cardholdername,patientID) values(?,?,?)";
                        PreparedStatement ps = con.prepareStatement(sql);
                        ps.setString(1,credit.getCardNumber());
                        ps.setString(2,credit.getHolderName());
                        ps.setString(3,patID);
			updated = ps.executeUpdate();
                        closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        return updated;
    }
     
    int addClinic(Clinic c) {
int updated = 0;
        try {
			
			String sql = "insert into project.clinic(clinicName,cliniclocation,doctorID) values(?,?,?)";
                        PreparedStatement ps = con.prepareStatement(sql);
                        ps.setString(1,c.getClinicName());
                        ps.setString(2,c.getClinicLocation());
                        ps.setString(3,c.getDoctor().getNID());
                        
			updated = ps.executeUpdate();
                        closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        return updated;
    }

     int uploadDocument(Document doc, String patNID) {
         int updated = 0;
        try {
			
			String sql = "insert into project.document(documentID,documentName,documenttype,documentDate,patID,docID) values(?,?,?,?,?,?)";
                        PreparedStatement ps = con.prepareStatement(sql);
                        ps.setInt(1,doc.getDocumentid());
                        ps.setString(2,doc.getDocumentname());
                        ps.setString(3,doc.getDocumentType());
                        ps.setDate(4, (Date) doc.getDocumentDate());
                        ps.setString(5,patNID);
                        ps.setString(6,doc.getDoctor().getNID());
			updated = ps.executeUpdate();
                        closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        return updated;
    }
    	 public int registerPatient(Patient p){

		int updated = 0;
		
		try {
			
			//String sql = "insert into project.patient(fullname,username,userpass,nid,bloodtype,birthDate,patemail) values(?,?,?,?,?,?,?)";
			String sql = "insert into project.patient(fullname,username,userpass,nid,bloodtype,birthdate,patemail,gender) values(?,?,?,?,?,?,?,?)";
                        PreparedStatement ps = con.prepareStatement(sql);
                        ps.setString(1,p.getFullName());
                        ps.setString(2,p.getUserName());
                        ps.setString(3,p.getUserPass());
                        ps.setString(4,p.getNID());
                        ps.setString(5,p.getBloodType());
                        ps.setString(6,p.getBirthdate().toString() );
                        ps.setString(7,p.getPatEmail());
                        ps.setString(8,p.getGender());
                       // ps.executeUpdate();
			updated = ps.executeUpdate();
                        
			//,birthdate
		} catch (SQLException e) {
			e.printStackTrace();
		}/*finally{
			try {p.getBirthdate().toString()
				if(con != null)
                                    con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}*/
		
		return updated;
	}
    public int registerDoctor(Doctor dr){
        int updated = 0;
		
		try {
			
			//String sql = "insert into project.patient(fullname,username,userpass,nid,bloodtype,birthDate,patemail) values(?,?,?,?,?,?,?)";
			String sql = "insert into project.doctor(fullname,username,userpass,nid,gender,specialization,docemail) values(?,?,?,?,?,?,?)";
                        PreparedStatement ps = con.prepareStatement(sql);
                        ps.setString(1,dr.getFullName());
                        ps.setString(2,dr.getUserName());
                        ps.setString(3,dr.getUserPass());
                        ps.setString(4,dr.getNID());
                        ps.setString(5,dr.getGender());
                        ps.setString(7,dr.getDocEmail());
                        ps.setString(6,dr.getSpecialization());
                       // ps.executeUpdate();
			updated = ps.executeUpdate();
			//,birthdate
		} catch (SQLException e) {
			e.printStackTrace();
		}/*finally{
			try {p.getBirthdate().toString()
				if(con != null)
                                    con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}*/
		
		return updated;
    }
     public String searchName(String patientName) {
        
        try {
            String sql = "select NID from project.patient where userName=?";
                        PreparedStatement ps = con.prepareStatement(sql);
                        ps.setString(1,patientName);
                        
           ResultSet rs =   ps.executeQuery();
           
           
           if(rs.next()){
            String NID = rs.getString("NID");
            return NID;
        }
           else {
               return null;
           }
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
    public  ArrayList<String> returnNIDs(){
        ArrayList<String> NIDs = new ArrayList<>();
        
        try {
           Statement stmt = con.createStatement();
           ResultSet rs =   stmt.executeQuery("select NID from project.patient");
           while(rs.next()){
            String nid = rs.getString("NID");
            
            NIDs.add(nid);
            
        }
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return NIDs;
    }
    public  ArrayList<String> returnDoctorNIDs(){
        ArrayList<String> NIDs = new ArrayList<>();
        
        try {
           Statement stmt = con.createStatement();
           ResultSet rs =   stmt.executeQuery("select NID from project.doctor");
           while(rs.next()){
            String nid = rs.getString("NID");
            
            NIDs.add(nid);
            
        }
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return NIDs;
    }
    //check if a string is digits only
    public  boolean isParsable(String str) {
		try {
			Double.parseDouble(str);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}
      public int addPatientDisease(String disease, String NID) {
          int updated=0;
          try {
			
			String sql = "insert into project.patientchronicdiseases(disease_name,patID) values(?,?)";
                        PreparedStatement ps = con.prepareStatement(sql);
                        ps.setString(1,disease);
                        ps.setString(2,NID);
			updated = ps.executeUpdate();
                        closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
          return updated;
      }             
    /*
    ---------------------------------------------------------------------------------------------------------------------------
    DOCTOR DB CALLS
    */
    public ArrayList<Appointment> retrieveSpecificDocApp(String nid){
         ArrayList<Appointment> apps = new ArrayList<>();
         try{
            ResultSet result;
            PreparedStatement prp = con.prepareStatement("SELECT appDate,docid,appTime,clinicName,appLink\n"
                                     + "FROM project.appointment\n"
                                     + "WHERE docid =? ; ");
            prp.setString(1, nid);
            result = prp.executeQuery();
            while(result.next()){
                Appointment app = new Appointment();
                app.setAppDate(result.getDate(1));
                app.setAppTime(result.getTime(3));
                app.setClinicName(result.getString(4));
                app.setApplink(result.getString(5));
                apps.add(app);
            }
        }catch(SQLException e){
            System.out.println("There is an error!");
            e.printStackTrace();
            return null; 
        }
         return apps;
    }
    
    
    public ArrayList<Clinic> retrieveClinic(String nid){
         ArrayList<Clinic> cls = new ArrayList<>();
         try{
            ResultSet result;
            PreparedStatement prp = con.prepareStatement("SELECT clinicName,clinicLocation\n"
                                     + "FROM project.clinic\n"
                                     + "WHERE doctorid = ? ; ");
            prp.setString(1, nid);
            result = prp.executeQuery();
            while(result.next()){
                Clinic c = new Clinic();
                c.setClinicName(result.getString(1));
                c.setClinicLocation(result.getString(2));
                cls.add(c);
            }
        }catch(SQLException e){
            System.out.println("There is an error!");
            e.printStackTrace();
            return null; 
        }
         return cls;
    }
    
    public int addApp(String spec,Date appdate,String nid, int appPrice,Time apptime, String isOnline, String clinicName,String applink){
        int out =0;
        try{
                                 PreparedStatement prp = con.prepareStatement("INSERT INTO project.appointment (apptype,appDate,appstatus,docid,appPrice,appTime,isOnline,clinicName,appLink)\n"
                                                                       + "VALUES(?,?,?,?,?,?,?,?,?)");
                            prp.setString(1, spec);
                            prp.setDate(2, appdate);
                            prp.setString(3,"FREE");
                            prp.setString(4,nid);
                            prp.setInt(5,appPrice);
                            prp.setTime(6, apptime);
                            prp.setBoolean(7, (isOnline!=null?true:false));
                            prp.setString(8,clinicName);
                            prp.setString(9,applink);
                            out = prp.executeUpdate();
                            //request.getRequestDispatcher("Doctor/Appointments/successAdd.jsp").forward(request, response);
                        }catch(SQLException e){
                            e.printStackTrace();
                        }
        return out;
    }
    
    
    public ArrayList<Appointment> viewAppointments(String docid){
         ArrayList<Appointment> apps = new ArrayList<>();
         try{
            ResultSet result;
            Statement st = con.createStatement();
            PreparedStatement prp= con.prepareStatement("SELECT appDate,appTime,c.clinicName,clinicLocation,applink,appStatus,appid\n"
                                     + "FROM project.appointment a\n"
                                     + "JOIN project.doctor d on d.nid = a.docid\n"
                                     + "LEFT JOIN project.clinic c on c.clinicName = a.clinicName\n"
                                     + "where docid = ?"
                                     + "order by appdate desc; ");
            prp.setString(1,docid);
            result = prp.executeQuery();
            while(result.next()){
                Appointment app = new Appointment();
                app.setAppDate(result.getDate(1));
                app.setAppTime(result.getTime(2));
                app.setClinicName(result.getString(3));
                Clinic temp = new Clinic();
                temp.setClinicLocation(result.getString(4));
                app.setClinic(temp);
                app.setApplink(result.getString(5));
                app.setStatus(result.getString(6));
                app.setAppID(result.getInt(7));
                apps.add(app);
            }
        }catch(SQLException e){
            System.out.println("There is an error!");
            e.printStackTrace();
            return null; 
        }
         return apps;
    }
    
    public ArrayList<AppInvoice> viewHistory(String appid){
         ArrayList<AppInvoice> apps = new ArrayList<>();
         try{
            ResultSet result;
            Statement st = con.createStatement();
            PreparedStatement prp= con.prepareStatement("SELECT fullname,ai.appStatus,invdate\n"
                                     + "FROM project.appinvoice ai\n"
                                     + "JOIN project.patient p on p.nid = ai.patid\n"
                                     + "RIGHT JOIN project.appointment a on a.appid = ai.appid\n"
                                     + "LEFT JOIN project.clinic c on c.clinicName = a.clinicName\n"
                                     + "where a.appid = ?"
                                     + "order by invdate desc;");
            prp.setString(1,appid);
            result = prp.executeQuery();
            while(result.next()){
                AppInvoice app = new AppInvoice();
                Patient temp = new Patient();
                temp.setFullName(result.getString(1));
                app.setPatient(temp);
                app.setInvdate(result.getTimestamp(3));
                app.setAppStatus(result.getString(2));
                apps.add(app);
            }
        }catch(SQLException e){
            System.out.println("There is an error!");
            e.printStackTrace();
            return null; 
        }
         return apps;
    }
    /*
    -----------------------------------------------------------------------------------------------------------------------------------------------------
    PATIENT db calls
    */
    public ArrayList<Appointment> retrieveFreeOnlineApp(String apptype){
         ArrayList<Appointment> apps = new ArrayList<>();
         try{
            ResultSet result;
            Statement st = con.createStatement();
            result = st.executeQuery("SELECT fullname,specialization,appDate,appTime,appid,appPrice\n"
                                     + "FROM project.appointment,project.doctor\n"
                                     + "WHERE nid =docid and appstatus ='FREE' and isOnline = true and apptype = '"+apptype+"'");
            while(result.next()){
                Doctor dr = new Doctor();
                dr.setFullName(result.getString(1));
                dr.setSpecialization(result.getString(2));
                Appointment app = new Appointment();
                app.setDoctor(dr);
                app.setAppDate(result.getDate(3));
                app.setAppTime(result.getTime(4));
                app.setAppID(result.getInt(5));
                app.setAppPrice(result.getInt(6));
                apps.add(app);
            }
        }catch(SQLException e){
            System.out.println("There is an error!");
            e.printStackTrace();
            return null; 
        }
         return apps;
    }
    
    public ArrayList<Appointment> retrieveFreePhysApp(String apptype){
         ArrayList<Appointment> apps = new ArrayList<>();
         try{
            ResultSet result;
            Statement st = con.createStatement();
            result = st.executeQuery("SELECT fullname,specialization,appDate,appTime,appid,appprice,clinicName\n"
                                     + "FROM project.appointment,project.doctor\n"
                                     + "WHERE nid =docid and appstatus ='FREE' and isOnline = false and apptype='"+apptype+"'; ");
            while(result.next()){
                Doctor dr = new Doctor();
                dr.setFullName(result.getString(1));
                dr.setSpecialization(result.getString(2));
                Appointment app = new Appointment();
                app.setDoctor(dr);
                app.setAppDate(result.getDate(3));
                app.setAppTime(result.getTime(4));
                app.setAppID(result.getInt(5));
                app.setAppPrice(result.getInt(6));
                app.setClinicName(result.getString(7));
                apps.add(app);
            }
        }catch(SQLException e){
            System.out.println("There is an error!");
            e.printStackTrace();
            return null; 
        }
         return apps;
    }
    
    public ArrayList<Appointment> viewAppStatus(String patid){
         ArrayList<Appointment> apps = new ArrayList<>();
         try{
            ResultSet result;
            Statement st = con.createStatement();
            PreparedStatement prp= con.prepareStatement("SELECT distinct ai.appid,fullname,specialization,appDate,appTime,c.clinicName,c.clinicLocation,applink,ai.appstatus\n"
                                     + "FROM project.appinvoice ai\n"
                                     + "JOIN project.appointment a ON ai.appid= a.appid\n"
                                     + "JOIN project.doctor d on d.nid = a.docid\n"
                                     + "LEFT JOIN project.clinic c on c.clinicName = a.clinicName\n"
                                     + "where patid = ? and ai.appstatus in('BOOKED','DONE'); ");
            prp.setString(1,patid);
            result = prp.executeQuery();
            while(result.next()){
                Doctor dr = new Doctor();
                dr.setFullName(result.getString(2));
                dr.setSpecialization(result.getString(3));
                Appointment app = new Appointment();
                app.setDoctor(dr);
                app.setAppDate(result.getDate(4));
                app.setAppTime(result.getTime(5));
                app.setClinicName(result.getString(6));
                Clinic temp = new Clinic();
                temp.setClinicLocation(result.getString(7));
                app.setClinic(temp);
                app.setApplink(result.getString(8));
                AppInvoice tempap = new AppInvoice();
                tempap.setAppStatus(result.getString(9));
                app.setAppinv(tempap);
                app.setAppID(result.getInt(1));
                apps.add(app);
            }
        }catch(SQLException e){
            System.out.println("There is an error!");
            e.printStackTrace();
            return null; 
        }
         return apps;
    }
    
    public int bookAPP(String update){
        int out = 0;
        try{
                  Statement stmt = con.createStatement();
                out = stmt.executeUpdate("UPDATE project.appointment\n"
                                 + "SET appStatus = 'BOOKED'\n"
                                 + "WHERE appId ="+update);
            }catch(SQLException e){
                System.out.println("There is an error!");
                e.printStackTrace();
                }
        return out;
    }
    
    public int cancelAPP(String cancel){
        int out = 0;
        System.out.println(cancel);
        try{
                  Statement stmt = con.createStatement();
                out = stmt.executeUpdate("UPDATE project.appinvoice\n"
                                 + "SET appStatus = 'CANCELLED'\n"
                                 + "WHERE appId ="+cancel+";");
            }catch( SQLException e){
                System.out.println("There is an error");
                e.printStackTrace();
                }
        return out;
    }
    
    public ArrayList<Document> retrieveDocuments(String nid){
         ArrayList<Document> docs = new ArrayList<>();
         try{
            ResultSet result;
            PreparedStatement prp = con.prepareStatement("SELECT documentName,documenttype,documentdate,fullname\n"
                                     + "FROM project.document join project.doctor on docid=nid\n"
                                     + "WHERE patid =? ; ");
            prp.setString(1, nid);
            result = prp.executeQuery();
            while(result.next()){
                System.out.print("IN\n");
                Document d = new Document();
                Doctor doc = new Doctor();
                doc.setFullName(result.getString(4));
                d.setDoctor(doc);
                d.setDocumentname(result.getString(1));
                d.setDocumentType(result.getString(2));
                d.setDocumentDate(result.getDate(3));
                docs.add(d);
            }
        }catch(SQLException e){
            System.out.println("There is an error!");
            e.printStackTrace();
            return null; 
        }
         return docs;
    }
    
    
    public ArrayList<Credit> retrieveCredit(String nid){
         ArrayList<Credit> credit = new ArrayList<>();
         try{
            ResultSet result;
            PreparedStatement prp = con.prepareStatement("SELECT creditNumber\n"
                                     + "FROM project.credit\n"
                                     + "WHERE patientid =? ; ");
            prp.setString(1, nid);
            result = prp.executeQuery();
            while(result.next()){
                Credit c= new Credit();
                c.setCardNumber(result.getString(1));
                credit.add(c);
            }
        }catch(SQLException e){
            System.out.println("There is an error!");
            e.printStackTrace();
            return null; 
        }
         return credit;
    }
    
    
    /*
    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Appointment Related Queries
   
    */
    public int appPrice(String appid){
        int out = 21;
        try{
                  PreparedStatement prp = con.prepareStatement("SELECT appPrice\n"
                                                           + "FROM project.appointment\n"
                                                           + "WHERE appid =?");
                prp.setInt(1,Integer.parseInt(appid));
                ResultSet rs;
                rs = prp.executeQuery();
                if(rs.next())
                    out = rs.getInt(1);
            }catch(  SQLException e){
                System.out.println("There is an error!");
                e.printStackTrace();
                }
        return out;
    }
    
    public ArrayList<String> retrieveAppnames(){
        ArrayList<String> apps = new ArrayList();
        try{
                    PreparedStatement prp = con.prepareStatement("SELECT distinct appType\n"
                                                           + "FROM project.appointment\n");
                ResultSet rs;
                rs = prp.executeQuery();
                while(rs.next())
                    apps.add(rs.getString(1));
            }catch( SQLException e){
                System.out.println("There is an error!");
                e.printStackTrace();
                }
        return apps;
    }
    
    public String appDocID(String appid){
        String out=null;
        try{
                    PreparedStatement prp = con.prepareStatement("SELECT docid\n"
                                                           + "FROM project.appointment\n"
                                                           + "WHERE appid =?");
                prp.setString(1,appid);
                ResultSet rs;
                rs = prp.executeQuery();
                if(rs.next())
                    out = rs.getString(1);
            }catch( SQLException e){
                System.out.println("There is an error!");
                e.printStackTrace();
                }
        return out;
    }
    
    public Appointment checkSchedule(String ndate,String ntime){
        Appointment out=null;
        try{
                    PreparedStatement prp = con.prepareStatement("SELECT *\n"
                                                           + "FROM project.appointment\n"
                                                           + "WHERE appdate =? and apptime= ?");
                prp.setString(1,ndate);
                prp.setString(2,ntime);
                ResultSet rs;
                rs = prp.executeQuery();
                if(rs.next()){
                    out = new Appointment();
                }
                   
            }catch( SQLException e){
                System.out.println("There is an error!");
                e.printStackTrace();
                }
        return out;
    }
    
    public int changeSchedule(String ndate,String ntime,Date olddate,Time oldTime){
        int out = 0;
        Date date = Date.valueOf(ndate);
        Time time = Time.valueOf(ntime+":00");
        try{
                            Timestamp today = Timestamp.valueOf(LocalDateTime.now());
                                 PreparedStatement prp = con.prepareStatement("UPDATE project.appointment\n"
                                                                       + "SET appdate= ?,apptime=?"
                                                                       + "where appdate = ? and apptime = ?");
                            prp.setString(1,ndate );
                            prp.setString(2, ntime);
                            prp.setDate(3, olddate);
                            prp.setTime(4, oldTime);
                            out = prp.executeUpdate();
                            //request.getRequestDispatcher("Doctor/Appointments/successAdd.jsp").forward(request, response);
                        }catch( SQLException e){
                            e.printStackTrace();
                            return 0;
                        }
        return out;
    }
    
    public int addAppInv(String appid,String nid){
        int out = 0;
        try{
                            Timestamp today = Timestamp.valueOf(LocalDateTime.now());
                              PreparedStatement prp = con.prepareStatement("INSERT INTO project.appinvoice\n"
                                                                       + "VALUES('BOOKED',?,?,?)");
                            prp.setString(1,appid );
                            prp.setString(2, nid);
                            prp.setTimestamp(3,today);
                            out = prp.executeUpdate();
                            //request.getRequestDispatcher("Doctor/Appointments/successAdd.jsp").forward(request, response);
                        }catch( SQLException e){
                            e.printStackTrace();
                            return 0;
                        }
        return out;
    }
    
    
    public int freeApp(String update){
        int out = 0;
        try{
                 Statement stmt = con.createStatement();
                out = stmt.executeUpdate("UPDATE project.appointment\n"
                                 + "SET appStatus = 'FREE'\n"
                                 + "WHERE appId ="+update);
            }catch( SQLException e){
                System.out.println("There is an error!");
                e.printStackTrace();
                }
        return out;
    }
    
    public int deleteApp(String update){
        int out = 0;
        try{
                   Statement stmt = con.createStatement();
                out = stmt.executeUpdate("DELETE FROM project.appointment\n"
                                 + "WHERE appId ="+update);
            }catch( SQLException e){
                System.out.println("There is an error!");
                e.printStackTrace();
                }
        return out;
    }
    
    public int deleteAppInv(String update){
        int out = 0;
        try{
                    Statement stmt = con.createStatement();
                out = stmt.executeUpdate("DELETE FROM project.appinvoice\n"
                                 + "WHERE appId ="+update);
            }catch( SQLException e){
                System.out.println("There is an error!");
                e.printStackTrace();
                }
        return out;
    }
    //--------------------------Admin Actions------------------------------------------------------------------------------
    
    public int addPharItem(String iname,int iprice, int quan,String man){
        int out = 0;
        try{
                            Timestamp today = Timestamp.valueOf(LocalDateTime.now());
                                PreparedStatement prp = con.prepareStatement("INSERT INTO project.pharitem\n"
                                                                       + "VALUES(?,?,?,?,?)");
                            prp.setString(1, iname+"001");
                            prp.setString(2,iname );
                            prp.setString(3, man);
                            prp.setInt(4,iprice);
                            prp.setInt(5,quan);
                            out = prp.executeUpdate();
                            //request.getRequestDispatcher("Doctor/Appointments/successAdd.jsp").forward(request, response);
                        }catch( SQLException e){
                            e.printStackTrace();
                            return 0;
                        }
        return out;
    }
    
    public int deletePharItem(String iname){
        int out = 0;
        try{
                   Statement stmt = con.createStatement();
               
                out = stmt.executeUpdate("Delete from project.pharitem where itemName = '"+iname+"'");
            }catch( SQLException e){
                System.out.println("There is an error!");
                e.printStackTrace();
                }
        return out;
    }
    public ArrayList<PharItem> retrPharitems(){
        ArrayList<PharItem> out= new ArrayList<>();
        try{
                   Statement st = con.createStatement();
                ResultSet rs;
                rs = st.executeQuery("SELECT itemName, itemPrice,quantityinstock\n"
                                   + "FROM project.pharitem");
                while(rs.next()){
                    PharItem pt = new PharItem();
                    pt.setItemName(rs.getString(1));
                    pt.setItemPrice(rs.getInt(2));
                    pt.setItemQuantity(rs.getInt(3));
                    out.add(pt);
                }
                   
            }catch(SQLException e){
                System.out.println("There is an error!");
                e.printStackTrace();
                }
        return out;
    }
     //-------------------------PharItem Ations-------------------------------------------------------------------------------------------------------------------------
    
    public int retrieveQuan(String iname){
         int quan = 0;
         try{
            ResultSet result;
            PreparedStatement prp = con.prepareStatement("SELECT quantityinstock\n"
                                     + "FROM project.pharitem\n"
                                     + "WHERE itemName =? ; ");
            prp.setString(1, iname);
            result = prp.executeQuery();
            while(result.next()){
               quan = result.getInt(1);
            }
        }catch(SQLException e){
            System.out.println("There is an error!");
            e.printStackTrace();
            return 0; 
        }
         return quan;
    }
    
    public int decreasequan(String update,int quan){
        int out = 0;
        int itemQuan = retrieveQuan(update);
        int newquan = itemQuan-quan;
        try{
                  Statement stmt = con.createStatement();
                out = stmt.executeUpdate("UPDATE project.pharitem\n"
                                 + "SET quantityinstock ="+newquan+"\n"
                                 + "WHERE itemname ='"+update+"'");
            }catch(  SQLException e){
                System.out.println("There is an error!");
                e.printStackTrace();
                }
        return out;
    }
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  

    

   

   
}
// if connection!=null then do not start redundant connection