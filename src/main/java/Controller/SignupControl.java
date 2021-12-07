/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AccountDAO;
import Entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NHAC
 */
@WebServlet(name = "SignupControl", urlPatterns = {"/signup"})
public class SignupControl extends HttpServlet {

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
        String newUser = request.getParameter("newUser");
        String newEmail = request.getParameter("newEmail");
        String newTelephone = request.getParameter("newTelephone");
        String newPassword = request.getParameter("newPassword");
        String newConfirm = request.getParameter("newConfirm");
        
        Account NewAccount = new Account(newUser, newPassword, 0, 0, newEmail, newTelephone);
        
        //Lấy được thông tin từ người dùng
        if (!newPassword.equals(newConfirm)) {
            request.setAttribute("messageregister", "Mật khẩu không trùng khớp!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        else {
            AccountDAO dao = new AccountDAO();
            Account acc = dao.checkAccountExist(newUser);
            if (acc == null) {
                //đăng ký được
                int ok = dao.register(NewAccount);
                
                Account account = dao.login(newUser, newPassword);
                HttpSession session = request.getSession(); 
                session.setAttribute("acc", account);
                response.sendRedirect("home");
            }
            else {
                //fail
                request.setAttribute("messageregister", "Tài khoản đã được sử dụng!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
