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
<title>Doctor Upload Document Form </title>

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
						<h2 class="form-title">Doctor Upload Document</h2>
						<form method="post" action="<%=request.getContextPath()%>/doctorUploadDocumentController" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="documentID"><i
									class="zmdi zmdi-account material-icons-name"></i></label> 
                                                                        <input type="text" placeholder="Document ID" name="documentID" <%if((request.getAttribute("documentID")=="valid"))out.print("value="+request.getAttribute("documentIDValue"));%> required>
                                                                        
                                                                           
							</div>
                                                                        <%if(request.getAttribute("documentID")=="invalid")
                                                                               out.print("<b><p style='color:red'>The document ID must be only digits</p></b>");
                                                                            %>
							<div class="form-group">
								<label for="patientName"><i
									class="zmdi zmdi-account material-icons-name"></i></label> 
                                                                        <input type="text" placeholder="Patient Name" name="patientName" <%if((request.getAttribute("patientName")=="valid"))out.print("value="+request.getAttribute("patientNameValue"));%> required>
                                                                        
                                                                           
							</div>
                                                                         <%if(request.getAttribute("patientName")=="invalid")
                                                                               out.print("<b><p style='color:red'>This patient name doesn't exist</p></b>");
                                                                            %>
							<div class="form-group">
								<label for="documentName"><i
									class="zmdi zmdi-account material-icons-name"></i></label> 
                                                                        <input type="text" placeholder="Document Name" name="documentName" <%if((request.getAttribute("documentName")=="valid"))out.print("value="+request.getAttribute("documentNameValue"));%> required>							
                                                        </div>
                                                        <div class="form-group">
								<label for="documentDate"><i
									class="zmdi zmdi-account material-icons-name"></i></label> 
                                                                        <input type="date" placeholder="Document Date" name="documentDate"  <%if((request.getAttribute("documentDate")=="valid"))out.print("value="+request.getAttribute("documentDateValue"));%>    required>
                                                                       
                                                        </div>      <%if(request.getAttribute("documentDate")=="invalid")
                                                                               out.print("<b><p style='color:red'>This document date is invalid</p></b>");
                                                                            %>
                                                                
                                                      
                                                        <div class="form-group">
								
                                                                       							
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <b>Document Type:</b> <span><span></span></span>  <!-- &nbsp; -->                                                                                </td>
                                                                                <td>  
                                                                                       <select name="documenttype" required>
                                                                                        <option value="prescription">Prescription</option>
                                                                                        <option value="scan">Scan</option>
                                                                                        <option value="labTest">Lab Test</option>
                                                                                        

                                                                                      </select>
                                                                                </td>
                    
                </tr>
                                                                        </table>
                                                        </div>
                                                       
                                                                   
							<div class="form-group form-button">
								<input type="submit" 
									class="form-submit" value="Upload" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="<%= request.getContextPath() %>/Images/patient.png" alt="sing up image">
						</figure> <a href="<%=request.getContextPath()%>/Doctor/homepage.jsp">Home</a>
                                            
					</div>
				</div>
			</div>
		</section>


	</div>
	
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>



</body>
</html>
