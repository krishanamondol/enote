<%@ page import="com.enotes.entities.Message" %>
<%@ page import="com.mysql.cj.Session" %>
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

 <div class="container-fluid div-color">
    <div class="row">
      <div class="col-md-4 offset-md-4">
        <div class="card mt-5 mb-5">
            <div class="card-header text-center bg-custom">
                <i class="fa fa-user-plus" aria-hidden="true"></i>
                <h3>Login In Here</h3>

                <%
                    Message message = (Message) session.getAttribute("failed-msg");
                    if (message != null) {
                %>
                <div class="alert container-fluid <%= message.getCssClass() %>" role="alert">
                    <%= message.getContent() %>
                </div>


                <%
                        session.removeAttribute("failed-msg");
                    }
                %>
                <%
                    Message success = (Message) session.getAttribute("success");
                    if (success != null) {
                %>
                <div class="alert container-fluid <%= success.getCssClass() %>" role="alert">
                    <%= success.getContent() %>
                </div>


                <%
                        session.removeAttribute("success");
                    }
                %>
                <%
                    String notLog = (String) session.getAttribute("notLogin");
                    if (notLog != null) {
                %>

                <div class="alert alert-danger" role="alert"><%= notLog %>
                </div>

                <%
                        session.removeAttribute("notLogin");
                    }
                %>
            </div>
        
            <div class="card-body">
                <form action="login" method="post">
                  
                    <div class="form-group">
                      <label for="exampleInputEmail1">Email address</label>
                      <input name="user-email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Password</label>
                      <input name="user-password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                    </div>
                   
                    <button type="submit" class="btn btn-primary badge-pill btn-block">Sing In</button>
                  </form>
            </div>
        </div>
      </div>
    </div>
 </div>
<jsp:include page="component/pages/Footer.jsp"/>
</body>
</html>