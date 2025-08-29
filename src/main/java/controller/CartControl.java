/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAO;
import entity.Account;
import entity.CartItem;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;


/**
 *
 * @author mac
 */
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
            HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        Map<Integer, CartItem> cart =
                (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null) cart = new HashMap<>();
        
        response.setContentType("text/html;charset=UTF-8");
        
        String id = request.getParameter("aid");
             DAO dao = new DAO();
             Product p = dao.getProductByID(id); 
        if (p == null) {
            response.sendRedirect("fruit");
            return;
        }
        
        int pid = p.getId();
        if (cart.containsKey(pid)) {
            CartItem item = cart.get(pid);
            item.setQuantity(item.getQuantity() + 1);
        } else {
            cart.put(pid, new CartItem(p, 1));
        }

        session.setAttribute("cart", cart);

        // ✅ Quay lại trang chủ sau khi thêm
        response.sendRedirect("fruit"); 
        
               
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
         HttpSession session = request.getSession();
    Account acc = (Account) session.getAttribute("acc"); // đã đăng nhập?
    if (acc == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    @SuppressWarnings("unchecked")
    Map<Integer, CartItem> cart =
            (Map<Integer, CartItem>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
        response.sendRedirect("cart.jsp");
        return;
    }

    DAO dao = new DAO();
    int customerId = acc.getId();
   

    for (CartItem ci : cart.values()) {
        dao.addToCart(
                      customerId,
                      ci.getProduct().getId(),
                      ci.getQuantity());
    }

    // xoá giỏ tạm
    session.removeAttribute("cart");
    response.sendRedirect("fruit");
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
