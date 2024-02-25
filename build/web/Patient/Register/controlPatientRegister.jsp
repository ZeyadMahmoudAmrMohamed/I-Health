<%-- 
    Document   : controlPatientRegister
    Created on : May 5, 2023, 1:35:17 PM
    Author     : zizof
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Register Controller</title>
    </head>
    
    <jsp:useBean id= "database" scope= "application" class= "webAppObjects.DB"></jsp:useBean> 
                
    
            <jsp:useBean id= "patient" scope= "page" class= "webAppObjects.Patient">
                <jsp:setProperty name="patient" property="*"></jsp:setProperty>
            </jsp:useBean> 
        
    
            <% String birthDateString = request.getParameter("birthDate");
        Date bdate = Date.valueOf(birthDateString);
        patient.setBirthdate(bdate);
        String[] chronicDiseases = (String[])request.getAttribute("chronicDiseases");
        if(chronicDiseases!=null){
        for(String chronicDisease: chronicDiseases){
        patient.addDisease(chronicDisease);
                }
       // patient.setChronicDiseases(chronicDiseases);
                }
          int check1 = patient.registerPatient();
          if(check1>0){
         
          //../../Login/login.jsp
          RequestDispatcher rd = request.getRequestDispatcher("registrationSuccessful.jsp");
            rd.include(request, response);
                }
                else {
            out.print("<b>Registeration Failed</b>");
            RequestDispatcher rdFail = request.getRequestDispatcher("patientRegisterationForm.jsp");
            rdFail.include(request, response);
                }
                %>
           
            <%database.closeConnection();%>
           
            
    

