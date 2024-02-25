<%-- 
    Document   : checkout
    Created on : Apr 25, 2023, 2:32:28 PM
    Author     : ali_shar
--%>
 <% if(session.getAttribute("patientObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>
<%@page import="webAppObjects.Patient"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int totalPrice =0;
    HashMap<String,Integer> quanHash = (HashMap<String,Integer>)session.getAttribute("items");
    String[] items = request.getParameterValues("select_item");
    for(String item:items){
        totalPrice += quanHash.get(item) * Integer.valueOf(request.getParameter(item+"price"));
    }
%>
<html>
    <head>
        <jsp:useBean class="webAppObjects.Patient" id="pat" scope="session">
</jsp:useBean>

<%pat = (Patient)session.getAttribute("patientObj");%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pharmacy Checkout</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/mainStyle.css" type="text/css"/>
    </head>
    <body>
        <form action="<%=request.getContextPath()%>/Patient/TransactionAndPayments/chooseCredit.jsp">
            <h1>Check out:</h1>
            <p>Items bought:</p>
            <%
                for(String item:items){
                    out.println(item+"\tquantity: "+quanHash.get(item)+"\t price: "+(quanHash.get(item)*Integer.valueOf( request.getParameter(item+"price") ) )+"<br/>" );
                }
                session.setAttribute("selected", items);
            %>
            <h2>Total Price: <%=totalPrice%> EGP</h2>
            <input type="hidden" name="pharm" value="">
            <input type="submit" value="Proceed to payment">
            <a href="<%=request.getContextPath()%>/Patient/Pharm/pharmacy.jsp">Cancel</a>
        </form>
    </body>
</html>
