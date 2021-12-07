/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ProductDAO;
import Entity.Cart;
import Entity.LineItem;
import Entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
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
@WebServlet(name = "CartControl", urlPatterns = {"/cart"})
public class CartControl extends HttpServlet {

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
//        //Lấy id của vật phẩm
//        int pid = Integer.parseInt(request.getParameter("pid"));
//        //
//        ProductDAO dao = new ProductDAO();
//        Product cartItem = dao.getProductByID(pid);
//        request.setAttribute("cartItem", cartItem);
//        request.getRequestDispatcher("cart.jsp").forward(request, response);
        
        
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
        //TODO
        
        ServletContext sc = getServletContext();
        
        //get Current Action
        String action = request.getParameter("action");
        if (action == null) {
            action = "cart";    
            //defaut
        }
        
        String productID = request.getParameter("pid");
        String quantityString = request.getParameter("quantity");
        //Lấy dữ liệu
        HttpSession session = request.getSession(false);
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null){
            cart = new Cart();
        }
        
        int quantity;
        try {
            quantity = Integer.parseInt(quantityString);
            if (quantity < 0) {
                quantity = 1;
            }
            
        } catch (NumberFormatException e) {
            quantity = 1;
        }
        
        //
        ProductDAO dao = new ProductDAO();
        Product product = null;
	product = dao.getProductByID(Integer.parseInt(productID));
        
        LineItem lineItem = new LineItem();
        lineItem.setProduct(product);
        lineItem.setQuantity(quantity);
        double ti = 0;
        if (quantity > 0)
        {
            cart.addItem(lineItem);
            cart.TotalItem(lineItem);
        }
        else if (quantity == 0){
            cart.removeItem(lineItem);
        }
        session.setAttribute("cart", cart);
        
        //sc.getRequestDispatcher("/single-product.jsp").forward(request, response);
        sc.getRequestDispatcher("/cart.jsp").forward(request, response);
        //sc.getRequestDispatcher("/components/header.jsp").forward(request, response);
        
        
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
