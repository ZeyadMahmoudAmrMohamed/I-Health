
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import webAppObjects.DB;

/**
 *
 * @author zizof
 */
@WebServlet(name = "creditCardInsertionController", urlPatterns = {"/creditCardInsertionController"})
public class creditCardInsertionController extends HttpServlet {

    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String creditNumber= request.getParameter("creditNumber");
        String cardHolderName = request.getParameter("cardHolderName");
        DB d = new DB();
        RequestDispatcher correctRd = request.getRequestDispatcher("Patient/Credit/controlCreditInsertion.jsp");
        RequestDispatcher wrongRd = request.getRequestDispatcher("Patient/Credit/insertCard.jsp");
        if(d.isParsable(creditNumber)){
            request.setAttribute("cardNumber", creditNumber);
            request.setAttribute("holderName", cardHolderName);
            correctRd.forward(request, response);
        }
        else {
            request.setAttribute("status", "invalid");

            wrongRd.forward(request, response);
        }
    }

  

}
