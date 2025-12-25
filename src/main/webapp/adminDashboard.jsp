<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Dashboard</title>
    <%@include file="__bootstrap.jsp" %>
</head>

<body class="bg-light">

    <%@include file="__adminnav.jsp" %>

    <div class="container mt-5">

        <div class="row g-4 justify-content-center">

            <div class="col-md-4">
                <div class="card h-100 shadow-sm border-0 rounded-3">
                    <div class="card-body text-center p-4">
                        <h5 class="card-title fw-bold mb-2">Add Room</h5>
                        <p class="text-muted mb-3">Add a new room to the system</p>
                        <a href="addRoom.jsp" class="btn btn-success px-4">Add</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 shadow-sm border-0 rounded-3">
                    <div class="card-body text-center p-4">
                        <h5 class="card-title fw-bold mb-2">Manage Rooms</h5>
                        <p class="text-muted mb-3">View or edit existing rooms</p>
                        <a href="adminRooms.jsp" class="btn btn-primary px-4">Manage</a>
                    </div>
                </div>
            </div>

        </div>

    </div>

</body>
</html>
