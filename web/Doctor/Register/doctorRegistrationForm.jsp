<%-- 
    Document   : doctorRegistrationForm
    Created on : May 18, 2023, 11:35:02 PM
    Author     : zizof
--%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Doctor Sign Up Form </title>

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
						<h2 class="form-title">Doctor Sign up</h2>
						<form method="post" action="<%=request.getContextPath()%>/doctorRegisterController" class="register-form"
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
                                                                        <input type="text" placeholder="Your National ID" maxlength="14" minlength="14" name="NID"  <%if((request.getAttribute("NID")=="valid"))out.print("value="+request.getAttribute("NIDValue"));%> required>	
                                                        </div>          <%if(request.getAttribute("NID")=="invalid")
                                                                               out.print("<b><p style='color:red'>National ID must be 14 DIGITS only<br>National ID must not be used in another account</p></b>");
                                                                            %>
                                                      
                                                        <div class="form-group">
								
                                                                       							
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <b>Specialization:</b> <span><span></span></span>  <!-- &nbsp; -->                                                                                </td>
                                                                                <td>  
                                                                                       <select name="specialization" required>
                                                                                        <option value="pediatrics">Pediatrics</option>
                                                                                        <option value="Internal Medicine">Internal Medicine</option>
                                                                                        <option value="Neurology">Neurology</option>
                                                                                        <option value="Orthopedics">Orthopedics</option>
                                                                                        <option value="Pathology">Pathology</option>
                                                                                        <option value="Psychiatry">Psychiatry</option>
                                                                                        <option value="Family medicine">Family medicine</option>
                                                                                        <option value="Obstetrics and gynaecology">Obstetrics and gynaecology</option>
                                                                                        <option value="Urology">Urology</option>
                                                                                        <option value="Opthalmology">Opthalmology</option>
                                                                                        <option value="Immunology">Immunology</option>
                                                                                        <option value="Dermatology">Dermatology</option>
                                                                                        <option value="Cardiology">Cardiology</option>
                                                                                        <option value="General practitioner">General practitioner</option>
                                                                                        <option value="ENT">ENT</option>

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
								<label for="docEmail"><i class="zmdi zmdi-email"></i></label> 
                                                                <input type="email" placeholder="Your Mail" name="docEmail" <%if((request.getAttribute("email")=="valid"))out.print("value="+request.getAttribute("emailValue"));%>  required>

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
							    
                                                                   
							<div class="form-group form-button">
								<input type="submit" 
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="<%= request.getContextPath() %>/Images/doctorSignUp.png" alt="sing up image">
						</figure>
						<a href="<%= request.getContextPath() %>/Login/login.jsp" class="signup-image-link">I am already a
							member</a>
                                            
					</div>
				</div>
			</div>
		</section>


	</div>
	
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>



</body>
</html>
