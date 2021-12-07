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
@WebServlet(name = "ChangePass", urlPatterns = {"/changepass"})
public class ChangePass extends HttpServlet {

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
        //Lấy dữ liệu hiện tại
        HttpSession session = request.getSession(false);
        Account account = (Account) session.getAttribute("acc");
        int uidnow = account.getUID();
        String username = account.getUser();
        String password = account.getPass();
        String emailnow = account.getEmail();
        String telephone = account.getTel();
        int isSell = account.getIsSell();
        int isAdmin = account.getIsAdmin();
        
        //Lấy dữ liệu người dùng
        String oldPass = request.getParameter("oldPassword");
        String changePassword = request.getParameter("changePassword");
        String changeConfirm = request.getParameter("changeConfirm");
        
        //Nếu không đúng hoặc nhập confirm sai
        String notpass = "Mật khẩu cũ không đúng!";
        String notconfirm = "Mật khẩu mới không trùng khớp!";
        String ok = "Cập nhật thành công!";
        
        //Tạo DAO
        AccountDAO dao = new AccountDAO();
        
        Account updateAccount = new Account(uidnow, username, changePassword, isSell, isAdmin, emailnow, telephone);
        
        if (oldPass.equals(password))
        {
            if (changePassword.equals(changeConfirm))
            {
                int up = dao.update(updateAccount);
                request.setAttribute("messagechangepass", ok);
                request.getRequestDispatcher("account.jsp").forward(request, response);
            }
            else {
            request.setAttribute("messagechangepass", notconfirm);
            request.getRequestDispatcher("account.jsp").forward(request, response);
            }
        }
        else {
            request.setAttribute("messagechangepass", notpass);
            request.getRequestDispatcher("account.jsp").forward(request, response);
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
