<%-- 
    Document   : viewApp
    Created on : May 6, 2023, 6:42:50 PM
    Author     : ali_shar
--%>
<% if(session.getAttribute("doctorObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.sql.Time"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="webAppObjects.Appointment"%>
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
                 <li><a href="<%=request.getContextPath()%>/Doctor/Profile/docProfilePage.jsp"><%=dr.getFullName()%></a></li>
            </ul>
        </nav>
        <form action="<%=request.getContextPath()%>/docAppBridge" method="get">
            <h1>Your Appointments</h1>
            <table>
                <tr>
                    <th>Appointment ID</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Link</th>
                    <th>Overall Status</th>
                    <th></th>
                </tr>
                <%
                    ArrayList<Appointment> apps = Doctor.viewAppointments(dr.getNID());
                    if(apps!=null){
                        for(Appointment app: apps){
                            boolean case3 = app.getAppTime().compareTo(Time.valueOf(LocalTime.now()))<0 && app.getAppDate().compareTo(Date.valueOf(LocalDate.now()))==0;
                            if(app.getApplink() == null || app.getAppDate().compareTo(Date.valueOf(LocalDate.now()))<0 || case3 )
                                continue;
                            String button = "<th><input type=\"submit\" value=\"Reschedule\" name=\"res"+app.getAppID()+"\"></th>";
                            out.println("<tr>"
                                          + "<input type='hidden' value='"+app.getAppTime()+"' name='"+app.getAppID()+"time'>"
                                          + "<input type='hidden' value='"+app.getAppDate()+"' name='"+app.getAppID()+"date'>"
                                          + "<td>"+app.getAppID()+"</td>"
                                          + "<td>"+app.getAppDate()+"</td>"
                                          + "<td>"+app.getAppTime()+"</td>"
                                          + "<td>"+app.getApplink()+"</td>"
                                          + "<td>"+app.getStatus()+"</td>"
                                          + "<td>"+button+"</td>"
                                      + "</tr>"
                            );
                        }
                    }
                %>
            </table>
        </form>
    </body>
</html>
