<%-- 
    Document   : updateSched
    Created on : May 6, 2023, 6:29:36 PM
    Author     : ali_shar


this is just a concept disregard this page
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
        <title>Doctor Appointment</title>
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
        </nav>ss="homepage">
            <form action="">
                Type:
                <br />
                <%
                    if(request.getParameter("phys")!=null){
                        out.println("Location: ");
                        out.println("<input type=\"hidden\" value=\"\"  name=\"phys\">");
                    }
                        else if(request.getParameter("online")!=null){
                        out.println("Link: ");
                        out.println("<input type=\"hidden\" value=\"\"  name=\"online\">");
                    }
                        
                %>
                <br />
                New Date: <input type="date" name="newdate" /><br />
                New Time: <input type="time" name="newtime" /><br />
                <input type = "submit" vlaue="Reschedule" />
                <input type="Reset">
                <a href="<%=request.getContextPath()%>/Doctor/Appointments/doctorAppActions.jsp">Cancel</a>
            </form>
        </div>
        <footer>
            
        </footer>
    </body>
</html>
