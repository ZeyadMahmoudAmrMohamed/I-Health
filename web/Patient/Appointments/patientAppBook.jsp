<%-- 
    Document   : patientAppBook
    Created on : Apr 25, 2023, 9:00:20 AM
    Author     : ali_shar
--%>
<%@page import="webAppObjects.Patient"%>

 <% if(session.getAttribute("patientObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>

<jsp:useBean class="webAppObjects.Patient" id="pat" scope="session">
</jsp:useBean>
<%pat = (Patient)session.getAttribute("patientObj");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="homepage">
            <h1>Book an Appointment</h1>
            <h3><a href="<%=request.getContextPath()%>/Patient/Appointments/patientOnline.jsp">Online</a></h3>
            <h3><a href="<%=request.getContextPath()%>/Patient/Appointments/patientPhysical.jsp">Physical</a></h3>
        </div>
        <footer>
            
        </footer>
    </body>
</html>
