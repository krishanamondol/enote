<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.enotes.entities.User" %>
<%
    User user = (User) session.getAttribute("userD");
    if (user==null){
        session.setAttribute("notLogin","Please Log in First");
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
<!-- Vertically centered modal -->
<h1 class="text-center mt-3">Add Your Notes</h1>
<div class="container mt-5">
 
    <form action="AddNote" method="POST">
       
        <div class="form-group">

            <% if (user != null) {%>
            <input name="userid" type="hidden" value="<%=user.getId() %>">
            <%}
            %>
            <label for="exampleInputEmail1">Add Title</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="title" placeholder="Enter title">
           
          </div>
        <div class="form-group">
            <label for="exampleFormControlTextarea1">Add Details</label>
            <textarea rows="9" class="form-control" id="exampleFormControlTextarea1" rows="3" name="content"></textarea>
        </div>
        <div class="container text-center">
            <button type="submit" class="btn btn-primary ">Submit</button>
        </div>
      </form>
    <%
        String noteMsg = (String) session.getAttribute("noteSuccess");
        if (noteMsg != null) {%>
    <div class="alert alert-success" role="alert"><%= noteMsg %>
    </div>
    <%
        }
        session.removeAttribute("noteSuccess");
    %>
    <%
        String faileMsg = (String) session.getAttribute("faildNote");
        if (faileMsg != null) {%>
    <div class="alert alert-danger" role="alert"><%= faileMsg %>
    </div>
    <%
        }
        session.removeAttribute("faildNote");
    %>
</div>
<jsp:include page="component/pages/Footer.jsp"/>
</body>
</html>