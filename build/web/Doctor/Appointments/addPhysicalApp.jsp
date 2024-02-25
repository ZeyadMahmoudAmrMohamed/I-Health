<%-- 
    Document   : addOnlineApp
    Created on : May 6, 2023, 6:10:13 PM
    Author     : ali_shar
--%>
<% if(session.getAttribute("doctorObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>
<%@page import="webAppObjects.Doctor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="webAppObjects.Clinic"%>
<%@page import="webAppObjects.Doctor"%>
<jsp:useBean class="webAppObjects.Doctor" id="dr" scope="session">
</jsp:useBean>
<%dr = (Doctor)session.getAttribute("doctorObj");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Appointment</title>
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
        <div class="homepage">
            <form action="<%=request.getContextPath()%>/addAppController" method="post">
                <input type="hidden" name="spec" value="<%=dr.getSpecialization()%>">
                <input type="hidden" name="nid" value="<%=dr.getNID()%>">
                Clinic Name:
                <select name="clinic">
                    <%
                        ArrayList<Clinic> cl = Doctor.retrieveClinicsFromDB(dr.getNID());
                        if(cl!=null){
                            for(Clinic c : cl){
                                out.println("<option value='"+c.getClinicName()+"'>"+c.getClinicName()+"</option>");
                            }
                        }
                    %>
                </select>
                <br />
                Appointment Date:
                <input type="date" name="appdate" />
                <br />
                Appointment Time:
                <input type="time" name="apptime">
                <br />
                Appointment Price:
                <input type="text" name="appprice">
                <br />
                <input type = "submit" vlaue="ADD" />
                <input type="Reset">
                <a href="<%=request.getContextPath()%>/Doctor/homepage.jsp">Cancel</a>
            </form>
        </div>
        <footer>
            
        </footer>
    </body>
</html>
