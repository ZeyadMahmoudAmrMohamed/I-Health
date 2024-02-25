<%-- 
    Document   : patientAppStart
    Created on : Apr 25, 2023, 8:53:32 AM
    Author     : ali_shar
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="webAppObjects.Patient"%>
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
        <title>Patient Appointment</title>
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
        <h1>Appointments Actions</h1>
        <h3><a href="<%=request.getContextPath()%>/Patient/Appointments/patientViewApp.jsp">View Appointments</a></h3>
        <h3><a href="<%=request.getContextPath()%>/Patient/Appointments/patientAppBook.jsp">Book An Appointment</a></h3>
        <footer></footer>
    </body>
</html>
