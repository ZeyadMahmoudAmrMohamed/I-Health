
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import webAppObjects.Account;
import webAppObjects.Admin;
import webAppObjects.DB;
import webAppObjects.Doctor;
import webAppObjects.Patient;

/**
 *
 * @author zizof
 */
@WebServlet(name = "loginController", urlPatterns = {"/loginController"})
public class loginController extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("username");
        String userPass = request.getParameter("password");
        String userType = request.getParameter("type");
        
        Account acc = new Account();
        RequestDispatcher adminRD = request.getRequestDispatcher("Admin/homepage.jsp");
        RequestDispatcher doctorRD = request.getRequestDispatcher("Doctor/homepage.jsp");
        RequestDispatcher patientRD = request.getRequestDispatcher("Patient/patientHomePage.jsp");
        RequestDispatcher loginRD = request.getRequestDispatcher("Login/login.jsp");
        
        
        acc.setUsername(userName);
        acc.setPassword(userPass);
        acc.setType(userType);
        String name = acc.checkAccount();
        if(name==null){
            request.setAttribute("check","invalid");
            loginRD.forward(request, response);
        }else{HttpSession session = request.getSession();
            session.setAttribute("test","ali");
            session.setAttribute("userName",name);
            if("Admin".equals(userType)){   //admin
                            DB d = new DB();
                            Admin admin = d.getAdminObj(userName,userPass);
                            d.closeConnection();
                            session.setAttribute("adminObj",admin);
                            adminRD.forward(request, response);
                        }
                        else if("Doctor".equals(userType)){ //doctor
                            
                            DB d = new DB();
                            Doctor dr = d.getDoctorObj(userName,userPass);
                            d.closeConnection();
                            session.setAttribute("doctorObj",dr);
                            doctorRD.forward(request, response);
                        }
                        else {// patient
                            DB d = new DB();
                            Patient p = d.getPatientObj(userName,userPass);
                            d.closeConnection();
                            session.setAttribute("patientObj",p);
                            patientRD.forward(request, response);
                            }
        }
    }

   
}
