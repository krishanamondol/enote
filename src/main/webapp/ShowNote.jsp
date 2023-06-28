<%@ page import="com.enotes.entities.User" %>
<%@ page import="com.enotes.dao.PostDao" %>
<%@ page import="com.enotes.helper.ConnectionProvider" %>
<%@ page import="java.util.List" %>
<%@ page import="com.enotes.entities.Post" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%
  User user = (User) session.getAttribute("userD");
      if (user == null) {
    response.sendRedirect("Login.jsp");
  }
%>
<html>
<head>
  <title>Homepage</title>
  <link rel="stylesheet" type="text/css" href="component/css/style.css" />

<%@include file="component/all_link.jsp" %>

</head>
<body>
<jsp:include page="component/pages/Navbar.jsp"/>

<%
String DeleteMsg = (String) session.getAttribute("DeleteMsg");
  if (DeleteMsg != null) {%>
<div class="alert alert-success" role="alert"><%=DeleteMsg%></div>
  <%}
  session.removeAttribute("DeleteMsg");
%>

<%
  String postUpdate = (String) session.getAttribute("postUpdate");
  if (postUpdate!= null) {%>
<div class="alert alert-success" role="alert"><%=postUpdate%></div>
<%}
  session.removeAttribute("postUpdate");
%>

<%
  String postNotUpdate = (String) session.getAttribute("postNotUpdate");
  if (postNotUpdate != null) {%>
<div class="alert alert-danger" role="alert"><%=postNotUpdate%></div>
<%}
  session.removeAttribute("postNotUpdate");
%>

<div class="container">
  <h2 class="text-center">All Note</h2>
  <div class="row">
    <div class="col-md-12">
      <%
        if (user!= null){
          PostDao dao = new PostDao(ConnectionProvider.getConnection());
          List<Post> post =dao.getData(user.getId());
          for (Post post1 : post){%>
      <div class="card mt-3">
        <img src="component/images/writing.png" style="max-height: 200px" class="mx-auto mt-5" alt="">
        <div class="card-body">

          <h4 class="card-title"><%=post1.getTitle()%></h4>
          <p><%= post1.getContent()%></p>
          <p>
            <b class="text-success text-success">Published By : <%=user.getName()%></b>
          </p>
          <div class="container text-center mt-2">
            <a href="DeleteServlet?note_id=<%=post1.getId()%>" class="btn btn-danger" >Delete</a>
            <a href="Edit.jsp?post_id=<%=post1.getId()%>" class="btn btn-success" >Edit</a>

          </div>
        </div>
      </div>
      <%}
      }
      %>

    </div>
  </div>
</div>


<jsp:include page="component/pages/Footer.jsp"/>
</body>
</html>