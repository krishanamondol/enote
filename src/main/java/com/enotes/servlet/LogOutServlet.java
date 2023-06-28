package com.enotes.servlet;

import com.enotes.dao.UserDao;
import com.enotes.entities.Message;
import com.enotes.entities.User;
import com.enotes.helper.ConnectionProvider;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;

public class LogOutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Register Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            HttpSession session = request.getSession();
            session.removeAttribute("userD");
            Message message = new Message("Log Out Successfully ","success","alert-success");
            session.setAttribute("success",message);
            response.sendRedirect("Login.jsp");
            out.println("Hello");
            out.println("</body>");
            out.println("</html>");
            }
        }
    }

