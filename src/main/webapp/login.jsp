<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String role = request.getParameter("role");
%>

<!DOCTYPE html>
<html>
<head>
    <title><%= role.substring(0,1).toUpperCase() + role.substring(1) %> Login</title>

    <%@include file="__bootstrap.jsp" %>
    <link rel="stylesheet" href="style.css">
</head>

<body>
<div class="overlay">
    <div class="container mt-5">

        <div class="col-md-4 mx-auto">
            <div class="card shadow p-4">

                <h3 class="text-center mb-4">
                    <%= role.equals("admin") ? "Admin Login" : "User Login" %>
                </h3>

                <form action="controller/authLogin.jsp" method="post">
                    <input type="hidden" name="role" value="<%= role %>">

                    <div class="mb-3">
                        <label>Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>

                    <button class="btn btn-primary w-100 mb-2">Login</button>

                    <p class="text-center">
                        Not registered?
                        <a href="signup.jsp?role=<%= role %>">Create Account</a>
                    </p>

                </form>

            </div>
        </div>

    </div>
</div>
</body>
</html>
