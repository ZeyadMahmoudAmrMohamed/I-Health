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
import webAppObjects.Admin;

/**
 *
 * @author ali_shar
 */
@WebServlet(name = "AddIController", urlPatterns = {"/AddIController"})
public class AddIController extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String iname = request.getParameter("iname");
        String iprice = request.getParameter("iprice");
        String quanString = request.getParameter("quantity");
        String man = request.getParameter("iman");
        int quan;
        int price;
        try{
            quan = Integer.parseInt(quanString);
            price = Integer.parseInt(iprice);
        }catch(Exception e){
            quan = 0;
            price = 0;
        }
        if(quan==0 || iname.equals("") || price == 0 || man.equals("")){
            request.getRequestDispatcher("Admin/adminAddItem.jsp").include(request, response);
            out.print("<h1>Please complete data</h1>");
        }
        else if(price <0){
            request.getRequestDispatcher("Admin/adminAddItem.jsp").include(request, response);
            out.print("<h1>Please Enter A Positive Number For Price</h1>");
        }
        else{
            int add = Admin.addItem(iname, price, man, quan);
            if(add<1){
                request.getRequestDispatcher("Admin/adminAddItem.jsp").include(request, response);
                out.print("<h1>Failed to add item</h1>");
            }else{
                request.getRequestDispatcher("Admin/adminAddItem.jsp").include(request, response);
                out.print("<h1>Added Item SuccessFully</h1>");
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
