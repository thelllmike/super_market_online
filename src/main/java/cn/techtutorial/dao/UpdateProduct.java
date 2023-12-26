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
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String eid = request.getParameter("id");
		
		int id = Integer.parseInt(eid);
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String price = request.getParameter("price");
		String image = request.getParameter("image");
	
		
        System.out.println("Pass");
		int pd = 3;
		
		pd = Products.UpdateProduct(id,name,category,price, image);
	
		if (pd == 1) {

			
			RequestDispatcher dis = request.getRequestDispatcher("adminProductView.jsp");
			dis.forward(request, response);
			System.out.println("Successful");
			
		} else if (pd == 0) {

			
			RequestDispatcher dis2 = request.getRequestDispatcher("adminProductView.jsp");
			dis2.forward(request, response);
			System.out.println("UnSuccessful");
		}
	}

}

