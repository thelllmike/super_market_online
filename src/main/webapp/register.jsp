<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
    request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Supermarket</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <body>
    <%@include file="/includes/navbar.jsp"%>
       <div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Register</div>
			<div class="card-body">
				<form action="adduser" method="post">
				<div class="form-group">
						<label class="mt-2">Name</label> 
						<input type="text" name="name" class="form-control mt-2" placeholder="Enter name">
					</div>
					<div class="form-group">
						<label class="mt-2">Email address</label> 
						<input type="email" name="email" class="form-control mt-2" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label class="mt-2">Password</label> 
						<input type="password" name="password" class="form-control mt-2" placeholder="Password">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary mt-5">Register</button>
					</div>
				</form>
			</div>
		</div>
	</div>     
    <!-- Include Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <%@include file="/includes/footer.jsp"%>
</body>
</body>
</html>
