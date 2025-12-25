<%@ page import="dao.UserDAO, dao.AdminDAO, entity.User, entity.Admin" %>
<%
    String role = request.getParameter("role");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if ("admin".equals(role)) {
        Admin admin = new Admin();
        admin.setEmail(email);
        admin.setPassword(password);
        admin = AdminDAO.authenticate(admin, password);

        if (admin != null) {
            session.setAttribute("admin", admin);
            response.sendRedirect("../adminDashboard.jsp");
            return;
        }
        response.sendRedirect("../error.jsp");
    } else {
        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        user = UserDAO.authenticate(user, password);

        if (user != null) {
            session.setAttribute("user", user);
            response.sendRedirect("../viewRooms.jsp");
            return;
        }
        response.sendRedirect("../error.jsp");
    }
%>
