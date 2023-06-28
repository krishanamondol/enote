<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page errorPage="error_page.jsp" %>
<%@page isErrorPage="false" %>

<html>
<head>
    <title>Homepage</title>
    <link rel="stylesheet" type="text/css" href="component/css/style.css" />
    <%@include file="component/all_link.jsp" %>
</head>

<body>

  <h1>This is error page</h1>
  <p>Thsli is paragraph is very easy to handle in java code intellij ultiimate</p>

<jsp:include page="component/pages/Footer.jsp"/>




</body>
</html>