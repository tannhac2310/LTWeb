/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AccountDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import Entity.Account;
import Entity.Cart;
import Entity.Invoice;
import Entity.Items;
import Entity.LineItem;
import Entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
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
@WebServlet(name = "OrderControl", urlPatterns = {"/order"})
public class OrderControl extends HttpServlet {

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
        Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
        HttpSession session = request.getSession(false);
        Cart cart = (Cart) session.getAttribute("cart");
        Account account = (Account) session.getAttribute("acc");
        String codeverify = (String) session.getAttribute("coder");
        String authcode = request.getParameter("authcode");
        String messageAuth = "MÃ CODE KHÔNG HỢP LỆ!";
        //Gọi các DAO
        OrderDAO dao = new OrderDAO();
        
        ///For tạo đơn
        ArrayList<LineItem> k = cart.getItems();
        double total = 0;          
        for (int i = 0;i < cart.getCount(); i++) 
        {
            if (cart.getItems() != null)
            {
                
                total += k.get(i).getTotal();
            }
        }
        double TotalPrice = total * 1.05;
        int id = account.getUID();
        Date date = calendar.getTime();
        Invoice invoice = new Invoice(id, date, TotalPrice, 'n');
        
        //Tạo lineitem
        //Tìm InvoiceID mới nhất
        int reID = 0;

        List<Invoice> invoiceid = dao.getInvoiceTOP();
        reID = invoiceid.get(0).getInvoiceID() + 10;
        
        // Tiến hành tạo đơn và thêm các items vào
        if (codeverify.equals(authcode))
        {
                if (cart.getCount() > 0) {
                //Tạo bill
                int newBill = dao.createInvoice(invoice);    
                //Thêm item vào bill
                int pid = 0;
                int qty = 0;
                for (int i = 0; i < cart.getCount(); i++)
                {
                    if (cart.getItems() != null)
                    {

                        pid = k.get(i).getProduct().getId();
                        qty = k.get(i).getQuantity();
                    }
                    Items item = new Items(reID, pid, qty);
                    int newitem = dao.createLineItem(item);
                }
                session.removeAttribute("coder");
                session.removeAttribute("cart");
                response.sendRedirect("thanks.jsp");    

                }
        } 
        else 
        {
            request.setAttribute("messageCODE", messageAuth );
            request.getRequestDispatcher("verify.jsp").forward(request, response);
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
