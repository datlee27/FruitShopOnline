package controller ;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/testAcc")
public class TestAccServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // Lấy session hiện tại, không tạo mới

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        if (session != null) {
            Object acc = session.getAttribute("acc");
            if (acc != null) {
                out.println("acc tồn tại trong session: " + acc.toString());
            } else {
                out.println("acc không tồn tại trong session");
            }
        } else {
            out.println("Session chưa được tạo");
        }
    }
}
