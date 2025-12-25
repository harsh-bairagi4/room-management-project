<%@ page import="dao.RoomDAO, entity.Room" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String idStr = request.getParameter("roomId");
    if (idStr == null) {
        response.sendRedirect("../adminDashboard.jsp");
        return;
    }

    int roomId = Integer.parseInt(idStr);
    Room room = RoomDAO.getRoomById(roomId);

    if (room == null) {
        response.sendRedirect("../adminDashboard.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Room</title>
    <%@ include file="../__bootstrap.jsp" %>
</head>
<style>

    input[type=number]::-webkit-inner-spin-button,
    input[type=number]::-webkit-outer-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }
    input[type=number] {
        -moz-appearance: textfield; /* Firefox */
    }
</style>
<body>

<%@ include file="../__adminnav.jsp" %>

<div class="container mt-5">
    <h2 class="text-center mb-4">Update Room Details</h2>

    <form action="controller/updateRoomAction.jsp" method="post" class="border p-4 rounded shadow">

        <input type="hidden" name="roomId" value="<%= room.getId() %>">

       <div class="mb-3">
           <label class="form-label">Room Type</label>
           <select class="form-select" name="roomType" required>
               <option value="">Select Type</option>
               <option value="1BHK" <%= "1BHK".equals(room.getRoomType()) ? "selected" : "" %>>1BHK</option>
               <option value="2BHK" <%= "2BHK".equals(room.getRoomType()) ? "selected" : "" %>>2BHK</option>
               <option value="1RK"  <%= "1RK".equals(room.getRoomType()) ? "selected" : "" %>>1RK</option>
               <option value="Other" <%= "Other".equals(room.getRoomType()) ? "selected" : "" %>>Other</option>
           </select>
       </div>


        <div class="mb-3">
            <label class="form-label">Location</label>
            <input type="text" name="location" class="form-control" value="<%= room.getLocation() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Price</label>
            <input type="number" name="price" class="form-control" value="<%= room.getPrice() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Phone</label>
            <input type="text" name="phone" class="form-control" value="<%= room.getPhone() %>" required>
        </div>

        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" name="wifi" <%= room.isWifi() ? "checked" : "" %> >
            <label class="form-check-label">WiFi Available</label>
        </div>

        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" name="roWater" <%= room.isRoWater() ? "checked" : "" %> >
            <label class="form-check-label">RO Water</label>
        </div>

        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" name="isAvailable" <%= room.isAvailable() ? "checked" : "" %> >
            <label class="form-check-label">Room Available</label>
        </div>

        <button type="submit" class="btn btn-primary w-100">Update Room</button>

    </form>
</div>

</body>
</html>
