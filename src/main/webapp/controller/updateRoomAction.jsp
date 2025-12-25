<%@ page import="dao.AdminDAO, dao.RoomDAO, entity.Room" %>
<%@page contentType="text/html;charset=UTF-8" language="java"%>

<%
    int roomId = Integer.parseInt(request.getParameter("roomId"));

    Room room = RoomDAO.getRoomById(roomId);

    if (room == null) {
        response.sendRedirect("adminDashboard.jsp");
        return;
    }

    room.setRoomType(request.getParameter("roomType"));
    room.setLocation(request.getParameter("location"));
    room.setPrice(Integer.parseInt(request.getParameter("price")));
    room.setPhone(request.getParameter("phone"));
    room.setWifi(request.getParameter("wifi") != null);
    room.setRoWater(request.getParameter("roWater") != null);
    room.setAvailable(request.getParameter("isAvailable") != null);

    boolean updated = AdminDAO.updateRoom(room);

    if (updated) {
        response.sendRedirect("../adminRooms.jsp");
    } else {
        response.sendRedirect("../error.jsp");
    }
%>
