

<%@page import="webAppObjects.Doctor"%>
<jsp:useBean class="webAppObjects.Doctor" id="dr" scope="session">
</jsp:useBean>
<%dr = (Doctor)session.getAttribute("doctorObj");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"
	href="<%= request.getContextPath() %>/fonts/material-icon/css/material-design-iconic-font.min.css">
        
        <title>Doctor Appointment</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/mainStyle2.css" type="text/css"/>
    </head>
    <body>
        <nav>
            <img src="<%=request.getContextPath()%>/Images/doctor.png" alt="alt" id="logo"/>
            <ul>
                <li><a href="<%=request.getContextPath()%>/Doctor/homepage.jsp">Home</a></li>
                <li><a href="<%=request.getContextPath()%>/Doctor/Appointments/doctorAppActions.jsp">Appointments</a></li>
                                 <li><a href="<%=request.getContextPath()%>/Doctor/Profile/docProfilePage.jsp"><%=dr.getFullName()%></a></li>

            </ul>
        </nav>
        <div class="homepage">
            <form action="<%=request.getContextPath()%>/addAppController" method="post">
                <input type="hidden" name="online" value="">
                <input type="hidden" name="nid" value="<%=dr.getNID()%>">
                <input type="hidden" name="spec" value="<%=dr.getSpecialization()%>">
                Appointment Link:
                <input type="text" name="applink" />
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
                <a href="<%=request.getContextPath()%>/Doctor/Appointments/doctorAppActions.jsp">Cancel</a>
            </form>
        </div>
        <footer>
            
        </footer>
    </body>
</html>

