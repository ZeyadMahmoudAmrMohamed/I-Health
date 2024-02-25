<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Patient Sign Up Form </title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css">
</head>
<body class="main">
	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Patient Sign up</h2>
					<!-- ../../../src/java/NewServlet-->
						<form method="post" action="<%=request.getContextPath()%>/patientRegisterController" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="fullName"><i
									class="zmdi zmdi-account material-icons-name"></i></label> 
                                                                        <input type="text" placeholder="Your name" name="fullName" <%if((request.getAttribute("fullName")=="valid"))out.print("value="+request.getAttribute("fullNameValue"));%> required>
                                                                        
                                                                           
							</div>
							<div class="form-group">
								<label for="userName"><i
									class="zmdi zmdi-account material-icons-name"></i></label> 
                                                                        <input type="text" placeholder="Your User Name" name="userName" <%if((request.getAttribute("userName")=="valid"))out.print("value="+request.getAttribute("userNameValue"));%> required>							
                                                        </div>
                                                        <div class="form-group">
								<label for="NID"><i
									class="zmdi zmdi-account material-icons-name"></i></label> 
                                                                        <input type="text" maxlength="14" minlength="14" placeholder="Your National ID" name="NID"  <%if((request.getAttribute("NID")=="valid"))out.print("value="+request.getAttribute("NIDValue"));%> required>	
                                                        </div>          <%if(request.getAttribute("NID")=="invalid")
                                                                               out.print("<b><p style='color:red'>National ID must be 14 DIGITS only<br>National ID must not be used in another account</p></b>");
                                                                            %>
                                                        <div class="form-group">
								<label for="birthDate"><i
									class="zmdi zmdi-account material-icons-name"></i></label> 
                                                                        <input type="date" placeholder="Your birth date" name="birthDate"  <%if((request.getAttribute("birthDate")=="valid"))out.print("value="+request.getAttribute("birthDateValue"));%>    required>
                                                                       
                                                        </div>      <%if(request.getAttribute("birthDate")=="invalid")
                                                                               out.print("<b><p style='color:red'>This birth date is invalid</p></b>");
                                                                            %>
                                                        <div class="form-group">
								
                                                                       							
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <b>Blood Type:</b> <span><span></span></span>  <!-- &nbsp; -->                                                                                </td>
                                                                                <td>  
                                                                                        <select name="bloodType"  required>
                                                                                          <option value="A-">A-</option>
                                                                                          <option value="A+">A+</option>
                                                                                          <option value="A">A</option>
                                                                                          <option value="AB+">AB+</option>
                                                                                          <option value="AB-">AB-</option>
                                                                                          <option value="AB">AB</option>
                                                                                          <option value="B">B</option>
                                                                                          <option value="B+">B+</option>
                                                                                          <option value="B-">B-</option>
                                                                                          <option value="O">O</option>
                                                                                          <option value="O+">O+</option>
                                                                                          <option value="O-">O-</option>

                                                                                        </select>
                                                                                </td>
                    
                </tr>
                                                                        </table>
                                                        </div>
                                                       <div class="form-group">
                                                                            <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <b> Gender:</b>&nbsp; &nbsp;
                                                                                </td>
                                                                                
                                                                                <td> Male</td> <td> <input type="radio" name="gender" value="male" required> </td>
                                                                           <td>Female</td><td><input type="radio" name="gender" value="female" required> 
                                                                                </td>

                                                                            </tr>
                                                                            </table>
                                                       </div>
							<div class="form-group">
								<label for="patEmail"><i class="zmdi zmdi-email"></i></label> 
                                                                <input type="email" placeholder="Your Mail" name="patEmail" <%if((request.getAttribute("email")=="valid"))out.print("value="+request.getAttribute("emailValue"));%>  required>

							</div>
							<div class="form-group">
								<label for="userPass"><i class="zmdi zmdi-lock"></i></label> 
                                                                <input type="password" placeholder="Your password" name="userPass"  <%if((request.getAttribute("userPass")=="valid"))out.print("value="+request.getAttribute("userPassValue"));%>  required>
							
                                                        </div>       <%if(request.getAttribute("userPass")=="invalid")
                                                                               out.print("<b><p style='color:red'>Password length must be greater than or equal 8 characters</p></b>");
                                                                            %> 
							<div class="form-group">
								<label for="confirmPass"><i class="zmdi zmdi-lock-outline"></i></label>
                                                                <input type="password" placeholder="Confirm password" name="confirmPass" required>
                                                                
                                                                 

							</div>              <%if(request.getAttribute("confirmPass")=="invalid")
                                                                               out.print("<b><p style='color:red'>Passwords must be both the same</p></b>");
                                                                            %> 
							
                                                       
							<div class="form-group">
                                                            <b>    Chronic Diseases: </b>  <br><br/>                                                                     
								<input type="checkbox" name="chronicDiseases" id="diabetes"
									class="agree-term" value="diabetes" /> <label for="diabetes"
									class="label-agree-term"><span></span>Diabetes</label>
                                                                        <br><br/>
								<input type="checkbox" name="chronicDiseases" id="heartDisease"
									class="agree-term" value="heartDisease" /> <label for="heartDisease"
									class="label-agree-term"><span></span>Heart Disease</label>
                                                                        <br><br/>
								<input type="checkbox" name="chronicDiseases" id="stroke"
									class="agree-term" value="stroke" /> <label for="stroke"
									class="label-agree-term"><span></span>Stroke</label>
                                                                        <br><br/>
								<input type="checkbox" name="chronicDiseases" id="cancer"
									class="agree-term" value="cancer" /> <label for="cancer"
									class="label-agree-term"><span></span>Cancer</label>
                                                                        <br><br/>
								<input type="checkbox" name="chronicDiseases" id="obesity"
									class="agree-term" value="obesity" /> <label for="obesity"
									class="label-agree-term"><span></span>Obesity</label>
                                                                        <br><br/>
								<input type="checkbox" name="chronicDiseases" id="cholesterol"
									class="agree-term" value="cholesterol" /> <label for="cholesterol"
									class="label-agree-term"><span></span>Cholesterol</label>
                                                                        <br><br/>
                                                                        
							</div>
                                                       
                                                                    
                                                                   
							<div class="form-group form-button">
								<input type="submit" 
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="<%= request.getContextPath() %>/Images/patientSignUp.png" alt="sing up image">
						</figure>
						<a href="<%= request.getContextPath() %>/Login/login.jsp" class="signup-image-link">I am already
							member</a>
                                            <br/><br/>
                                                <a href="<%= request.getContextPath() %>/Doctor/Register/doctorRegistrationForm.jsp" class="signup-image-link">Are you a Doctor?</a>
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