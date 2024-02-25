<%-- 
    Document   : controlDoctorRegister
    Created on : May 7, 2023, 6:27:36 AM
    Author     : zizof
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Register Controller</title>
    </head>
  
<jsp:useBean id= "database" scope= "application" class= "webAppObjects.DB"></jsp:useBean> 
                
    
            <jsp:useBean id= "dr" scope= "page" class= "webAppObjects.Doctor">
                <jsp:setProperty name="dr" property="*"></jsp:setProperty>
            </jsp:useBean> 
        
    
            <% 
        
                      
          int check1 = dr.registerDoctor();
          if(check1>0){
          RequestDispatcher rd = request.getRequestDispatcher("../../Patient/Register/registrationSuccessful.jsp");
            rd.include(request, response);
                }
                else {
            out.print("<b>Registeration Failed</b>");
            RequestDispatcher rdFail = request.getRequestDispatcher("doctorRegisterationForm.jsp");
            rdFail.include(request, response);
                }
                %>
           
            <%database.closeConnection();%>
           
            
    


