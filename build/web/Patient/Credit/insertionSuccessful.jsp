<%-- 
    Document   : insertionSuccessful
    Created on : May 20, 2023, 8:04:04 PM
    Author     : zizof
--%>
 <% if(session.getAttribute("patientObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>

<%@page import="webAppObjects.Patient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <jsp:useBean class="webAppObjects.Patient" id="pat" scope="session">
</jsp:useBean>

<%pat = (Patient)session.getAttribute("patientObj");%>
<title>Registration Successful! </title>


<link rel="stylesheet"
	href="<%= request.getContextPath() %>/fonts/material-icon/css/material-design-iconic-font.min.css">


<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css">
    </head>
    <body class="main">
        <div class="main">

		
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Credit Card Insertion Successful!</h2>
						<form method="post" action="<%=request.getContextPath()%>/Patient/patientHomePage.jsp" class="register-form"
							id="register-form">
							       
                                                                   
							<div class="form-group form-button">
								<input type="submit" 
									class="form-submit" value="Home" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="<%= request.getContextPath() %>/Images/patientSignUp.png" alt="sing up image">
						</figure>
							</div>
				</div>
			</div>
		</section>


	</div>
    </body>
</html>
