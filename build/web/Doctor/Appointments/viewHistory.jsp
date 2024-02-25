<%-- 
    Document   : viewApp
    Created on : May 6, 2023, 6:42:50 PM
    Author     : ali_shar
--%>
<% if(session.getAttribute("doctorObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>
<%@page import="webAppObjects.AppInvoice"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="webAppObjects.Appointment"%>
<%@page import="webAppObjects.Doctor"%>
<jsp:useBean class="webAppObjects.Doctor" id="dr" scope="session">
</jsp:useBean>
<%dr = (Doctor)session.getAttribute("doctorObj");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String appid = (String)request.getAttribute("appid");
%>
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
            <h1>History for Appointment ID: <%=appid%></h1>
            <table>
                <tr>
                    <th>Patient</th>
                    <th>Patient Booking Status</th>
                    <th>Patient Booking Date</th>
                    <th></th>
                </tr>
                <%
                    ArrayList<AppInvoice> apps = Doctor.viewHistory(appid);
                    if(apps!=null){
                        for(AppInvoice app: apps){
                            out.println("<tr>"
                            + ""
                                          + "<td>"+app.getPatient().getFullName()+"</td>"
                                          + "<td>"+app.getAppStatus()+"</td>"
                                          + "<td>"+app.getInvdate()+"</td>"
                                      + "</tr>"
                            );
                        }
                    }
                %>
            </table>
        </form>
    </body>
</html>
