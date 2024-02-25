/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import webAppObjects.AppInvoice;

/**
 *
 * @author ali_shar
 */
@WebServlet(name = "bookingConfirmController", urlPatterns = {"/bookingConfirmController"})
public class bookingConfirmController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "Patient/TransactionAndPayments/paymentSuccessful.jsp";
        String appid = request.getParameter("update");
        String nid = request.getParameter("nid");
        if(AppInvoice.confirmBooking(appid, nid) > 0){
            request.getRequestDispatcher(url).forward(request, response);
        }
        else{
            response.setContentType("text/html");
            request.getRequestDispatcher("Patient/Appointments/patientAppBook.jsp").include(request, response);
            PrintWriter out = response.getWriter();
            out.println("COULD NOT CREATE APP INVOICE");
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
