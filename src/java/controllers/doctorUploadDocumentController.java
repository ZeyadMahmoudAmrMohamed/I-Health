
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import webAppObjects.DB;

/**
 *
 * @author zizof
 */
@WebServlet(name = "doctorUploadDocumentController", urlPatterns = {"/doctorUploadDocumentController"})
public class doctorUploadDocumentController extends HttpServlet {

   
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String documentID = request.getParameter("documentID");
        String patientName = request.getParameter("patientName");
        String documentName = request.getParameter("documentName");
        String documenttype = request.getParameter("documenttype");
        String documentDateString = request.getParameter("documentDate");
        Date documentDate = Date.valueOf(documentDateString);
        request.setAttribute("documentDateSQL", documentDate);
               boolean flag = false;
       RequestDispatcher correctRD = request.getRequestDispatcher("Doctor/Documents/controlDocumentUpload.jsp");
       RequestDispatcher registerRD = request.getRequestDispatcher("Doctor/Documents/addDocumentForm.jsp");
       DB database = new DB();
       String patNID = database.searchName(patientName);
       database.closeConnection();
       if(patNID==null){
           request.setAttribute("patientName","invalid");
           flag=true;
       }
       else{
           request.setAttribute("patientName","valid");
                      request.setAttribute("patientNameValue", patientName);

       }
       
       if(!database.isParsable(documentID)){
           request.setAttribute("documentID","invalid");
           flag=true;
       }
       else{
           request.setAttribute("documentID","valid");
           request.setAttribute("documentIDValue", documentID);
       }
       if(documentDate.after(new Date(System.currentTimeMillis()))){
           request.setAttribute("documentDate","invalid");
           flag=true;
       }
       else{
           request.setAttribute("documentDate","valid");
       }
       
       if(flag){
           request.setAttribute("documentName", "valid");
           
       request.setAttribute("documentNameValue", documentName);
       
       registerRD.forward(request, response);
       }
       else{
        request.setAttribute("patNID", patNID);
       correctRD.forward(request, response);
       }
     }
        

}
