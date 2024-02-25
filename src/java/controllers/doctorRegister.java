package controllers;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author zizof
 */
@WebServlet(name = "doctorRegister", urlPatterns = {"/doctorRegister"})
public class doctorRegister extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          PrintWriter out = response.getWriter();
          out.print(request.getServletPath());
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             PrintWriter out = response.getWriter();
  //out.print(request.getServletPath());
             String fullName= request.getParameter("fullName");
        String userName= request.getParameter("userName");
        String docEmail= request.getParameter("docEmail");
        String userPass= request.getParameter("userPass");
        String NID= request.getParameter("NID");
        String specialization= request.getParameter("specialization");
        String bloodtype= request.getParameter("bloodType");
       
        try{
         
            Connection con;
             
            Class.forName("com.mysql.jdbc.Driver");
           //   out.print("hello");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","advancedprogramming");
         //  out.println("Connected");
            String sql = "insert into project.doctor(fullname,username,userpass,nid,specialization,docemail) values(?,?,?,?,?,?)";
       //    out.println("check");
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,fullName);
            ps.setString(2,userName);
            ps.setString(3,userPass);
            ps.setString(4,NID);
            ps.setString(5,specialization);
            ps.setString(6, docEmail);
            ps.executeUpdate();
            RequestDispatcher rd = request.getRequestDispatcher("index.html");
            rd.forward(request,response);
        }catch(Exception e){
            out.println("Error:: "+e.getMessage());
        }//../../web/
    }
    
   
}
