package controllers;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ali_shar
 */
@WebServlet(urlPatterns = {"/docAppBridge"})
public class docAppBridge extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    //this enumeration just retrieves the id of the sent appointment
    Enumeration pnames = request.getParameterNames();
    Object appid=null;
     PrintWriter out = response.getWriter();
    while(pnames.hasMoreElements()){
        appid = pnames.nextElement();
        out.print(appid);
        
        //ther if is only bandage to to a weird problem=> in all forms the button is always the last element except when it comes from the reschedule
        if(!((String)appid).contains("date") && !((String)appid).contains("time") && ((String)appid).contains("res"))
            break;
    }
    String digit=((String)appid).replaceAll("[^0-9]","");
    request.setAttribute("appid",(String)digit);
    if(((String)appid).equals("his"+digit)){
        request.getRequestDispatcher("Doctor/Appointments/viewHistory.jsp").forward(request,response);
    }else if(((String)appid).equals("can"+digit)){
        request.getRequestDispatcher("cancelController").forward(request,response);
    }else if(((String)appid).equals("res"+digit)){
        request.setAttribute("appid", digit);
        request.getRequestDispatcher("Doctor/Appointments/reschForm.jsp").forward(request, response);
    } 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
