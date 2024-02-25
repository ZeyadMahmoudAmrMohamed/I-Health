<%-- 
    Document   : addDocumentForm
    Created on : May 20, 2023, 8:24:49 PM
    Author     : zizof
--%>

<% if(session.getAttribute("doctorObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>
<%@page import="webAppObjects.Doctor"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Doctor Clinic Form </title>

<link rel="stylesheet"
	href="<%= request.getContextPath() %>/fonts/material-icon/css/material-design-iconic-font.min.css">

<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css">
<jsp:useBean class="webAppObjects.Doctor" id="dr" scope="session">
</jsp:useBean>
<%dr = (Doctor)session.getAttribute("doctorObj");%>
</head>
<body class="main">
	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Doctor Add Clinic</h2>
						<form method="post" action="<%=request.getContextPath()%>/Doctor/Clinic/controlClinicAdd.jsp" class="register-form"
							id="register-form">
							<div class="form-group">
								
							   
							<div class="form-group">
								<label for="clinicName"><i
									class="zmdi zmdi-account material-icons-name"></i></label> 
                                                                        <input type="text" placeholder="Clinic Name" name="clinicName"  required>							
                                                        </div>
							<div class="form-group">
								<label for="clinicLocation"><i
									class="zmdi zmdi-account material-icons-name"></i></label> 
                                                                        <input type="text" placeholder="Clinic Location" name="clinicLocation" required>							
                                                        </div>
                           
                                                        <div class="form-group form-button">
								<input type="submit" 
									class="form-submit" value="Add" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="<%= request.getContextPath() %>/Images/medical-team.png" alt="sing up image">
						</figure>
                                            <a href="<%=request.getContextPath()%>/Doctor/homepage.jsp">Home</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>



</body>
</html>
