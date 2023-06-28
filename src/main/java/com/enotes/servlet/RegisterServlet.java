package com.enotes.servlet;

import com.enotes.dao.UserDao;
import com.enotes.entities.User;
import com.enotes.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Register Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            String check = request.getParameter("check");
            if (check == null) {
                out.println("please check terms and condition");
            } else {
                // fetch all data

                String name = request.getParameter("user-name");
                String email = request.getParameter("user-email");
                String password = request.getParameter("user-password");

           //   Create User Object To Set Data
                User user = new User(name, email, password);

          //     Crete User Dao T
                UserDao dao = new UserDao(ConnectionProvider.getConnection());
                HttpSession session;
                boolean f = dao.saveUser(user);

                if (f) {
                    session = request.getSession();
                    session.setAttribute("reg-success", "Registration Successfully");
                    response.sendRedirect("Register.jsp");
                } else {
                    session = request.getSession();
                    session.setAttribute("failed-msg", "Something went on Wrong");
                    response.sendRedirect("Register.jsp");
                }
            }
            out.println("</body>");
            out.println("</html>");
        }
    }
}
