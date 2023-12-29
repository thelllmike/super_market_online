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
    <title>E-Commerce Cart</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	private int id;
	private String name;
	private String category;
	private Double price;
	private String image;
	

<%
String id = null;
String name = null;
String category = null;
String price = null;
String image = null;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	String userName = "root";
	String password = "1234";
	String url = "jdbc:mysql://localhost:3306/ecommerce_cart";
	Connection con = DriverManager.getConnection(url,userName,password);
    Statement stat = con.createStatement();  
	String query = request.getParameter("id");
	String sql;
	if(query!=null)
	{
		
		sql = "select * from ecommerce_cart.products where id ="+request.getParameter("id");
		System.out.println("Pass");
		
	}
	else
	{
		sql = "select * from ecommerce_cart.products";
		
	}
	ResultSet rs = stat.executeQuery(sql);
	

   id = request.getParameter("id");

	
	while(rs.next())
	{
		
		name = rs.getString(2);
		category = rs.getString(3);
		price = rs.getString(4);
		image = rs.getString(5);
	
	
	
	}
	
}
catch(Exception e)
{
	out.println("Exception :"+e.getMessage());
	e.printStackTrace();
}

%>




  <body>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="home.jsp">Home</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
       
        </nav>
        <div class="hole">
            <br><br>
            <div class="middle">
                <br><br>
                <h2>Update Product Details</h2>
                <hr>
                <br>
                <form method="post" action="addproduct" >
                    <div class="mb-3">
                    
                         <input type = "text" name = "id" value = "<%= id %>" required hidden>
                    
                        <label for="name" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="name" name="name" value = "<%= name %>" required>
                    </div>

                    <div class="mb-3">
                        <label for="category" class="form-label">Category</label>
                        <input type="text" class="form-control" id="category" name="category" value = "<%= category %>" required>
                    </div>

                    <div class="mb-3">
                        <label for="price" class="form-label">Price</label>
                        <input type="number" class="form-control" id="price" name="price" step="0.01" value = "<%= price %>" required>
                    </div>

                    <div class="mb-3">
                        <label for="image" class="form-label">Image</label>
                        <input type="file" class="form-control" id="image" name="image" value = "<%= image %>" accept="image/*" >
                    </div>

                    <button type="submit" class="btn btn-primary" name="submit">Update Product</button>
                </form>
            </div>

            <div class="card-header my-3">All Products</div>
            <div class="row">
                <%
                if (!products.isEmpty()) {
                    for (Product p : products) {
                %>
                <div class="col-md-3 my-3">
                    <div class="card w-100">
                        <img class="card-img-top" src="product-image/<%=p.getImage() %>"
                             alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"><%=p.getName() %></h5>
                            <h6 class="price">Price: $<%=p.getPrice() %></h6>
                            <h6 class="category">Category: <%=p.getCategory() %></h6>
                            <div class="mt-3 d-flex justify-content-between">
                                <a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a>
                                <a class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                } else {
                    out.println("There is no products");
                }
                %>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</body>
</html>
