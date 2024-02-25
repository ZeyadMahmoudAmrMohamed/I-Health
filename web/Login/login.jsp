<%-- 
    Document   : login
    Created on : May 7, 2023, 6:13:20 AM
    Author     : zizof
--%>

<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign In</title>


<link rel="stylesheet"
	href="<%= request.getContextPath() %>/fonts/material-icon/css/material-design-iconic-font.min.css">

<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css">
<% response.setHeader("Cache-Control","no-cache,max-age=0, no-store, must-revalidate"); 
    response.addHeader("Cache-Control", "post-check=0, pre-check=0");
    response.setHeader("Pragma","no-cache"); 
    //response.setDateHeader ("Expires", 0);
    response.setDateHeader("Last-Modified", (new Date()).getTime() );
    if(session.getAttribute("patientObj")!=null){
    
    session.removeAttribute("patientObj");
    
    }
    if(session.getAttribute("doctorObj")!=null){
    
    session.removeAttribute("doctorObj");
    
    }
    if(session.getAttribute("adminObj")!=null){
    
    session.removeAttribute("adminObj");
    
    }
%>
</head>
<body class="main">

	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="<%= request.getContextPath() %>/Images/docLogin.png" alt="sing up image">
						</figure>
						<a href="<%= request.getContextPath() %>/Patient/Register/patientRegisterationForm.jsp" class="signup-image-link">Create patient account</a>
						
					</div>

					<div class="signin-form">
						<h2 class="form-title">Sign In</h2>
						<form method="post" action="<%=request.getContextPath()%>/loginController" class="register-form"
							id="login-form">
                                                    <%if(request.getAttribute("check")=="invalid")
                                                                               out.print("<b><p style='color:red'>Invalid Credentials<br>Try Again</p></b>");
                                                                            %>
                                                                            <%if(request.getAttribute("status")==("resetSuccess"))
                                                                               out.print("<b><p style='color:green'>Reset Successful</p></b>");
                                                                               else if(request.getAttribute("status")=="resetFailed") out.print("<b><p style='color:pink'>Reset Failed</p></b>");
                                                                            %>
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="username"
									placeholder="Your Name" autocomplete="off" required/>
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Your Password" autocomplete="off" required/>
							</div>
                                                        <div class="form-group">
                                                                            <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <b>Type:  </b>&nbsp; &nbsp;
                                                                                </td>
                                                                                
                                                                                <td> Doctor</td> <td> <input type="radio" name="type" value="Doctor" required> </td>
                                                                                <td>Patient</td><td><input type="radio" name="type" value="Patient" required> </td>
                                                                           <td>Admin</td><td><input type="radio" name="type" value="Admin" required> 
                                                                                </td>

                                                                            </tr>
                                                                            </table>
                                                       </div>
							<div class="form-group">
                                                            <a href="forgotPassword.jsp" class="signup-image-link">Forgot Password?</a>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
                                                                
							</div>
                                                    <div><a href="<%= request.getContextPath() %>/Doctor/Register/doctorRegistrationForm.jsp" class="signup-image-link">Create doctor account</a>
                                                    </div>
						</form>
						
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>