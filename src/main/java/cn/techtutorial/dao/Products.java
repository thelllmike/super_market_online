package cn.techtutorial.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class Products {

	public static int insertProduct(String name, String category, String price, String image) {
	    int isSuccess = 0;
	    // Connect to the database
	    String url = "jdbc:mysql://localhost:3306/ecommerce_cart";
	    String user = "root";
	    String pwd = "1234";

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection(url, user, pwd);

	        String sql = "INSERT INTO products (name, category, price, image) VALUES (?, ?, ?, ?)";
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, name);
	        pstmt.setString(2, category);
	        pstmt.setDouble(3, Double.parseDouble(price)); // Set as double
	        pstmt.setString(4, image);

	        int rowsInserted = pstmt.executeUpdate();

	        if (rowsInserted > 0) {
	            isSuccess = 1;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	}
	
	
	public static int UpdateProduct(int id,String name, String category, String price, String image) {
		
		int result = 0;
		
		String url = "jdbc:mysql://localhost:3306/ecommerce_cart";
		String user = "root";
		String pwd = "1234";
  
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,user,pwd);
			
			Statement stmt = con.createStatement();	
			String sql = "update products set name = '"+name+"',category = '"+category+"',price = '"+price+"',image = '"+image+"' where id = '"+id+"'";
			System.out.println("SQL Result: "+sql);
			int rs = stmt.executeUpdate(sql);
			System.out.println("SQL Result: "+rs);
			
			if(rs > 0) {
				result = 1;
			}
			else {
				result = 0;
			}
			
		
	}catch(Exception e){
		
		e.printStackTrace();
	}
		
		return result;
	}
	public static int deleteProduct(int id) {
	    int result=0;
	    
	    String url = "jdbc:mysql://localhost:3306/ecommerce_cart";
		String user = "root";
		String pwd = "1234";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pwd);

			Statement stmt = con.createStatement();
			String sql = "delete from products where id ='"+id+"'" ;

			int rn = stmt.executeUpdate(sql);
			if(rn>0)
			{
				result=1;
			}
			else
			{
				result=0;
			}
			
		
	}catch(Exception e)
		
	    {
		e.printStackTrace();
	    }
		
		return result;
	}

}
