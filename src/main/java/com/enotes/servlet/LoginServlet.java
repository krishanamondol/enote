package com.enotes.servlet;

import com.enotes.dao.UserDao;
import com.enotes.entities.Message;
import com.enotes.entities.User;
import com.enotes.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Login  Servlet</title>");
            out.println("</head>");
            out.println("<body>");
//          Get Email and password form request Input user??
            String email = request.getParameter("user-email");
            String password = request.getParameter("user-password");
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            User user = dao.getUserEmailAndPassword(email,password);
            HttpSession session;


            if (user == null){
               session = request.getSession();
                Message message = new Message("Invalid Details ! try with another","error","alert-danger");
                session.setAttribute("failed-msg",message);
                response.sendRedirect("Login.jsp");
            }else {
                session = request.getSession();
                session.setAttribute("userD",user);
                response.sendRedirect("Home.jsp");
            }

            out.println("</body>");
            out.println("</html>");
        }

    }
}
