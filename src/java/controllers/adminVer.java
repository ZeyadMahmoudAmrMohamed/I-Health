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

/**
 *
 * @author EZZ
 */
@WebServlet(name = "adminVer", urlPatterns = {"/adminVer"})
public class adminVer extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String pass = request.getParameter("pass");
        String uname = request.getParameter("user");
        if (pass.equals("123"))
        {
            request.getRequestDispatcher("Admin/adminActions.jsp").forward(request, response);
        }
        else if(!pass.equals("123"))
        {
            response.setContentType("text/html");
            out.print("invalid password");
            request.getRequestDispatcher("Admin/adminLogin.jsp").include(request, response);
        }
    }

}
