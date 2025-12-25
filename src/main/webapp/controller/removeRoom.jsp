<%@page import="dao.AdminDAO"%>
<%@page import="entity.Admin"%>

 <%@include file="../__bootstrap.jsp" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("../index.jsp");
        return;
    }

    String roomId = request.getParameter("roomId");

    if (roomId == null) {
    %>
     <script>
       window.alert("Invalid Room Id");
     </script>
    <%
        return;
    }

    int id = Integer.parseInt(roomId);

    boolean deleted = AdminDAO.removeRoom(id, admin.getId());

    if (deleted) {
    %>
       <script>
              window.alert("Room deleted successfully");
              <%
              response.sendRedirect("../adminRooms.jsp");
              %>
       </script>
    <%
    } else {
    %>
        <script>
               window.alert("Room not deleted");
        <script>
    <%
    }
%>
