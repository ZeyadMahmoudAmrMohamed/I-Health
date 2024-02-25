<%-- 
    Document   : patientAppBook
    Created on : May 6, 2023, 7:05:20 PM
    Author     : ali_shar
--%>
<% if(session.getAttribute("doctorObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>
<%@page import="webAppObjects.Doctor"%>
<jsp:useBean class="webAppObjects.Doctor" id="dr" scope="session">
</jsp:useBean>
<%dr = (Doctor)session.getAttribute("doctorObj");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Appointments</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/mainStyle.css" type="text/css"/>
    </head>
    <body>
        <nav>
            <img src="<%=request.getContextPath()%>/Images/doctor.png" alt="alt" id="logo"/>
            <ul>
                <li><a href="<%=request.getContextPath()%>/Doctor/homepage.jsp">Home</a></li>
                <li><a href="<%=request.getContextPath()%>/Doctor/Appointments/doctorAppActions.jsp">Appointments</a></li>
                <li><a href="<%=request.getContextPath()%>/Doctor/Documents/addDocumentForm.jsp">Documents</a></li>
                 <li><a href="<%=request.getContextPath()%>/Doctor/Profile/docProfilePage.jsp"><%=dr.getFullName()%></a></li>
              
                <!--Logout button here-->
            </ul>
        </nav>
        <div class="homepage">
            <h1>Appointment Actions</h1>
            <h3><a href="<%=request.getContextPath()%>/Doctor/Appointments/doctorAddApp.jsp">Add Appointment</a></h3>
            <h3><a href="<%=request.getContextPath()%>/Doctor/Appointments/reschedApp.jsp">Reschedule Appointment</a></h3>
            <h3><a href="<%=request.getContextPath()%>/Doctor/Appointments/viewApp.jsp">View Appointments</a></h3>
        </div>
        <footer>
            
        </footer>
    </body>
</html>
