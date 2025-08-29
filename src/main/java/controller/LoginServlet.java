/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAO;
import entity.Account;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


/**
 *
 * @author mac
 */

public class LoginServlet extends HttpServlet {
//    private Account checkLogin(String username , String password){
//        if("admin".equals(username) && "123".equals(password)){
//        return new Account(username,password,1,1 ); } 
//        else if("dat".equals(username) && "2004".equals(password)){     
//        return new Account(username,password,1,0 ); }    
//          else if("user".equals(username) && "user".equals(password)){     
//        return new Account(username,password,0,0 ); }   
//        return null ; 
//    }
    

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
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
          //login huyển sang 1 trang khácc 
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        DAO DAO = new DAO();  
        
        Account acc = DAO.checkLogin(username, password); 
        if (acc!=null) {
      
            HttpSession session = request.getSession();
           
           
            session.setAttribute("username", username);
            session.setAttribute("fine", "Welcome to Fruit Shop!");
            session.setAttribute("acc", acc);
            response.sendRedirect(request.getContextPath() +"/upload");
            
           
          
        } else {
            
            request.setAttribute("error", "Invalid username or password.");
          request.getRequestDispatcher("upload").forward(request, response);
           
        }
    }

//--------------------------------------------------------//


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
