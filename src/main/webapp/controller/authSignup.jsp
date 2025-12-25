<%@ page import="dao.UserDAO, dao.AdminDAO, entity.User, entity.Admin" %>
<%
    String role = request.getParameter("role");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    boolean success = false;

    Admin admin = null;
    User user = null;

    if ("admin".equals(role)) {
        admin = new Admin(name, email, password);
        success = AdminDAO.register(admin);
    } else {
        user = new User(name, email, password);
        success = UserDAO.register(user);
    }

    if (success) {
        if ("admin".equals(role)) {
            session.setAttribute("admin", admin);
            response.sendRedirect("../adminDashboard.jsp");
        } else {
            session.setAttribute("user", user);
            response.sendRedirect("../viewRooms.jsp");
        }
    } else {
        response.sendRedirect("../index.jsp");
    }
%>
