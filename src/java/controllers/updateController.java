/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import webAppObjects.Patient;
import webAppObjects.PharItem;

/**
 *
 * @author ali_shar
 */
@WebServlet(name = "updateController", urlPatterns = {"/updateController"})
public class updateController extends HttpServlet {


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
       @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         PrintWriter out = response.getWriter();
         response.setContentType("text/html");
        if(request.getParameter("booking")!=null){
            if(Patient.scheduleAppointment(request.getParameter("update")) > 0){
                String url = "bookingConfirmController";
                request.getRequestDispatcher(url).forward(request, response);
            }
            else{
                String url = "Patient/Appointments/patientOnline.jsp";
                request.getRequestDispatcher(url).include(request, response);
                out.print("<h1>Failed To BOOK</h1>");
            }
        }
        if(request.getParameter("pharm")!=null){
            HttpSession session = request.getSession();
            String[] items = (String[]) session.getAttribute("selected");
            HashMap<String,Integer> hashquan = (HashMap<String,Integer>)session.getAttribute("items");
            for(String item:items){
                if(PharItem.decreaseQuan(item, hashquan.get(item))<1){
                    String url = "Patient/Pharm/pharmacy.jsp";
                    request.getRequestDispatcher(url).include(request, response);
                    out.print("<h1>Failed To Purchase ITEM</h1>");
                    return;
                }    
            }
            request.getRequestDispatcher("Patient/TransactionAndPayments/paymentSuccessful.jsp").forward(request,response);
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
