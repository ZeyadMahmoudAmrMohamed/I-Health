<%@page import="webAppObjects.Patient"%>
<%@page import="java.util.Date"%>
<jsp:useBean class="webAppObjects.Patient" id="pat" scope="session">
</jsp:useBean>

<%pat = (Patient)session.getAttribute("patientObj");%>
<%
 if ( session.getAttribute("patientObj") == null ) {                               
                 response.sendRedirect(request.getContextPath()+"/Login/login.jsp");
                 return;
 }else {
        response.setHeader("Cache-Control","no-cache,max-age=0, no-store, must-revalidate"); 
    response.addHeader("Cache-Control", "post-check=0, pre-check=0");
    response.setHeader("Pragma","no-cache"); 
    //response.setDateHeader ("Expires", 0);
    response.setDateHeader("Last-Modified", (new Date()).getTime() );
    }
  %>  
<% if(pat==null) request.getRequestDispatcher(request.getContextPath()+"/Login/login.jsp").forward(request, response); %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Patient Homepage</title>

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
			<a class="navbar-brand" href="#page-top">HealthCare App</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
                                                <li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">Actions</a></li>
						<li class="nav-item mx-0 mx-lg-1 "><a
						class="nav-link py-3 px-0 px-lg-3 rounded"href="<%=request.getContextPath()%>/Patient/Profile/patProfilePage.jsp"><%=pat.getFullName()%> </a></li>
					
					
						<li class="nav-item mx-0 mx-lg-1 bg-danger"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="<%=request.getContextPath()%>/logoutController">Logout</a></li>
                                                </ul>
			</div>
		</div>
	</nav>

	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
			
			<% if(!(pat.getGender().equals("male"))) out.print("<img class='masthead-avatar mb-5' src='"+request.getContextPath()+"/Images/patient_1.png' alt='...'/>");
                        else out.print("<img class='masthead-avatar mb-5' src='"+request.getContextPath()+"/Images/patient(1).png' alt='...'/>");%>
		
                        <!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">Welcome <%=session.getAttribute("userName")%></h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">Appointments - Documents - Whatever</p>
		</div>
                 <style>img {
                                        border-radius: 6%;
                                      }
                                table {
                                border-spacing: 1;
                                border-collapse: collapse;
                                background: transparent;
                                border-radius: 6px;
                                overflow: hidden;
                                max-width: 800px;
                                width: 100%;
                                margin: 0 auto;
                                position: relative;
                              }
                              table * {
                                position: relative;
                              }
                              table td, table th {
                                padding-left: 8px;
                              }
                              table thead tr {
                                height: 60px;
                                background: #FFED86;
                                font-size: 16px;
                              }
                              table tbody tr {
                                height: 48px;
                                border-bottom: 1px solid #E3F1D5;
                              }
                              table tbody tr:last-child {
                                border: 0;
                              }
                              table td, table th {
                                text-align: left;
                              }
                              table td.l, table th.l {
                                text-align: right;
                              }
                              table td.c, table th.c {
                                text-align: center;
                              }
                              table td.r, table th.r {
                                text-align: center;
                              }

                              @media screen and (max-width: 35.5em) {
                                table {
                                  display: block;
                                }
                                table > *, table tr, table td, table th {
                                  display: block;
                                }
                                table thead {
                                  display: none;
                                }
                                table tbody tr {
                                  height: auto;
                                  padding: 8px 0;
                                }
                                table tbody tr td {
                                  padding-left: 45%;
                                  margin-bottom: 12px;
                                }
                                table tbody tr td:last-child {
                                  margin-bottom: 0;
                                }
                                table tbody tr td:before {
                                  position: absolute;
                                  font-weight: 700;
                                  width: 40%;
                                  left: 10px;
                                  top: 0;
                                }
                                table tbody tr td:nth-child(1):before {
                                  content: "Code";
                                }
                                table tbody tr td:nth-child(2):before {
                                  content: "Stock";
                                }
                                table tbody tr td:nth-child(3):before {
                                  content: "Cap";
                                }
                                table tbody tr td:nth-child(4):before {
                                  content: "Inch";
                                }
                                table tbody tr td:nth-child(5):before {
                                  content: "Box Type";
                                }
                              }


                              blockquote {
                                color: transparent;
                                text-align: center;
                              }
                                </style>
	
	<section class="page-section portfolio" id="portfolio"></section><div>
                                     <table align="center">
                                         
                                         <tr>
                                             <td>
                                               <a href="<%=request.getContextPath()%>/Patient/Appointments/patientOnline.jsp"  ><img style="width: 400px; height: 260px;" src="<%=request.getContextPath()%>/Images/doctorOnlineMeeting.jpg" alt="Book Online Appointment"/></a>
                                             </td>
                                             <td>
                                               <a href="<%=request.getContextPath()%>/Patient/Appointments/patientPhysical.jsp"  ><img style="width: 400px; height: 260px;" src="<%=request.getContextPath()%>/Images/docPhysicalMeeting.jpg" alt="Book Physical Appointment"/></a>
                                             </td>
                                             <td>
                                               <a href="<%=request.getContextPath()%>/Patient/Appointments/patientViewApp.jsp"  ><img style="width: 400px; height: 260px;" src="<%=request.getContextPath()%>/Images/docResOnline.jpg" alt="Reschedule Online Appointment"/></a>
                                             </td>
                                             
                                         </tr>
                                         <tr>
                                             <td>
                                                 <b><p class="masthead-subheading font-weight-light mb-0 center">Book Online Appointment</p></b>
                                             </td>
                                             <td>
                                                 <b><p class="masthead-subheading font-weight-light mb-0 center">Book Physical Appointment</p></b>
                                             </td>
                                             <td>
                                                 <b><p class="masthead-subheading font-weight-light mb-0 center">View Appointments</p></b>
                                             </td>
                                             
                                         </tr>
                                     </table>
                                     <table align="center">
                                        
                                         <tr>
                                             <td>
                                               <a href="<%=request.getContextPath()%>/Patient/Credit/insertCard.jsp"  ><img style="width: 400px; height: 260px;" src="<%=request.getContextPath()%>/Images/credit.jpg" alt="Add Credit"/></a>
                                             </td>
                                            
                                             <td>
                                               <a href="<%=request.getContextPath()%>/Patient/Documents/patientDocs.jsp"  ><img style="width: 400px; height: 260px;" src="<%=request.getContextPath()%>/Images/docViewApp.jpg" alt="View document"/></a>
                                             </td>
                                             <td>
                                               <a href="<%=request.getContextPath()%>/Patient/Pharm/pharmacy.jsp"  ><img style="width: 400px; height: 260px;" src="<%=request.getContextPath()%>/Images/pharm.png" alt="Online Pharmacy"/></a>
                                             </td>
                                            
                                            
                                         </tr>
                                         <tr>
                                             <td>
                                                 <b><p class="masthead-subheading font-weight-light mb-0 center">Add Credit Card</p></b>
                                             </td>
                                             <td>
                                                 <b><p class="masthead-subheading font-weight-light mb-0 center">View Document</p></b>
                                             </td>
                                             <td>
                                                 <b><p class="masthead-subheading font-weight-light mb-0 center">Online Pharmacy</p></b>
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
