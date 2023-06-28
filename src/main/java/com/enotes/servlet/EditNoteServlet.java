package com.enotes.servlet;

import com.enotes.dao.PostDao;
import com.enotes.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

public class EditNoteServlet extends HttpServlet {
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

            String postSlNo = request.getParameter("get-postId");
            String update_title = request.getParameter("update_title");
            String update_content = request.getParameter("update_content");
//            Integer slNo = Integer.valueOf(postSlNo);
            PostDao dao = new  PostDao(ConnectionProvider.getConnection());
            boolean f = dao.updatePost(postSlNo,update_title,update_content);
            HttpSession session;
            if (f) {
                session = request.getSession();
                session.setAttribute("postUpdate","Set Your New Date");
                response.sendRedirect("ShowNote.jsp");
            }else {
                session = request.getSession();
                session.setAttribute("postNotUpdate","Something Went Wrong");
                response.sendRedirect("ShowNote.jsp");
            }


            out.println("</body>");
            out.println("</html>");
        }

    }
}
