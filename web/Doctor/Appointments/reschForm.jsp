<%-- 
    Document   : viewApp
    Created on : May 6, 2023, 6:42:50 PM
    Author     : ali_shar
--%>
<% if(session.getAttribute("doctorObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>
<%@page import="java.util.ArrayList"%>
<%@page import="webAppObjects.Appointment"%>
<%@page import="webAppObjects.Doctor"%>
<jsp:useBean class="webAppObjects.Doctor" id="dr" scope="session">
</jsp:useBean>
<%dr = (Doctor)session.getAttribute("doctorObj");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String appid;
    if(request.getAttribute("appid")!=null)
        appid = (String)request.getAttribute("appid");
    else
        appid = request.getParameter("appid");
%>
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
        <form action="<%=request.getContextPath()%>/resController" method="post">
            <input type="hidden" name="odate" value="<%=request.getParameter(appid+"date")%>">
            <input type="hidden" name="otime" value="<%=request.getParameter(appid+"time")%>">
            <input type="hidden" name="appid" value="<%=(String)appid%>">
            <h1>Rescheduling Appointment: <%=appid%></h1>
            
            <!--this condition just differentiates between the request sent from the bridgeController and the request sent from the resController-->
            Old Date: <%=request.getParameter(appid+"date")==null?session.getAttribute("odate"):request.getParameter(appid+"date")%>
            <br>
            Old Time: <%=request.getParameter(appid+"time")==null?session.getAttribute("otime"):request.getParameter(appid+"time")%>
            <br>
            New Date: <input type="date" name="ndate" />
            New Time: <input type="time" name="ntime" />
            <input value="Reschdule" type="submit">
        </form>
    </body>
</html>
