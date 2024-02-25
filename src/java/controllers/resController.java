/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import webAppObjects.Appointment;
import webAppObjects.Doctor;

/**
 *
 * @author ali_shar
 */
@WebServlet(name = "resController", urlPatterns = {"/resController"})
public class resController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.print("yes");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String error_url ="Doctor/Appointments/reschForm.jsp";
        String ndate = request.getParameter("ndate");
        String ntime = request.getParameter("ntime");
        HttpSession session = request.getSession();
        if(!request.getParameter("otime").equals("null") && !request.getParameter("odate").equals("null")){
            System.out.print("IN\n");
            System.out.println(request.getParameter("otime"));
            session.setAttribute("otime",request.getParameter("otime"));
            session.setAttribute("odate",request.getParameter("odate"));
        }
        
        
        if(ndate.equals("") && ntime.equals("")){
            request.getRequestDispatcher(error_url).include(request, response);
            out.print("<h1>PLEASE COMPLETE DATA</h1>");
        }
        else {
            boolean flag=true;
            Date olddate = Date.valueOf((String)session.getAttribute("odate"));
            Time oldtime = Time.valueOf((String)session.getAttribute("otime"));
            
            if (!ntime.equals("")){
                Time newtime = Time.valueOf(ntime+":00");
                boolean case1 = newtime.compareTo(Time.valueOf(LocalTime.now()))<0;
                boolean case2 = olddate.compareTo(Date.valueOf(LocalDate.now()))==0;
                //boolean case3 = !ndate.equals("") && (Date.valueOf(ndate)).compareTo(Date.valueOf(LocalDate.now()))<0;
                if( case1 && case2){
                 request.getRequestDispatcher(error_url).include(request, response);
                 out.print("<h1>PLEASE Enter Correct Time</h1>");
                 flag=false;
                }
            }
            if(!ndate.equals("")){
                Date newdate = Date.valueOf(ndate);
                if(newdate.compareTo(Date.valueOf(LocalDate.now()))<0){
                 if(flag)
                    request.getRequestDispatcher(error_url).include(request, response);
                 out.print("<h1>PLEASE Enter Correct Date</h1>");   
                }
            }
            String querydate = ndate.equals("")?(String)(session.getAttribute("odate")):ndate;
            String querytime = ntime.equals("")?(String)(session.getAttribute("otime")):ntime;
            Appointment test = Appointment.checkSchedule(querydate, querytime);
            if(test==null){
                if(Doctor.rescheduleAppointment(querydate, querytime,olddate,oldtime)>0)
                    request.getRequestDispatcher("Doctor/Appointments/successResched.jsp").forward(request, response);
                else{
                 request.getRequestDispatcher(error_url).include(request, response);
                 out.print("<h1>Could not upload data</h1>");
                }
            }else{
                 request.getRequestDispatcher(error_url).include(request, response);
                 out.print("<h1>DATA EXISTS</h1>");
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
