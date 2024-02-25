<%-- 
    Document   : logoutSuccessful
    Created on : May 18, 2023, 9:00:50 PM
    Author     : zizof
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Logout Successful! </title>
<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.addHeader("Cache-Control", "post-check=0, pre-check=0");
response.setHeader("Pragma","no-cache"); 
//response.setDateHeader ("Expires", 0);
response.setDateHeader("Last-Modified", (new Date()).getTime() );

if ( session.getAttribute("patientObj") == null ) {                               
                 response.sendRedirect(request.getContextPath()+"/Login/login.jsp");
 }
  %> 

<link rel="stylesheet"
	href="<%= request.getContextPath() %>/fonts/material-icon/css/material-design-iconic-font.min.css">


<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css">
    </head>
    <body>
        <div class="main">

		
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Logout Successful!</h2>
						<form method="post" action="<%=request.getContextPath()%>/Login/login.jsp" class="register-form"
							id="register-form">
							       
                                                                   
							<div class="form-group form-button">
								<input type="submit" 
									class="form-submit" value="Login" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="<%= request.getContextPath() %>/Images/patient.png" alt="sing up image">
						</figure>
							</div>
				</div>
			</div>
		</section>


	</div>
    </body>
</html>
