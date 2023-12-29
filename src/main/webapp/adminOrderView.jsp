<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="cn.techtutorial.connection.DbCon" %>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@ page import="java.util.*" %>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="/includes/head.jsp"%>
<title>Supermarket</title>
</head>
<body>
    <%@ include file="/includes/adminNav.jsp"%>
    <br>
    <div class="hole">
        <br><br>
        <div class="middle">
            <br><br>
            <hr>
            <h2 class="text-center">Order Details</h2>
            <hr>
            <div class="container">
                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>order id</th>
                            <th>product id</th>
                            <th>user id</th>
                            <th>Order quantity</th>
                            <th>Order date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver"); // Use the new driver class
                            String userName = "root";
                            String password = "root";
                            String url = "jdbc:mysql://localhost:3306/ecommerce_cart";
                            Connection con = DriverManager.getConnection(url, userName, password);
                            Statement stat = con.createStatement();
                            String sql = "select * from ecommerce_cart.orders";
                            ResultSet rs = stat.executeQuery(sql);

                            int columnCount = rs.getMetaData().getColumnCount();
                            

                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getInt(1) %></td>
                            <td><%= rs.getString(2) %></td>
                            <td><%= rs.getString(3) %></td>
                            <td><%= rs.getString(4) %></td> <!-- Assuming the price is a double or numeric type -->
                            <td><%= rs.getString(5) %></td>
                            <td>
                                <button class="btn btn-primary">Update</button>
                                <button class="btn btn-info">Delete</button>
                            </td>
                        </tr>
                        <%
                            }
                        } catch (Exception e) {
                            out.println("Exception: " + e.getMessage());
                            e.printStackTrace();
                        }
                        %>
                    </tbody>
                </table>
                <br>
            </div>
        </div>
    </div>
    <%@include file="/includes/footer.jsp"%>
</body>
</html>
