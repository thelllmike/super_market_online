<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <!-- Assuming you have a 'head.jsp' file that includes Bootstrap CSS and potentially other styles -->
    <%@include file="/includes/head.jsp"%>
    <title>GREEN Supermarket</title>
    <style>
        /* Festive Navbar Styles */
        .navbar {
            background-color: #117a37; /* A Christmas green background */
            border-bottom: 4px solid #d22c22; /* A Christmas red border */
        }
        .navbar .nav-link {
            color: white; /* White text for legible contrast */
        }
        .navbar .nav-link:hover {
            background-color: #d22c22; /* Red background on hover for a festive feel */
        }
        .badge-danger {
            background-color: #d22c22; /* Matching the red theme */
        }
        /* If you use FontAwesome for icons */
        .fa-user {
            margin-right: 5px; /* Spacing between icon and text */
        }
        /* Other custom styles... */
    </style>
</head>
<body>

<!-- The rest of your navbar code -->
<nav class="navbar navbar-expand-lg navbar-light">
    <!-- ... -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <!-- ... -->
            <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart <span class="badge badge-danger">${cart_list.size()}</span> </a></li>
            <%
            if (auth != null) {
            %>
            <li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
            <!-- Profile Icon -->
            <li class="nav-item">
                <a class="nav-link" href="profile.jsp"><i class="fa fa-user" aria-hidden="true"></i> Profile</a>
            </li>
            <li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
            <%
            } else {
            %>
            <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
            <%
            }
            %>
        </ul>
    </div>
    <!-- ... -->
</nav>

<!-- Your page content here -->

</body>
</html>
