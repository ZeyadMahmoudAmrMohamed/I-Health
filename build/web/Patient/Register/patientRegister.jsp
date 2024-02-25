<%-- 
    Document   : patientRegister
    Created on : May 4, 2023, 6:46:20 AM
    Author     : zizof
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Register Page</title>
    </head>
     <body>
         <!<!-- ../../patientRegister -->
         <h1>Patient Register </h1><br/>
        <form action="controlPatientRegister.jsp" method="post">
            <table>
                <tr>
                    <td>
                        Full Name: 
                    </td>
                    <td>
                        <input type="text" placeholder="Enter FullName" name="fullName" required>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        User Name:
                    </td>
                    <td>
                        <input type="text" placeholder="Enter UserName" name="userName" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        National ID: 
                    </td>
                    <td>
                        <input type="text" placeholder="Enter NID" name="NID" required>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        Birth Date: 
                    </td>
                    <td>
                        <input type="date" placeholder="Enter birth date" name="birthDate" required>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        Blood Type: 
                    </td>
                    <td>  
                            <select name="bloodType" required>
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
                <tr>
                    <td>
                        Gender: 
                    </td>
                    <td>
                        <input type="radio" name="gender" value="male" required> Male
            <input type="radio" name="gender" value="female" required> Female
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        Email: 
                    </td>
                    <td>
                        <input type="email" placeholder="Enter Mail" name="patEmail"required>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        Password: 
                    </td>
                    <td>
                        <input type="password" placeholder="Enter password" name="userPass" required>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        Confirm Password: 
                    </td>
                    <td>
                        <input type="password" placeholder="Confirm password" name="confirmPass">
                    </td>
                    
                </tr>
                <tr> 
                    <td> <input type ="submit" value ="Register"></td> 
                </tr><!-- comment -->
            </table>
           <!-- <label>Full Name</label><br/>
            <input type="text" placeholder="Enter FullName" name="fullName"><br/>
            <label>User Name</label><br/>
            <input type="text" placeholder="Enter UserName" name="userName"><br/>
            <label>National ID</label><br/>
            <input type="text" placeholder="Enter NID" name="NID"><br/>
            <label>Birth Date</label><br/>
            <input type="date" placeholder="Enter birth date" name="birthDate"><br/>
            <label>Blood Type</label><br/>
            <input type="text" placeholder="Enter blood type" name="bloodType"><br/>
            <input type="radio" name="gender" value="male"> Male
            <input type="radio" name="gender" value="female"> Female<br/>
            <label>Email</label><br/>
            <input type="email" placeholder="Enter Mail" name="patEmail"><br/>
            <label>Password</label><br/>
            <input type="password" placeholder="Enter password" name="userPass"><br/>
            <label>Confirm Password</label><br/>
            <input type="password" placeholder="Confirm password" name="confirmPass"><br/><br/>
            
            <input type ="submit" value ="Register"> -->
        </form>
    </body>
</html>
