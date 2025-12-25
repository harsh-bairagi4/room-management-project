<%@ page import="dao.AdminDAO, dao.RoomDAO, entity.Admin, entity.Room" %>

<%
if (!request.getMethod().equalsIgnoreCase("POST")) {
    out.print("Cannot handle GET");
    return;
}

Admin admin = (Admin)session.getAttribute("admin");

if (admin == null) {
    response.sendRedirect("../index.jsp");
    return;
}

String roomType = request.getParameter("roomType");
String location = request.getParameter("location");
int price = Integer.parseInt(request.getParameter("price"));
String phone = request.getParameter("phone");
boolean wifi = "1".equals(request.getParameter("wifi"));
boolean roWater = "1".equals(request.getParameter("roWater"));

Room room = new Room(roomType, location, price, phone, wifi, roWater, admin);

if (RoomDAO.save(room)) {
%>
<script>
    alert("Room added successfully!");
    window.location.href = "../adminRooms.jsp";
</script>
<%
} else {
    out.print("Something went wrong...");
}
%>
