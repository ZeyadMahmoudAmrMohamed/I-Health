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
                <li><a href="<%=request.getContextPath()%>/Doctor/Documents/addDocumentForm.jsp">Documents</a></li>
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
                    <th>Clinic Name</th>
                    <th>Location</th>
                    <th>Link</th>
                    <th>Overall Status</th>
                    <th></th>
                </tr>
                <%
                    ArrayList<Appointment> apps = Doctor.viewAppointments(dr.getNID());
                    if(apps!=null){
                        for(Appointment app: apps){
                            String button = "<th><input type=\"submit\" value=\"View History\" name=\"his"+app.getAppID()+"\"></th>";
                            String button2 = "<th><input type=\"submit\" value=\"Cancel\" name=\"can"+app.getAppID()+"\"></th>";
                            out.println("<tr>"
                                          + "<td>"+app.getAppID()+"</td>"
                                          + "<td>"+app.getAppDate()+"</td>"
                                          + "<td>"+app.getAppTime()+"</td>"
                                          + "<td>"+app.getClinic().getClinicLocation()+"</td>"
                                          + "<td>"+app.getClinicName()+"</td>"
                                          + "<td>"+app.getApplink()+"</td>"
                                          + "<td>"+app.getStatus()+"</td>"
                                          +"<input type='hidden' name='doctor' value=''>"
                                          + "<td>"+button+"</td>"
                                          + "<td>"+button2+"</td>"
                                      + "</tr>"
                            );
                        }
                    }
                    if(apps.size()==0){
                        out.print("<tr><td colspan='4'>there are no appointments<td></tr>");
                    }
                %>
            </table>
        </form>
    </body>
</html>
