<%-- 
    Document   : uploadSuccessful
    Created on : May 20, 2023, 11:10:24 PM
    Author     : zizof
--%>

<% if(session.getAttribute("doctorObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>
<%@page import="webAppObjects.Doctor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Upload Successful! </title>


<link rel="stylesheet"
	href="<%= request.getContextPath() %>/fonts/material-icon/css/material-design-iconic-font.min.css">


<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css">
   <jsp:useBean class="webAppObjects.Doctor" id="dr" scope="session">
</jsp:useBean>
<%dr = (Doctor)session.getAttribute("doctorObj");%>
    </head>
    <body class="main">
        <div class="main">

		
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Document Uploaded Successfully!</h2>
						<form method="post" action="<%=request.getContextPath()%>/Doctor/homepage.jsp" class="register-form"
							id="register-form">
							       
                                                                   
							<div class="form-group form-button">
								<input type="submit" 
									class="form-submit" value="Home" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="<%= request.getContextPath() %>/Images/doc1.png" alt="sing up image">
						</figure>
							</div>
				</div>
			</div>
		</section>


	</div>
    </body>
</html>
