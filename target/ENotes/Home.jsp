<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--<%@page errorPage="error_page.jsp" %>--%>
<%@ page import="com.enotes.entities.User" %>
<% User user = (User) session.getAttribute("userD"); %>

<html>
<head>
<title>Homepage</title>
<link rel="stylesheet" type="text/css" href="component/css/style.css" />
<%@include file="component/all_link.jsp" %>
</head>

<body>

	<jsp:include page="component/pages/Navbar.jsp"/>

	<div class="container-fluid p-0">
		<div class="card mt-5">
			<div class="card-body text-center">
				<img src="component/images/writing.png" alt="" class="img-fluid mx-auto" style="width: 300px;">
				<h1>Start Taking Your Notes</h1>
				<a href="AddNote.jsp" class="btn btn-outline-primary badge-pill btn-block "> Start</a>
			</div>
		</div>
	  </div>


<jsp:include page="component/pages/Footer.jsp"/>


 

</body>
</html>