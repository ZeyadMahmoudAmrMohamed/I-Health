<%-- 
    Document   : pharmacy
    Created on : Apr 25, 2023, 2:27:41 PM
    Author     : ali_shar
--%>
 <% if(session.getAttribute("patientObj")==null){
    response.sendRedirect("../../Login/login.jsp");
    return;
        }%>
<%@page import="webAppObjects.PharItem"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="webAppObjects.Patient"%>

<jsp:useBean class="webAppObjects.Patient" id="pat" scope="session">
</jsp:useBean>
<%pat = (Patient)session.getAttribute("patientObj");%>
<% if(pat==null) request.getRequestDispatcher(request.getContextPath()+"/Login/login.jsp").forward(request, response); %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pharmacy</title>
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
                <form action="<%=request.getContextPath()%>/quanController">
            <table>
                <tr>
                    <th>Image</th>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Add Item</th>
                </tr>
                <%
                   ArrayList<PharItem> phs = PharItem.retrPharItems();
                   if(phs!=null){
                   for(PharItem ph:phs){
                         if(ph.getItemQuantity()==0)
                            continue;
                          out.println("<tr>"
                            + "<td>"+phs.size()+"</td>"
                            + "<td>"+ph.getItemName()+"</td>"
                            + "<td>"+ph.getItemPrice()+"</td>"
                            + "<input type='hidden' name='"+ph.getItemName()+"price' value='"+ph.getItemPrice()+"'>"
                            + "<td><input type='text' name='"+ph.getItemName()+"quan'></td>"
                            + "<td><input type='checkbox' name='select_item' value='"+ph.getItemName()+"'></td>"
                            + "</tr>");
                    }}
              %>
            </table>
            <input type="submit" value="Checkout">
        </form>
    </body>
</html>
