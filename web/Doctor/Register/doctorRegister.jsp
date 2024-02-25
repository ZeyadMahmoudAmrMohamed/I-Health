<%-- 
    Document   : doctorRegister
    Created on : May 4, 2023, 6:45:24 AM
    Author     : zizof
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Register Page</title>
    </head>
    <body>
         <h1>Doctor Register </h1><br/>
         <!<!-- ../../doctorRegister -->
        <form action="controlDoctorRegister.jsp" method="post">
              <table>
                <tr>
                    <td>
                        Full Name: 
                    </td>
                    <td>
                        <input type="text" placeholder="Enter FullName" name="fullName" required="3">
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
                        Specialization: 
                    </td>
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
                        <input type="email" placeholder="Enter Mail" name="docEmail"required>
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
            <!--<label>Full Name</label><br/>
            <input type="text" placeholder="Enter FullName" name="fullName"><br/>
            <label>User Name</label><br/>
            <input type="text" placeholder="Enter UserName" name="userName"><br/>
            <label>National ID</label><br/>
            <input type="text" placeholder="Enter NID" name="NID"><br/>
            <label>Specialization</label><br/>
            <input type="text" placeholder="Enter Specialization" name="specialization"><br/>
            <label>Email</label><br/>
            <input type="email" placeholder="Enter Mail" name="docEmail"><br/>
            <label>Password</label><br/>
            <input type="password" placeholder="Enter password" name="userPass"><br/>
            <label>Confirm Password</label><br/>
            <input type="password" placeholder="Confirm password" name="confirmPass"><br/><br/>
            
            <input type ="submit" value ="Register">-->
        </form>
    </body>
</html>
