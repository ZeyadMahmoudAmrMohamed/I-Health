/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import webAppObjects.Account;
import webAppObjects.Appointment;
import webAppObjects.Doctor;
import webAppObjects.Patient;

/**
 *
 * @author ali_shar
 */
@WebServlet(name = "cancelController", urlPatterns = {"/cancelController"})
public class cancelController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Enumeration pnames = request.getParameterNames();
        Object Appid=null;
        while(pnames.hasMoreElements()){
            Appid = pnames.nextElement();
        }
        String url;
        url = "Doctor/Appointments/viewApp.jsp";
        String appid = ((String)Appid).replaceAll("[^0-9]", "");
        
         if( (Account.deleteAppInv(appid) > 0 && Doctor.deleteAppointment((String)appid) > 0) || Doctor.deleteAppointment((String)appid) > 0){
                request.getRequestDispatcher(url).include(request, response);
            }
            else{
                request.getRequestDispatcher(url).include(request, response);
                PrintWriter out = response.getWriter();
                response.setContentType("text/html");
                out.print("<h1>Failed To Cancel</h1>");
            }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //important note both the doctor and patient cancel so i used the same function from the patient class
        
        //obtaining the appid
        Enumeration pnames = request.getParameterNames();
        Object appid=null;
        while(pnames.hasMoreElements()){
            appid = pnames.nextElement();
        }
        String url;
        url = "Patient/Appointments/patientViewApp.jsp";
        
         if(Account.cancelAppointment((String)appid) > 0 && Appointment.freeApp((String)appid) > 0){
                request.getRequestDispatcher(url).include(request, response);
            }
            else{
                request.getRequestDispatcher(url).include(request, response);
                PrintWriter out = response.getWriter();
                response.setContentType("text/html");
                out.print("<h1>Failed To Cancel</h1>");
            }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
