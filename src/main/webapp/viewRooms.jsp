<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Room" %>
<%@ page import="dao.RoomDAO" %>


<%
    List<Room> rooms = RoomDAO.getRooms();
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Available Rooms</title>

    <%@include file="__bootstrap.jsp" %>
</head>

<body class="bg-light">

<%@include file="__usernav.jsp" %>


<div class="container mt-4 text-center">
    <h2 class="fw-bold mb-4">🏠 Available Rooms</h2>
</div>


<div class="container">
    <div class="row">

        <%
            if (rooms != null && rooms.size() > 0) {
                for (Room r : rooms) {
        %>

        <div class="col-md-4 mb-4">

            <div class="card shadow-lg border-0">

                <div class="card-header bg-primary text-white">
                    <h5 class="fw-bold"><%= r.getRoomType() %> - ₹<%= r.getPrice() %></h5>
                </div>

                <div class="card-body">

                    <p><strong>Location:</strong> <%= r.getLocation() %></p>
                    <p><strong>Wifi:</strong> <%= r.isWifi() ? "Available" : "Not available" %></p>
                    <p><strong>RO Facility:</strong> <%= r.isRoWater() ? "Available" : "Not available"  %></p>
                    <p><strong>Phone:</strong> <%= r.getPhone() %></p>
                    <p><strong>Available:</strong> <%= r.isAvailable() ? "Yes" : "No" %></p>

                       <a href= <%= r.isAvailable() ? "https://razorpay.com/?utm_source=google&utm_medium=PMax&utm_campaign=RPSME-RPPerf-Google-Pmax-Prospect-AllDevices-WebsiteConversion-231223-L1FormResult-India&utm_adgroup=&utm_content=&utm_term=&utm_gclid=&utm_campaignID=&utm_adgroupID=&utm_adID=&utm_network=&utm_device=&gad_source=1&gad_campaignid=20894111494&gbraid=0AAAAADdXWPoNDNUjU7YqcYAu9ZvkxFc8K&gclid=Cj0KCQiA6NTJBhDEARIsAB7QHD1NrqRd_FFOZomlMBsBEGDFOSXExxAOXOMubGqjS0NbBIpS3JxK48oaArSDEALw_wcB" : "#" %> <%= r.isAvailable() ? "" : "style='pointer-events:none; opacity:0.5;'" %>> <button class="btn btn-success w-100 fw-bold">
                            Book Now
                        </button></a>


                </div>
            </div>

        </div>

        <%
                }
            } else {
        %>

        <div class="col-12 text-center">
            <div class="alert alert-info">No rooms available at the moment.</div>
        </div>

        <%
            }
        %>

    </div>
</div>

</body>
</html>
