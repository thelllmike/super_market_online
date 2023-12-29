package cn.techtutorial.dao;



import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateEmployee
 */
@WebServlet("/updateProduct")
public class UpdateProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateProduct() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String eid = request.getParameter("id");
        int id = Integer.parseInt(eid);
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String image = request.getParameter("image");

        // Update the product details in your database using your existing code

        // Now, let's assume you have updated the product successfully, and you want to
        // increase the review count when the "Review" link is clicked
        String reviewCountParam = request.getParameter("review_count");
        if (reviewCountParam != null) {
            int reviewCount = Integer.parseInt(reviewCountParam);
            reviewCount++; // Increment the review count
            // Update the review count for the product in your database
            // You'll need to implement this logic using your DAO or database operations
        }

        // After updating the product and review count, you can forward the request
        // to a suitable view, e.g., adminProductView.jsp
        RequestDispatcher dis = request.getRequestDispatcher("adminProductView.jsp");
        dis.forward(request, response);
    }
    @WebServlet("/start-review")
    public class StartReviewServlet extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            // Get order_id and rating from the URL parameters
            String orderId = request.getParameter("order_id");
            String rating = request.getParameter("rating");

            // TODO: Insert or update the review in the database based on orderId and rating
            // Example SQL query: INSERT INTO reviews (order_id, rating) VALUES (?, ?)

            // Redirect back to the page where orders and reviews are displayed
            response.sendRedirect("orders-and-reviews.jsp");
        }
    }

    
}


