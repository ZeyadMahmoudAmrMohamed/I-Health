/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import webAppObjects.DB;

/**
 *
 * @author zizof
 */
@WebServlet(name = "doctorRegisterController", urlPatterns = {"/doctorRegisterController"})
public class doctorRegisterController extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
      @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
             
        HttpSession session = request.getSession();
        String fullName = request.getParameter("fullName");
        String userName = request.getParameter("userName");
        String docEmail = request.getParameter("docEmail");
        String userPass = request.getParameter("userPass");
        String NID = request.getParameter("NID");
        String gender = request.getParameter("gender");
        String confirmPass = request.getParameter("confirmPass");
       
        boolean flag = false;
        
       
       RequestDispatcher correctRD = request.getRequestDispatcher("Doctor/Register/controlDoctorRegister.jsp");
       RequestDispatcher registerRD = request.getRequestDispatcher("Doctor/Register/doctorRegistrationForm.jsp");
       DB database = new DB();
       ArrayList<String> NIDs = database.returnDoctorNIDs();
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
           
       request.setAttribute("emailValue", docEmail);
       request.setAttribute("fullNameValue",fullName);
       request.setAttribute("userNameValue",userName);
       request.setAttribute("NIDValue",NID);
       request.setAttribute("userPassValue",userPass);
       registerRD.forward(request, response);
       }
       else{
       correctRD.forward(request, response);
       }
     }
   
    


}
