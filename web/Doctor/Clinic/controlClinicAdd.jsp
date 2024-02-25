<%-- 
    Document   : controlDocumentUpload
    Created on : May 20, 2023, 8:54:32 PM
    Author     : zizof
--%>
<% if(session.getAttribute("doctorObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>


<%@page import="webAppObjects.Doctor"%>
<%@page import="webAppObjects.Clinic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="webAppObjects.Clinic" id="clinic" scope="page">
</jsp:useBean>
<jsp:useBean class="webAppObjects.Doctor" id="dr" scope="page">
</jsp:useBean>

<%dr = (Doctor)session.getAttribute("doctorObj");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clinic Addition Controller</title>
    </head>
    <body>
       
            <% 
                clinic.setDoctor(dr);
                clinic.setClinicLocation(request.getParameter("clinicLocation"));
                clinic.setClinicName(request.getParameter("clinicName"));
          int check1 = clinic.addClinic();
          if(check1>0){
          RequestDispatcher rd = request.getRequestDispatcher("additionSuccessful.jsp");
            rd.include(request, response);
                }
                else {
            out.print("<b>Upload Failed</b>");
            RequestDispatcher rdFail = request.getRequestDispatcher("addClinicForm.jsp");
            rdFail.include(request, response);
                }
                %>
           
    </body>
</html>
