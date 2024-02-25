<%-- 
    Document   : checkout
    Created on : Apr 25, 2023, 2:32:28 PM
    Author     : ali_shar
--%>
 <% if(session.getAttribute("patientObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>
<%@page import="webAppObjects.Patient"%>
<%@page import="webAppObjects.Appointment"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="webAppObjects.Patient" id="pat" scope="session">
</jsp:useBean>
<%pat = (Patient)session.getAttribute("patientObj");%>
<!DOCTYPE html>
<%
    int totalPrice =0;
    //this enumeration just retrieves the id of the sent appointment
    Enumeration pnames = request.getParameterNames();
    Object appid=null;
    while(pnames.hasMoreElements()){
        appid = pnames.nextElement();
    }
    
    //getting the appointment stored in db using id
    //this is way one of retrieving price: through DB. Putting the price in a session attribute will be done for the pharmacy item
    //out.print(Appointment.retrievePrice((String)appid));
    //totalPrice = Appointment.retrievePrice((String)appid);
    totalPrice = (int)session.getAttribute("appointment"+(String)appid);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pharmacy Checkout</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/mainStyle.css" type="text/css"/>
    </head>
    <body>
        <form action="<%=request.getContextPath()%>/Patient/TransactionAndPayments/chooseCredit.jsp">
            <h1>Check out:</h1>
            <h2>Total Appointment Price: <%=totalPrice%> EGP</h2>
            <input type="hidden" name="booking" value="">
            <input type="hidden" name="appid" value="<%=(String)appid%>">
            <in>
            <input type="submit" value="Proceed to payment">
            <a href="<%=request.getContextPath()%>/Patient/Appointments/patientAppBook.jsp">Cancel</a>
        </form>
    </body>
</html>
