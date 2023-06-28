<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.enotes.*" %>
<html>
<head>
<title>Homepage</title>
<link rel="stylesheet" type="text/css" href="component/css/style.css" />

<%@include file="component/all_link.jsp" %>


</head>
<body>

 <jsp:include page="component/pages/Navbar.jsp"/>
 <%--<%=
Connection connection = ConnectionProvider.getConnection();
 System.out.print(connection);
 %>--%>

<div class="container-fluid bg-image">
	<div class="container text-center ">
	<h1 class="text-white"><i class="fa fa-server"></i> E Note Save Your Notes</h1>
	<a href="Register.jsp" class="btn btn-light"><i class="fa fa-user-plus"></i> Register</a>
	<a href="Login.jsp" class="btn btn-light"><i class="fa fa-share"></i> Login</a>
	</div>
</div>
<jsp:include page="component/pages/Footer.jsp"/>
</body>
</html>