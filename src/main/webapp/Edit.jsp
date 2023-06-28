<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.enotes.dao.PostDao" %>
<%@ page import="com.enotes.helper.ConnectionProvider" %>
<%@ page import="com.enotes.entities.Post" %><%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 2/19/2023
  Time: 11:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<html>
<head>
    <title>Homepage</title>
    <link rel="stylesheet" type="text/css" href="component/css/style.css" />
    <%@include file="component/all_link.jsp" %>
</head>

<body>

<jsp:include page="component/pages/Navbar.jsp"/>
<%
    String id =request.getParameter("post_id");
    PostDao dao = new PostDao(ConnectionProvider.getConnection());
    Post post = dao.getDateById(id);
%>
<h1 class="text-center mt-3">Add Your Notes</h1>
<div class="container mt-5">
    <form action="EditServlet" method="POST">

        <div class="form-group">

          <input type="hidden" name="get-postId" value="<%=id%>">
<%--            <c:if test="${book != null}">--%>
<%--            <input type="hidden" name="id" value="<c:out value='${book.id}' />" />--%>
<%--            </c:if>--%>
            <label for="exampleInputEmail1">Add Title</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="update_title"value="<%=post.getTitle()%>" >

        </div>
        <div class="form-group">
            <label for="exampleFormControlTextarea1" >Add Details</label>
            <textarea rows="9" class="form-control" id="exampleFormControlTextarea1" rows="3" name="update_content" ><%=post.getContent()%></textarea>
        </div>
        <div class="container text-center">
            <button type="submit" class="btn btn-primary ">Update</button>
        </div>
    </form>
</div>
<jsp:include page="component/pages/Footer.jsp"/>




</body>
</html>