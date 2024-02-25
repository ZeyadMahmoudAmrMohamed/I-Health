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
@WebServlet(name = "delPharItemController", urlPatterns = {"/delPharItemController"})
public class delPharItemController extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String iname = request.getParameter("iname");
       
            int del = Admin.DeleteItemFromPharDB(iname);
            if(del<1){
                request.getRequestDispatcher("Admin/adminDeleteItem.jsp").include(request, response);
                out.print("<h1>Failed To delete</h1>");
            }else{
                request.getRequestDispatcher("Admin/adminDeleteItem.jsp").include(request, response);
                out.print("<h1>Deletion Successful</h1>");
            }
        
    }

   

 
}
