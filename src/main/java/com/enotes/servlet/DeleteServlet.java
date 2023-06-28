package com.enotes.servlet;

import com.enotes.dao.PostDao;
import com.enotes.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String postId = request.getParameter("note_id");
        //Integer noteId = Integer.parseInt(postId);
        PostDao dao = new PostDao(ConnectionProvider.getConnection());
        boolean f =  dao.deleteNote(postId);
        HttpSession session;
        if (f) {
            session = request.getSession();
            session.setAttribute("DeleteMsg","Note Delete Successfully");
            response.sendRedirect("ShowNote.jsp");
        }else {
            session = request.getSession();
            session.setAttribute("WrongMsg","Delete Unsuccessfully");
            response.sendRedirect("ShowNote.jsp");
        }

    }
}
