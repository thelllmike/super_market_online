<%@page import="java.text.DecimalFormat"%>
<%@page import="cn.techtutorial.dao.OrderDao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
User auth = (User) request.getSession().getAttribute("auth");
List<Order> orders = null;
double total = 0;
if (auth != null) {
    OrderDao orderDao  = new OrderDao(DbCon.getConnection());
    orders = orderDao.userOrders(auth.getId());
} else {
    response.sendRedirect("login.jsp");
    return;
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
    request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>Supermarket</title>
<style>
    .star-rating {
        display: inline-block;
        font-size: 1.25rem;
        color: #ffd700; /* Set star color to yellow */
    }

    .empty-star {
        color: #ccc; /* Set empty star color to gray */
    }
</style>
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>
    <div class="container">
        <div class="card-header my-3">All Orders</div>
        <table class="table table-light">
            <thead>
                <tr>
                    <th scope="col">Date</th>
                    <th scope="col">Name</th>
                    <th scope="col">Category</th>
                    <th scope="col">Price</th>
                    <th scope="col">Review</th>
                </tr>
            </thead>
            <tbody>
            <%
            if(orders != null){
                for(Order o:orders){%>
                    <tr>
                        <td><%=o.getDate() %></td>
                        <td><%=o.getName() %></td>
                        <td><%=o.getCategory() %></td>
                        <td><%=dcf.format(o.getPrice()) %></td>
                        <td>
    <div class="star-rating">
        <%-- Display star ratings based on the rating value --%>
        <% int rating = (int) o.getRating(); %>
        <% for (int i = 1; i <= 5; i++) { %>
            <%-- Use a pencil icon to indicate starting a review --%>
            <a href="start-review?order_id=<%=o.getOrderId()%>&rating=<%= i %>">
                <%-- Display a star icon if the review has been started --%>
                <% if (i <= rating) { %>
                    <span>&#9733;</span> <!-- Full star -->
                <% } else { %>
                    <span class="empty-star">&#9734;</span> <!-- Empty star -->
                <% } %>
            </a>
        <% } %>
    </div>
</td>

                    </tr>
                <%
                }
            }
            %>
            </tbody>
        </table>
    </div>
<%@include file="/includes/footer.jsp"%>
</body>
</html>
