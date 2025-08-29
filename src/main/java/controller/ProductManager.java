package controller;

import DAO.DAO;
import entity.Account;
import entity.Category;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


public class ProductManager extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        
        Account acc = (Account) session.getAttribute("acc");

        if (acc == null) {
           
            response.sendRedirect("login.jsp");
            return;
        }
        DAO dao = new DAO();
        List<Product> productList = dao.getProductByUserId(acc.getId());
        request.setAttribute("listP", productList);
        List<Category> categoryList = dao.getAllCategory() ;
        request.setAttribute("listC",categoryList); 
        request.getRequestDispatcher("managerproduct.jsp").forward(request, response);
      
      }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response); 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response); 
    }

    @Override
    public String getServletInfo() {
        return "ProductManager Servlet";
    }
}
