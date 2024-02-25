/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import webAppObjects.PharItem;

/**
 *
 * @author ali_shar
 */
@WebServlet(name = "quanController", urlPatterns = {"/quanController"})
public class quanController extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] items = request.getParameterValues("select_item");
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        if(items!=null){
            HashMap<String,Integer> quanHash = new HashMap();
            for(String item:items){
                Integer quanInStock = PharItem.retrieveQuan(item);
                Integer quan;
                try{
                    quan = Integer.valueOf(request.getParameter(item+"quan"));
                }catch(Exception e){
                    request.getRequestDispatcher("Patient/Pharm/pharmacy.jsp").include(request, response);
                    out.print("ERROR: "+item+" Quantity was empty");
                    return;
                }
                if(quan>quanInStock){
                    request.getRequestDispatcher("Patient/Pharm/pharmacy.jsp").include(request, response);
                    out.print("ERROR: "+item+" Entered Quantity: "+quan+" is more than stock: "+quanInStock);
                    return;
                }
                if(quan<0){
                    request.getRequestDispatcher("Patient/Pharm/pharmacy.jsp").include(request, response);
                    out.print("ERROR: Please Enter A positive value for quantity at "+item);
                    return;
                }
                quanHash.put(item, quan);
        }
        HttpSession session = request.getSession();
        session.setAttribute("items", quanHash);
        request.getRequestDispatcher("Patient/Pharm/checkout.jsp").forward(request, response);
      }else{
            request.getRequestDispatcher("Patient/Pharm/pharmacy.jsp").include(request, response);
            out.print("ERROR: YOU DID NOT CHOOSE ANYTHING");
        }    
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
