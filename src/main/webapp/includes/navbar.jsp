<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    List<String> categoryList = new ArrayList<>();
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String userName = "root";
        String password = "1234";
        String url = "jdbc:mysql://localhost:3306/ecommerce_cart";
        con = DriverManager.getConnection(url, userName, password);
        String sql = "SELECT DISTINCT category FROM products";
        pst = con.prepareStatement(sql);
        rs = pst.executeQuery();

        while (rs.next()) {
            categoryList.add(rs.getString("category"));
        }
    } catch (ClassNotFoundException | SQLException e) {
        // Handle exceptions appropriately
        e.printStackTrace();
    } finally {
        // Ensure resources are released in finally block
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pst != null) try { pst.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<!-- The rest of your navbar code -->
<nav class="navbar navbar-expand-lg navbar-light bg-light py-3">
    <!-- ... -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <!-- ... -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart <span class="badge badge-danger">${cart_list.size()}</span> </a></li>
				<%
				if (auth != null) {
				%>
				<li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
				<li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
				
				<%
				}
				%>
			</ul>
		
            <!-- Category Dropdown Start -->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <% for(String category : categoryList) { %>
                        <a class="dropdown-item" href="products.jsp?category=<%=category %>"><%=category %></a>
                    <% } %>
                </div>
            </li>
            <!-- Category Dropdown End -->
            
            <!-- ... -->
        </ul>
        </div>
    </div>
    <!-- ... -->
</nav>
