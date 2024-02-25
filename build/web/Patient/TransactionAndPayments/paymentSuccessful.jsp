
 <% if(session.getAttribute("patientObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>
<%@page import="webAppObjects.Patient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet"
	href="<%= request.getContextPath() %>/fonts/material-icon/css/material-design-iconic-font.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        

<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css">
        <jsp:useBean class="webAppObjects.Patient" id="pat" scope="session">
</jsp:useBean>

<%pat = (Patient)session.getAttribute("patientObj");%>
        <title>Transaction Successful</title>
    </head>
    <body>
        <li><a href="<%=request.getContextPath()%>/Patient/patientHomePage.jsp">Home</a></li>
                 <li><a href="<%=request.getContextPath()%>/Patient/Profile/patProfilePage.jsp"><%=pat.getFullName()%></a></li>
        <h1>Payment Successful</h1>
        <h3><a href="<%=request.getContextPath()%>/Patient/patientHomePage.jsp">Go to Homepage</a></h3>
        <h3><%
            if(request.getParameter("booking")!=null)
                out.print("<a href='"+request.getContextPath()+"/Patient/Appointments/patientAppBook.jsp'>Book Another Appointment</a>");
            if(request.getParameter("pharm")!=null)
                out.print("<a href='"+request.getContextPath()+"/Patient/Pharm/pharmacy.jsp'>Purchase Another Item</a>");
            %></h3>
    </body>
</html>
