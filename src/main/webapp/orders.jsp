<%@page import="java.text.DecimalFormat"%>
<%@page import="cn.techtutorial.dao.OrderDao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
List<Order> orders = null;
double total = 0;
if (auth != null) {
    request.setAttribute("person", auth);
    OrderDao orderDao  = new OrderDao(DbCon.getConnection());
    orders = orderDao.userOrders(auth.getId());
    for (Order order : orders) {
        total += order.getPrice() * order.getQunatity();
    }
}else{
    response.sendRedirect("login.jsp");
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
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Cancel</th>
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
                        <td><%=o.getQunatity() %></td>
                        <td><%=dcf.format(o.getPrice()) %></td>
                        <td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
                    </tr>
                <%
                }
            }
            %>
            
            </tbody>
        </table>
        <div class="total">
            <h3>Total: <%=dcf.format(total)%></h3>
        </div>
        <div id="paypal-button-container"></div>
    </div>
    <div style="text-align:center;"> 
    <script src="https://www.paypal.com/sdk/js?client-id=ARHyzLpb2n8qfDeM_EJCwWWDHdZR7Txy-zxv6rel3tXnaS5zSqVNZWNVi7xBKzoszwcrzWxfl39ETUmh"></script>
    <script>
        paypal.Buttons({
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '<%=dcf.format(total)%>'
                        }
                    }]
                });
            },
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                    alert('Transaction completed by ' + details.payer.name.given_name + '!');
                    // Redirect to a success page
                });
            }
        }).render('#paypal-button-container');
    </script>
     </div>
     <%--   https://www.youtube.com/watch?v=7nk6jr4eF4U--%>
   
    <br><br><br><br><br>
    <%@include file="/includes/footer.jsp"%>
</body>
</html>
