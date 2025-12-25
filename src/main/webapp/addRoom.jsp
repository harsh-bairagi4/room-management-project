<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.Admin" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Add Room</title>

   <%@include file="__bootstrap.jsp" %>

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


</head>

<body class="bg-light">


   <%@include file="__adminnav.jsp" %>

<div class="container mt-5">

    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-lg border-0">
                <div class="card-header bg-primary text-white text-center">
                    <h4 class="fw-bold">Add New Room</h4>
                </div>

                <div class="card-body">

                    <form action="controller/saveRoom.jsp" method="post">

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Room Type</label>
                            <select class="form-select" name="roomType" required>
                                <option value="">Select Type</option>
                                <option value="1BHK">1BHK</option>
                                <option value="2BHK">2BHK</option>
                                <option value="1RK">1RK</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Location</label>
                            <input type="text" class="form-control" name="location" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Price (₹)</label>
                           <input type="number" class="form-control no-spinner" name="price" min="100" required>
                        </div>


                        <div class="mb-3">
                            <label class="form-label fw-semibold">WiFi Available</label>
                            <select class="form-select" name="wifi" required>
                                <option value="">Select</option>
                                <option value=1>Yes</option>
                                <option value=0>No</option>
                            </select>
                        </div>


                        <div class="mb-3">
                            <label class="form-label fw-semibold">RO Facility</label>
                            <select class="form-select" name="roWater" required>
                                <option value="">Select</option>
                                <option value=1>Yes</option>
                                <option value=0>No</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Phone Number</label>
                            <input type="text" maxlength="10" minlength="10" class="form-control"
                                   name="phone" required>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-success fw-bold">Add Room</button>
                        </div>

                    </form>

                </div>
            </div>

        </div>
    </div>

</div>

</body>
</html>
