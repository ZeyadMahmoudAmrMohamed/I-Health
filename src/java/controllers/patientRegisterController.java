package controllers;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import webAppObjects.DB;


@WebServlet(name = "patientRegisterController", urlPatterns = {"/patientRegisterController"})
public class patientRegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          PrintWriter out = response.getWriter();
  out.print("this is do GET");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
             
        HttpSession session = request.getSession();
        String fullName = request.getParameter("fullName");
        String userName = request.getParameter("userName");
        String patEmail = request.getParameter("patEmail");
        String userPass = request.getParameter("userPass");
        String NID = request.getParameter("NID");
        String birthDateString = request.getParameter("birthDate");
        Date birthDate = Date.valueOf(birthDateString);
        request.setAttribute("birthDateSQL", birthDate);
        String bloodtype = request.getParameter("bloodType");
        String gender = request.getParameter("gender");
        String confirmPass = request.getParameter("confirmPass");
        String[] chronicDiseases = request.getParameterValues("chronicDiseases");
        boolean flag = false;
        
       
       RequestDispatcher correctRD = request.getRequestDispatcher("Patient/Register/controlPatientRegister.jsp");
       RequestDispatcher registerRD = request.getRequestDispatcher("Patient/Register/patientRegisterationForm.jsp");
       DB database = new DB();
       ArrayList<String> NIDs = database.returnNIDs();
       database.closeConnection();
       if(NIDs.contains(NID)||!database.isParsable(NID)||NID.length()!=14){
           request.setAttribute("NID","invalid");
           flag=true;
           //||!database.isParsable(NID)
       }
       else{
           request.setAttribute("NID","valid");
       }
       
       if(userPass.length()<8){
           request.setAttribute("userPass","invalid");
           flag=true;
       }
       else{
           request.setAttribute("userPass","valid");
       }
       if(birthDate.after(Date.valueOf("2003-12-31"))){
           request.setAttribute("birthDate","invalid");
           flag=true;
       }
       else{
           request.setAttribute("birthDate","valid");
       }
       if(!(confirmPass.equals(userPass))){
           request.setAttribute("confirmPass","invalid");
           flag=true;
       }
       else{
           request.setAttribute("confirmPass","valid");
       }
       if(flag){
           request.setAttribute("email", "valid");
           request.setAttribute("userName", "valid");
           request.setAttribute("fullName", "valid");
           
       request.setAttribute("emailValue", patEmail);
       request.setAttribute("fullNameValue",fullName);
       request.setAttribute("userNameValue",userName);
       request.setAttribute("NIDValue",NID);
       request.setAttribute("birthDateValue",birthDate);
       request.setAttribute("userPassValue",userPass);
       registerRD.forward(request, response);
       }
       else{
       request.setAttribute("chronicDiseases", chronicDiseases);
       correctRD.forward(request, response);
       }
     }
    }
    
   

