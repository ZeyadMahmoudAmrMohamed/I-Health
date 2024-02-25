<%-- 
    Document   : chooseCredit
    Created on : Apr 25, 2023, 9:16:50 AM
    Author     : ali_shar
--%>
 <% if(session.getAttribute("patientObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>
<%@page import="webAppObjects.Credit"%>
<%@page import="java.util.ArrayList"%>
<%@page import="webAppObjects.Patient"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:useBean class="webAppObjects.Patient" id="pat" scope="session">
</jsp:useBean>
<%pat = (Patient)session.getAttribute("patientObj");%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Credit Card Choice</title>
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
        <h1>Choose a card to complete <%
            if(request.getParameter("pharm") != null)
                out.print("your pharmacy item purchase");
            else
                out.print("your booking");
            %></h1>
            <form action="<%=request.getContextPath()%>/updateController" method="post">
                <input type = "hidden" name="nid" value="<%=pat.getNID()%>">
            <%
                //retrieving the app id from the checkout
                if(request.getParameter("booking")!=null){
                    out.println("<input type='hidden' value='"+request.getParameter("appid")+"' name='update'>");
                }
            %>
            <input type="hidden" name="<%
                   if(request.getParameter("booking")!=null){
                        out.print("booking");
                    }
                   else
                    out.print("pharm");
                    %>" value="" />
            <table>
                <tr>
                    <th>Credit Number</th>
                    <%ArrayList<Credit> creds = Patient.getCardsFromDB(pat.getNID());
                   if(creds!=null){
                   for(Credit cred:creds){
                          out.println("<tr>"
                            + "<td>"+cred.getCardNumber()+"</td>"
                            + "<th><input type='submit' value='Pay'></th>"
                            + "</tr>");
                    }}
                    %>
                </tr>
            </table>
            <a href="<%
                if(request.getParameter("booking")!=null)
                    out.print(request.getContextPath()+"/Patient/Appointments/patientAppBook.jsp");
                else
                    out.print(request.getContextPath()+"/Patient/Pharm/pharmacy.jsp");
               %>">Cancel</a>
        </form>
    </body>
</html>
