/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAO;
import entity.Account;
import entity.CartItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;


/**
 *
 * @author mac
 */
public class CheckoutControl extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckoutControl</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutControl at " + request.getContextPath() + "</h1>");
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
    Account acc = (Account) session.getAttribute("acc");
    Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

    if (cart == null || cart.isEmpty()) {
        response.sendRedirect("cart.jsp");
        return;
    }

    int customerId;
    String status = "Pending";
    DAO dao = new DAO();

    // Nếu chưa login → xử lý tạo tài khoản tạm (hoặc lưu thông tin đơn hàng riêng)
    if (acc == null) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        // Ở đây bạn có thể lưu thông tin vào bảng khác như GuestOrder hoặc Users nếu muốn
        // Tạm thời gán customerId = -1 hoặc 0 để phân biệt guest
        customerId = -1;

        // (Tuỳ thiết kế: bạn có thể tạo bảng GuestOrders để lưu thêm tên, email, địa chỉ,… ở đây)
    } else {
        customerId = acc.getId();
    }

    try {
        // 1. Tạo đơn hàng mới
        int orderId = dao.createOrder(customerId, status);

        // 2. Thêm chi tiết đơn hàng
        for (CartItem item : cart.values()) {
            dao.addOrderDetail(orderId, item.getProduct().getId(), item.getQuantity(), item.getSubTotal());
        }
        for (CartItem item : cart.values()) {
    System.out.println("Thêm OrderDetail: pid=" + item.getProduct().getId() + ", qty=" + item.getQuantity() + ", subtotal=" + item.getSubTotal());
     dao.addOrderDetail(orderId, item.getProduct().getId(), item.getQuantity(), item.getSubTotal());
    }

        // 3. Xoá giỏ hàng
        if (acc != null) {
            dao.clearCart(customerId);
        }

        // 4. Xoá session cart
        session.removeAttribute("cart");

       session.setAttribute("checkoutSuccess", true);
       request.getRequestDispatcher("cart.jsp").forward(request, response);

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("errorPage.jsp");
    }
    
        
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
