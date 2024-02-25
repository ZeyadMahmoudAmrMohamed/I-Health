<%-- 
    Document   : controlDocumentUpload
    Created on : May 20, 2023, 8:54:32 PM
    Author     : zizof
--%>
<% if(session.getAttribute("doctorObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>


<%@page import="java.sql.Date"%>
<%@page import="webAppObjects.Doctor"%>
<%@page import="webAppObjects.Document"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="webAppObjects.Document" id="document" scope="page">
</jsp:useBean>
<jsp:useBean class="webAppObjects.Doctor" id="dr" scope="page">
</jsp:useBean>

<%dr = (Doctor)session.getAttribute("doctorObj");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Document Upload Controller</title>
    </head>
    <body>
       
            <% 
                String documentDateString = request.getParameter("documentDate");
        Date documentDate = Date.valueOf(documentDateString);
        document.setDocumentDate(documentDate);
                document.setDoctor(dr);
                document.setDocumentType((String)request.getParameter("documenttype"));
                document.setDocumentid(Integer.valueOf(request.getParameter("documentID")));
                document.setDocumentname(request.getParameter("documentName"));      
          int check1 = document.uploadDocument((String)request.getAttribute("patNID"));
          if(check1>0){
          RequestDispatcher rd = request.getRequestDispatcher("uploadSuccessful.jsp");
            rd.include(request, response);
                }
                else {
            out.print("<b>Upload Failed</b>");
            RequestDispatcher rdFail = request.getRequestDispatcher("addDocumentForm.jsp");
            rdFail.include(request, response);
                }
                %>
           
    </body>
</html>
