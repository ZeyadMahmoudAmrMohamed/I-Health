
<% if(session.getAttribute("patientObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>
        <%@page import="webAppObjects.Patient"%>
<jsp:useBean class="webAppObjects.Patient" id="pat" scope="session">
</jsp:useBean>
<%pat = (Patient)session.getAttribute("patientObj");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
        <title>Patient Profile Page</title>
        <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/assets/favicon.ico" />

<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />

<link href="<%=request.getContextPath()%>/CSS/index-styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">HealthCare App Patient Profile Page</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				
                                                <ul class="navbar-nav ms-auto">
                                                <li class="nav-item mx-0 mx-lg-1 "><a
						class="nav-link py-3 px-0 px-lg-3 rounded"href="<%=request.getContextPath()%>/Patient/patientHomePage.jsp">Home</a></li>
					
                                                <li class="nav-item mx-0 mx-lg-1 "><a
						class="nav-link py-3 px-0 px-lg-3 rounded"href="<%=request.getContextPath()%>/Patient/Profile/patProfilePage.jsp"><%=pat.getFullName()%> </a></li>
					
					
						<li class="nav-item mx-0 mx-lg-1 bg-danger"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="<%=request.getContextPath()%>/logoutController">Logout</a></li>
                                                </ul>
			</div>
		</div>
	</nav>
                

<!-- comment -->

  





	
	<header class="masthead bg-primary text-white ">
		
                           
                                     <table align="center" class="masthead-subheading text-white mb-0">
                                         
                                         <tr>
                                             <td>
                                                 Name: 
                                             </td>
                                             <td>
                                                 <%=pat.getFullName()%>
                                             </td>
                                         </tr>
                                         <tr>
                                             <td>
                                                 Gender:  
                                             </td>
                                             <td>
                                                 <%=pat.getGender()%>
                                             </td>
                                         </tr>
                                         
                                         <tr>
                                             <td>
                                                 NID:  
                                             </td>
                                             <td>
                                                 <%=pat.getNID()%>
                                             </td>
                                         </tr>
                                        
                                     </table>
                                    
                                     
                               
				</div>		
	</header>
	
	
	<footer class="footer text-center">
		
	</footer>
	<div class="copyright py-4 text-center text-white">
		
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="js/scripts.js"></script>
	
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
