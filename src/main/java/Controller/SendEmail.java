/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Entity.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.EmailCode;
import javax.mail.Message;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NHAC
 */
@WebServlet(name = "SendEmail", urlPatterns = {"/sendemail"})
public class SendEmail extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private String host;
    private String port;
    private String username;
    private String pass;
    public SendEmail() {
        super();
    }
    
    public void init() {
        // reads SMTP server setting from web.xml file
        host = "smtp.gmail.com";
        port = "587";
        username = "healthcare.javamail@gmail.com";
        pass = "Healthcarejavamail1";
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendEmail</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendEmail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //TODO
//        RequestDispatcher rd = request.getRequestDispatcher("/verify.jsp");
//        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //HttpSession session = request.getSession(false);
        HttpSession session = request.getSession(false);
        Account account = (Account) session.getAttribute("acc");
        Cart cart = (Cart) session.getAttribute("cart");
        String email = account.getEmail();
        String resultMessage = "";
        String code = EmailCode.getRandom();
        //call the send email method
        boolean test;
        try {
            test = EmailCode.sendEmail(host, port, username, pass, email, "Email Verification",
            "Please verify your checkout using this code: " + code);
	} catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            test = false;
        }
        
        //
        if (cart.getCount() > 0)
        {
            if(test){
                session.setAttribute("coder", code);
                response.sendRedirect("verify.jsp");
                resultMessage = "We already send a verification  code to your email.";
            } 
            else
            {
                    resultMessage = "There were an error. Please try again!";
            }        
        }
        else {
            response.sendRedirect("home");
        }
	
        
        //check if the email send successfully
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
