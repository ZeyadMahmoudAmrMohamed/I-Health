<%@page import="webAppObjects.Admin"%>
<% if(session.getAttribute("adminObj")==null){
    response.sendRedirect("../Login/login.jsp");
        }%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="webAppObjects.Admin" id="admin" scope="session">
</jsp:useBean>
<%admin = (Admin)session.getAttribute("adminObj");%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/assets/favicon.ico" />

<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
 <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />

<link href="<%=request.getContextPath()%>/CSS/index-styles.css" rel="stylesheet" />
        <title>Admin Add Item</title>
           <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/mainStyle.css" type="text/css"/>
    </head>
    <body>
        <nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" >Add Pharmacy Item</a>
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
						class="nav-link py-3 px-0 px-lg-3 rounded"><%=admin.getFullName()%></a></li>
					
                                                <li class="nav-item mx-0 mx-lg-1"><a
                                                        class="nav-link py-3 px-0 px-lg-3 rounded" href="<%=request.getContextPath()%>/Admin/homepage.jsp">Home</a></li>
					
					
						<li class="nav-item mx-0 mx-lg-1 bg-danger"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="<%=request.getContextPath()%>/logoutController">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
                               
            <header class=" bg-primary text-white text-center">
		
		
	
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
                                    <form action="<%=request.getContextPath()%>/AddIController" method="post">
                                    <table align="center">
                                         
                                         <tr>
                                              <td>
                                                 <b><p class="masthead-subheading font-weight-light mb-0 center">Item name</p></b>
                                             </td><td>
                                               <input type="text" name="iname" class=""/>                                             
                                             </td>
                                            
                                         </tr>
                                         <tr>
                                             <td>
                                                 <b><p class="masthead-subheading font-weight-light mb-0 center">Item price</p></b>
                                             </td><td>
                                               <input type="text" name="iprice"/>                                             
                                             </td>
                                            
                                         </tr>
                                         <tr>
                                               <td>
                                                 <b><p class="masthead-subheading font-weight-light mb-0 center">Quantity</p></b>
                                             </td><td>
                                               <input type="text" name="quantity"/>                                             
                                             </td>
                                            
                                             
                                             
                                             
                                         </tr>
                                         <tr>
                                             <td>
                                                 <b><p class="masthead-subheading font-weight-light mb-0 center">Item Manufacturer</p></b>
                                             </td><td>
                                               <input type="text" name="iman"/>                                             
                                             </td>
                                            
                                             
                                         </tr>
                                         <tr>
                                            <td>
                                                 <b><p class="masthead-subheading font-weight-light mb-0 center">Upload Image</p></b>
                                             </td><td>
                                               <input type="text" name="image"/>                                             
                                             </td>
                                            
                                         </tr>
                                         <tr>
                                            <td>
                                            </td>
                                            <td>
                                                 <input type="submit" value="ADD"/>
                                            </td>
                                         </tr>
                                     </table>
                                </form>
				</div>	
	</header>
	<footer class="footer text-center">
		
	</footer>
	
                                
                                            
                               
                                              
                                             
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="js/scripts.js"></script>
	
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
    <div class="copyright ">
		
	</div>
</html>
