<%-- 
    Document   : patientOnline
    Created on : Apr 25, 2023, 9:02:31 AM
    Author     : ali_shar
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="webAppObjects.Appointment"%>
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
     <h1>Available Online Appointments</h1>
       <form action="<%=request.getContextPath()%>/Patient/Appointments/patientOnline.jsp">
                   FILTER: 
                   <%
                       ArrayList<String> foptions = Appointment.getApps();
                   %>
                   <select name="filter">
                       <%
                           for(String s:foptions){
                                out.println("<option value='"+s+"'>"+s+"</option>");
                           }
                       %>
                   </select>
                   <input type="submit" value="FILTER">
         </form>
        <form action="<%=request.getContextPath()%>/Patient/Appointments/checkout.jsp">
            <input type="hidden" name="booking" value="">            <h1>Available Online Appointments</h1>

       
            <table>
                <tr>
                    <th>Doctor</th>
                    <th>Specialization</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th></th>
                </tr>
                <%
                   String apptype;
                   if(request.getParameter("filter")==null){
                     apptype = foptions.get(0);
                    }else{
                    apptype = request.getParameter("filter");
                    }
                   ArrayList<Appointment> apps = Patient.retAvOnAppForBooking(apptype);
                   if(apps!=null){
                   for(Appointment app:apps){
                          session.setAttribute("appointment"+app.getAppID(),app.getAppPrice());
                          out.println("<tr>"
                            + "<th>"+app.getDoctor().getFullName()+"</th>"
                            + "<th>"+apptype+"</th>"
                            + "<th>"+app.getAppDate()+"</th>"
                            + "<th>"+app.getAppTime()+"</th>"
                            + "<td>"+app.getAppPrice()+"</td>"
                            + "<td>"+session.getAttribute("appointment"+app.getAppID())+"</td>"
                            + "<th><input type=\"submit\" value=\"Book\" name=\""+app.getAppID()+"\"></th>"
                            + "</tr>");
                    }}
                   if(apps.size()==0){
                        out.print("<tr><td colspan='4'>there are no appointments<td></tr>");
                    }
                %>
            </table>
        </form>
    </body>
</html>
