<%-- 
    Document   : patientViewApp
    Created on : Apr 25, 2023, 9:12:53 AM
    Author     : ali_shar
--%>

<%@page import="webAppObjects.Patient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="webAppObjects.Appointment"%>
<%@page import="java.sql.ResultSet"%>
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
        <title>Patient Appointments</title>
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
        <h1>Your Appointments</h1>
        <form action="<%=request.getContextPath()%>/cancelController" method="post">
            <input type="hidden" name="cancel" value="daf">
            <table>
                <tr>
                    <th>Doctor</th>
                    <th>Specialization</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Location</th>
                    <th>Clinic Name</th>
                    <th>Link</th>
                    <th>Status</th>
                    <th></th>
                </tr>
                <%
                    ArrayList<Appointment> apps = Patient.viewAppStatus(pat.getNID());
                    if(apps!=null){
                        for(Appointment app: apps){
                            String button =  app.getAppinv().getAppStatus().equals("BOOKED") ?"<th><input type=\"submit\" value=\"Cancel\" name=\""+app.getAppID()+"\"></th>":"<th></th>";
                            out.println("<tr>"
                                          + "<td>"+app.getDoctor().getFullName()+"</td>"
                                          + "<td>"+app.getDoctor().getSpecialization()+"</td>"
                                          + "<td>"+app.getAppDate()+"</td>"
                                          + "<td>"+app.getAppTime()+"</td>"
                                          + "<td>"+app.getClinic().getClinicLocation()+"</td>"
                                          + "<td>"+app.getClinicName()+"</td>"
                                          + "<td>"+app.getApplink()+"</td>"
                                          + "<td>"+app.getAppinv().getAppStatus()+"</td>"
                                          +"<input type='hidden' name='patient' value=''>"
                                          + button
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
