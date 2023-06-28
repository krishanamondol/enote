    <%@ page import="com.enotes.entities.User" %>
    <% User user = (User) session.getAttribute("userD"); %>
    <%
        if (user == null) {
            response.sendRedirect("Login.jsp");
        }
    %>
    <nav class="navbar= navbar-expand-lg navbar-dark bg-primary navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">E Notes</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp"><i class="fa fa-home"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fa fa-plus"></i> Add Notes</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link " href="#" ><i class="fa fa-sticky-note"></i> Show Notes</a>
                    </li>
                </ul>


                <a href=""  class="btn btn-outline-success my-2 my-sm-0 mr-3" data-bs-toggle="modal" data-bs-target="#exampleModal" ><span class="fa fa-user-circle "></span> <%= user.getName()%> </a>
                <a href="LogOutServlet" class="btn btn-outline-success my-2 my-sm-0 " >Log Out</a>

            </div>
        </div>
    </nav>



    <!-- Full screen modal -->
    <div class="modal-dialog modal-fullscreen">
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">User Information</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row"><%=user.getId()%></th>
                                <th scope="row"><%=user.getName()%></th>
                                <th scope="row"><%=user.getEmail()%></th>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
