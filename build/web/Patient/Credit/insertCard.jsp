<%-- 
    Document   : insertCard
    Created on : May 20, 2023, 7:16:34 PM
    Author     : zizof
--%>

<%@page import="webAppObjects.Patient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    
    <% if(session.getAttribute("patientObj")==null){
    response.sendRedirect("../../Login/login.jsp");
        }%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <jsp:useBean class="webAppObjects.Patient" id="pat" scope="session">
</jsp:useBean>

<%pat = (Patient)session.getAttribute("patientObj");%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/creditStyle.css">

</head>
<body><ul>
<li><a href="<%=request.getContextPath()%>/Patient/patientHomePage.jsp">Home</a></li>
                 <li><a href="#"><%=pat.getFullName()%></a></li></ul>
<div class="container">

    <div class="card-container">

        <div class="front">
            <div class="image">
                <img src="<%=request.getContextPath()%>/Images/chip.png" alt="">
                <img src="<%=request.getContextPath()%>/Images/visa.png" alt="">
            </div>
            <div class="card-number-box">################</div>
            <div class="flexbox">
                <div class="box">
                    <span>card holder</span>
                    <div class="card-holder-name">full name</div>
                </div>
                <div class="box">
                    <span>expires</span>
                    <div class="expiration">
                        <span class="exp-month">mm</span>
                        <span class="exp-year">yy</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="back">
            <div class="stripe"></div>
            <div class="box">
                <span>CVV</span>
                <div class="cvv-box"></div>
                <img src="<%=request.getContextPath()%>/Images/visa.png" alt="">
            </div>
        </div>

    </div>

    <form action="<%=request.getContextPath()%>/creditCardInsertionController" method="post">
        <div class="inputBox">
            <span>card number</span>
            <input type="text" minlength="16" maxlength="16" name="creditNumber" class="card-number-input" required>
        </div>
        <%if(request.getAttribute("status")=="invalid")
                         out.print("<b><p style='color:red'>Credit Number must be only digits</p></b>");
                       %>
        <div class="inputBox">
            <span>card holder</span>
            <input type="text" maxlength="50" name="cardHolderName" class="card-holder-input" required>
        </div>
        <div class="flexbox">
            <div class="inputBox">
                <span>expiration mm</span>
                <select name="" id="" class="month-input">
                    <option value="month" selected disabled>month</option>
                    <option value="01">01</option>
                    <option value="02">02</option>
                    <option value="03">03</option>
                    <option value="04">04</option>
                    <option value="05">05</option>
                    <option value="06">06</option>
                    <option value="07">07</option>
                    <option value="08">08</option>
                    <option value="09">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>
            </div>
            <div class="inputBox">
                <span>expiration yy</span>
                <select name="" id="" class="year-input">
                    <option value="year" selected disabled>year</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                    <option value="2026">2026</option>
                    <option value="2027">2027</option>
                    <option value="2028">2028</option>
                    <option value="2029">2029</option>
                    <option value="2030">2030</option>
                </select>
            </div>
            <div class="inputBox">
                <span>CVV</span>
                <input type="text" maxlength="4" class="cvv-input">
            </div>
        </div>
        <input type="submit" value="submit" class="submit-btn">
    </form>

</div>    
    





<script>

document.querySelector('.card-number-input').oninput = () =>{
    document.querySelector('.card-number-box').innerText = document.querySelector('.card-number-input').value;
}

document.querySelector('.card-holder-input').oninput = () =>{
    document.querySelector('.card-holder-name').innerText = document.querySelector('.card-holder-input').value;
}

document.querySelector('.month-input').oninput = () =>{
    document.querySelector('.exp-month').innerText = document.querySelector('.month-input').value;
}

document.querySelector('.year-input').oninput = () =>{
    document.querySelector('.exp-year').innerText = document.querySelector('.year-input').value;
}

document.querySelector('.cvv-input').onmouseenter = () =>{
    document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(-180deg)';
    document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(0deg)';
}

document.querySelector('.cvv-input').onmouseleave = () =>{
    document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(0deg)';
    document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(180deg)';
}

document.querySelector('.cvv-input').oninput = () =>{
    document.querySelector('.cvv-box').innerText = document.querySelector('.cvv-input').value;
}

</script>

</body>
</html>
