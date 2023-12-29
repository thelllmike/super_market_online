<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
<%@include file="/includes/head.jsp"%>
<title>GREEN Supermarket</title>
<style>
    /* Add your color theme changes here */
    body {
        background-color: #f4f4f4; /* Example background color */
        /* Other styles for color theme */
    }

    /* Style for the product images at the bottom of the page */
    .product-images {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        margin-top: 30px;
    }

    .product-image {
        width: 100px; /* Set the width as needed */
        height: auto;
        margin: 10px;
    }

    .custom-image {
        width: 100%; /* Full width */
        height: auto;
        display: block;
        margin-bottom: 20px; /* Adds space between the image and products */
    }
    
    /* Other styles... */
    
     /* Add your styles here */
        .features-section {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
        }

        .feature-item {
            flex-basis: 24%;
            text-align: center;
        }

        .feature-item h4 {
            color: #D22C22; /* Example festive color */
        }

        .feature-item p {
            font-size: 0.9em;
            color: #555;
        }

        .category-section {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            padding: 20px 0;
        }

        .category-item {
            margin: 10px;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            overflow: hidden;
            position: relative;
        }

        .category-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .category-item p {
            position: absolute;
            bottom: 0;
            width: 100%;
            background: rgba(0, 0, 0, 0.5);
            color: #fff;
            padding: 10px 0;
            text-align: center;
            margin: 0;
        }
</style>
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>

    <!-- Insert your custom image -->
    <img src="images/a.jpg" alt="Description of image" class="custom-image">

  <!-- Features Section -->
    <div class="features-section">
        <div class="feature-item">
            <img src="images/icon1.jpg" alt="Best Prices & Offers">
            <h4>Best Prices & Offers</h4>
            <p>Cheaper prices than your local supermarket.</p>
        </div>
        <div class="feature-item">
            <img src="images/icon2.jpg" alt="Get groceries delivered">
            <h4>Get groceries delivered</h4>
            <p>We will deliver your groceries direct to your door.</p>
        </div>
        <div class="feature-item">
            <img src="images/icon3.jpg" alt="More payment options">
            <h4>More payment options</h4>
            <p>Now you can Pay Online, by Cash on Delivery or Card on Delivery</p>
        </div>
        <div class="feature-item">
            <img src="images/icon4.jpg" alt="Wide assortment">
            <h4>Wide Assortment</h4>
            <p>Choose from 5000+ products across food, personal care, household & other categories.</p>
        </div>
    </div>

    <!-- Categories Section -->
    <div class="category-section">
        <div class="category-item">
            <img src="images/vegetables.jpg" alt="Fresh Vegetables">
            <p>Fresh Vegetables</p>
        </div>
        <div class="category-item">
            <img src="images/fruits.jpg" alt="Fresh Fruits">
            <p>Fresh Fruits</p>
        </div>
        <div class="category-item">
            <img src="images/groceries.jpg" alt="Groceries">
            <p>Groceries</p>
        </div>
        <div class="category-item">
            <img src="images/baby-care.jpg" alt="Baby Care">
            <p>Baby Care</p>
        </div>
        <div class="category-item">
            <img src="images/beverages.jpg" alt="Beverages">
            <p>Beverages</p>
        </div>
        <div class="category-item">
            <img src="images/household.jpg" alt="Household Items">
            <p>Household Items</p>
        </div>
    </div>



    <div class="container">
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
                        <!-- Star rating and buttons omitted for brevity -->
                    </div>
                </div>
            </div>
            <%
                }
            } else {
                out.println("There are no products");
            }
            %>
        </div>
    </div>

    <!-- Container for product images at the bottom -->
    <div class="product-images">
        <!-- Repeat for each product image -->
        <img src="path-to-product-image.jpg" alt="Product description" class="product-image">
        <!-- More product images -->
    </div>

    <%@include file="/includes/footer.jsp"%>
</body>
</html>
