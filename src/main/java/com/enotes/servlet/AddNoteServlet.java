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

public class AddNoteServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (
                PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Add Note Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            int userid = Integer.parseInt(request.getParameter("userid"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            boolean f = dao.addNote(title, content, userid);
            HttpSession session ;
            if (f) {
                session = request.getSession();
                session.setAttribute("noteSuccess","Add note Successfully");
                response.sendRedirect("AddNote.jsp");
            } else {
                session = request.getSession();
                session.setAttribute("faildNote","Note NOt inserted");
                response.sendRedirect("AddNote.jsp");
            }
            out.println("</body>");
            out.println("</html>");

        }
    }

}