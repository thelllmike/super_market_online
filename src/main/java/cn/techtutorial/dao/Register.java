package cn.techtutorial.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Register {

	public static int insertUser(String name, String email, String password) {
	    int isSuccess = 0;
	    // Connect to the database
	    String url = "jdbc:mysql://localhost:3306/ecommerce_cart";
	    String user = "root";
	    String pwd = "root";

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection(url, user, pwd);

	        String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, name);
	        pstmt.setString(2, email);
	        pstmt.setString(3, password);

	        int rowsInserted = pstmt.executeUpdate();

	        if (rowsInserted > 0) {
	            isSuccess = 1;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	}

}
