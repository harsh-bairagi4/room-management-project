<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Room Management System</title>
   <%@include file="__bootstrap.jsp" %>

    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="overlay">

    <div class="container text-center">
        <h1 class="fw-bold mb-4">🏠 Roomify</h1>

        <div class="row justify-content-center">

            <div class="col-md-4">
                <div class="card shadow p-3">
                    <img src="img/user.png" class="icon-img mx-auto" alt="Room Icon">
                    <h4 class="mb-3">User</h4>

                    <a href="login.jsp?role=user" class="btn btn-primary w-100">Login </a>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card shadow p-3">
                    <img src="img/admin.png" class="icon-img mx-auto" alt="Admin Icon">
                    <h4 class="mb-3">Admin</h4>

                    <a href="login.jsp?role=admin" class="btn btn-success w-100">Login </a>
                </div>
            </div>

        </div>
    </div>

</div>

</body>
</html>
