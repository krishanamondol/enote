<%@ page import="com.enotes.entities.Message" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<html>
<head>
    <title>Homepage</title>
    <link rel="stylesheet" type="text/css" href="component/css/style.css"/>

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
                    <h3>Registration</h3>
                </div>
                <%
                    String regMsg = (String) session.getAttribute("reg-success");
                    if (regMsg != null) {%>
                <div class="alert alert-success" role="alert"><%= regMsg %>
                </div>
                <%
                    }
                    session.removeAttribute("reg-success");
                %>
                <%
                String failedMsg = (String) session.getAttribute("failed-msg");
                if (failedMsg != null) {%>
                <div class="alert alert-danger" role="alert"><%= failedMsg %>
                </div>
                <%
                    }
                    session.removeAttribute("failed-msg");
                %>


                <div class="card-body">
                    <form action="register" method="post">
                        <div class="form-group">
                            <%--@declare id="exampleinputname"--%><label for="exampleInputName"> Name</label>
                            <input name="user-name" type="text" class="form-control" placeholder="Enter name">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input name="user-email" type="email" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input name="user-password" type="password" class="form-control" id="exampleInputPassword1"
                                   placeholder="Password">
                        </div>
                        <div class="form-check">
                            <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">terms and condation</label>
                        </div>
                        <button type="submit" class="btn btn-primary badge-pill btn-block ">Sing Up</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="component/pages/Footer.jsp"/>
</body>
</html>
<%--            <%--%>
<%--                Message message = (Message)  session.getAttribute("reg-success");--%>
<%--//            String regMsg = (String) session.getAttribute("reg-success");--%>
<%--            if( message!= null){--%>
<%--            %>--%>
<%--            <div class="alert <%=message.getCssClass()%>" role="alert"><%= message.getContent()%>--%>
<%--            </div>--%>
<%--            <%--%>
<%--            session.removeAttribute("reg-success");--%>
<%--              }--%>
<%--            %>--%>

<%--<%--%>
<%--                Message message2 = (Message)  session.getAttribute("failed-msg");--%>
<%--//            String regMsg = (String) session.getAttribute("reg-success");--%>
<%--            if( message!= null){--%>
<%--            %>--%>
<%--            <div class="alert <%=message2.getCssClass()%>" role="alert"><%= message2.getContent()%>--%>
<%--            </div>--%>
<%--            <%--%>
<%--            session.removeAttribute("failed-msg");--%>
<%--              }--%>
<%--            %>--%>

<%--            <%--%>
<%--            String FailedMsg = (String) session.getAttribute("failed-msg");--%>
<%--            if(FailedMsg != null){--
<%--              %>--%>
<%--              <div class="alert alert-danger" role="alert"><%= FailedMsg %></div>--%>
<%--            --%>
<%--             session.removeAttribute("failed-msg");--%>
<%--                }--%>
<%--            %>--%>