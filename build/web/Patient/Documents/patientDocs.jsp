<%-- 
    Document   : patientDocs
    Created on : Apr 25, 2023, 2:18:30 PM
    Author     : ali_shar
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="webAppObjects.Document"%>
<%@page import="webAppObjects.Patient"%>
<%@page import="webAppObjects.Patient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <% if(session.getAttribute("patientObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>
<jsp:useBean class="webAppObjects.Patient" id="pat" scope="session">
</jsp:useBean>
<%pat = (Patient)session.getAttribute("patientObj");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Documents</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/mainStyle.css" type="text/css"/>
    </head>
    <body>
        <nav>
            <img src="<%=request.getContextPath()%>/Images/doctor.png" alt="alt" id="logo"/>
            <ul>
                <li><a href="<%=request.getContextPath()%>/Patient/patientHomePage.jsp">Home</a></li>
                 <li><a href="<%=request.getContextPath()%>/Patient/Profile/patProfilePage.jsp"><%=pat.getFullName()%></a></li>
                <!--Logout button here-->
            </ul>
        </nav>
        <table>
            <tr>
                <th>Document Title</th>
                <th>Document Type</th>
                <th>Date</th>
                <th>Doctor</th>
            </tr>
             <%
                   ArrayList<Document> docs = Patient.requestDocuments(pat.getNID());
                   if(docs!=null){
                   for(Document doc:docs){
                          out.println("<tr>"
                            + "<td>"+doc.getDocumentname()+"</td>"
                            + "<td>"+doc.getDocumentType()+"</td>"
                            + "<td>"+doc.getDocumentDate()+"</td>"
                            + "<td>"+doc.getDoctor().getFullName()+"</td>"
                            + "</tr>");
                    }}
              %>
        </table>
    </body>
</html>
