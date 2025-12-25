<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.Admin, dao.UserDAO, entity.Room, java.util.List" %>

<%
    Admin admin = (Admin) session.getAttribute("admin");

    if (admin == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    List<Room> rooms = UserDAO.getRoomsByAdmin(admin.getId());
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Rooms</title>
    <%@include file="__bootstrap.jsp" %>
</head>

<body>

<%@include file="__adminnav.jsp" %>

<div class="container mt-5">

    <h3 class="text-center mb-4">Your Listed Rooms</h3>

    <table class="table table-bordered table-striped">
        <thead class="table-primary">
            <tr>
                <th>ID</th>
                <th>Room Type</th>
                <th>Location</th>
                <th>Price</th>
                <th>Phone</th>
                <th>WiFi</th>
                <th>RO Water</th>
                <th>Available</th>
                <th class="text-center">Edit Room</th>
            </tr>
        </thead>

        <tbody>
        <%
            if (rooms != null && rooms.size() > 0) {
                for (Room r : rooms) {
        %>
            <tr>
                <td><%= r.getId() %></td>
                <td><%= r.getRoomType() %></td>
                <td><%= r.getLocation() %></td>
                <td>₹<%= r.getPrice() %></td>
                <td><%= r.getPhone() %></td>
                <td><%= r.isWifi() ? "Yes" : "No" %></td>
                <td><%= r.isRoWater() ? "Yes" : "No" %></td>
                <td><%= r.isAvailable() ? "Yes" : "No" %></td>
               <td class="text-center">
                   <div class="d-flex justify-content-center gap-4">

                       <form action="controller/removeRoom.jsp" method="post" class="d-inline">
                           <input type="hidden" name="roomId" value="<%= r.getId() %>">
                           <button class="btn btn-danger btn-sm"
                                   onclick="return confirm('Are you sure you want to delete this room?');">
                               Delete
                           </button>
                       </form>

                       <form action="updateRoom.jsp" method="post" class="d-inline">
                           <input type="hidden" name="roomId" value="<%= r.getId() %>">
                           <button class="btn btn-warning btn-sm">
                               Update
                           </button>
                       </form>

                   </div>
               </td>

            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="8" class="text-center text-danger fw-bold">
                    No rooms added yet!
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

</div>

</body>
</html>
