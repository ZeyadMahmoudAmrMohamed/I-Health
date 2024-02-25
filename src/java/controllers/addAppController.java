/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import webAppObjects.Appointment;
import webAppObjects.Doctor;

/**
 *
 * @author ali_shar
 */
@WebServlet(name = "addAppController", urlPatterns = {"/addAppController"})
public class addAppController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        String apptimeString=request.getParameter("apptime");
        String appdateString = request.getParameter("appdate");
        String applink = request.getParameter("applink");
        String clinicName = request.getParameter("clinic");
        String errorPath;
        if(request.getParameter("online")!=null)
            errorPath = "Doctor/Appointments/addOnlineApp.jsp";
        else
            errorPath = "Doctor/Appointments/addPhysicalApp.jsp";
        int appPrice;
        try{
            appPrice = Integer.parseInt(request.getParameter("appprice"));
        }catch(Exception e){
            appPrice = 0;
        }
        //if any of the data is null
        // a wierd behavior is happening with applink even nothing is sent the variable is never null (wierd????)
        if(apptimeString == null || appdateString == null || ( applink!=null && (applink.equals("") &&request.getParameter("online")!=null) ) || (  clinicName==null &&request.getParameter("online")==null ) || appPrice == 0 ){
            request.getRequestDispatcher(errorPath).include(request,response);
            out.println("<br />PLEASE COMPLETE DATA!<br />");
        }
        else{
            apptimeString = apptimeString+":00";
         Time apptime = Time.valueOf(apptimeString);
         Date appdate = Date.valueOf(appdateString);
         //if user enters negative price
         if(appPrice <0){
             request.getRequestDispatcher(errorPath).include(request,response);
            out.println("<br />PLEASE ENTER A POSITIVE NUMBER FOR THE PRICE!");
         }
         //if user inputs past date
         else if(appdate.compareTo(Date.valueOf(LocalDate.now())) < 0 ){
            request.getRequestDispatcher(errorPath).include(request,response);
            out.println("<br />PLEASE ENTER A CORRECT DATE!");
         }else{
             //the case of today but past time
             //IMPORTANT NOTE EL LOCAL TIME SHAGHAL 3Al OLD TIMING :(
             if((apptime.compareTo(Time.valueOf(LocalTime.now())) < 0 || apptime.compareTo(Time.valueOf(LocalTime.now())) == 0) && appdate.compareTo(Date.valueOf(LocalDate.now())) == 0 ){
                 request.getRequestDispatcher(errorPath).include(request,response);
                 out.println("<br/>PLEASE ENTER A CORRECT TIME!");
             }//if all conditions satisfy start db check
             else{
                    Connection con=null;
                     ArrayList<Appointment> apps  = Doctor.retrieveAppfromDB(request.getParameter("nid") );
                     for(Appointment app:apps){
                         if(request.getParameter("online")!=null){
                             if(app.getAppDate().compareTo(appdate) == 0 && app.getAppTime().compareTo(apptime) == 0 && app.getApplink().equals(applink)){
                                 request.getRequestDispatcher(errorPath).include(request,response);
                                 out.println("<br/>DATA EXISTS!");
                             }
                         }
                         if(request.getParameter("physical")!=null){
                             if(app.getAppDate().compareTo(appdate) == 0 && app.getAppTime().compareTo(apptime) == 0 && app.getClinicName().equals(clinicName)){
                                 request.getRequestDispatcher(errorPath).include(request,response);
                                 out.println("<br/>DATA EXISTS!");
                             }
                         }
                     }
                     //if all conditions satisfy ALL GOOODD YYYAAAAYYY ::)))) //i got lost from all the if X(
                                          //--------------------------------------------
                      String spec = request.getParameter("spec");
                      String nid = request.getParameter("nid");
                      String isOnine = request.getParameter("online");
                      
                      if(Doctor.addApp(spec, appdate, nid, appPrice, apptime, isOnine, clinicName, applink) > 0)
                        request.getRequestDispatcher("Doctor/Appointments/successAdd.jsp").forward(request, response);
                      else{
                          request.getRequestDispatcher(errorPath).include(request,response);
                          out.println("<br/>Error in inserting data!");
                      }
          }
        }
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
