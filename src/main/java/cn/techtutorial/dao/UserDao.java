package cn.techtutorial.dao;

import java.sql.*;
import cn.techtutorial.model.*;

public class UserDao {
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	public UserDao(Connection con) {
		this.con = con;
	}
	
	public User userLogin(String email, String password) {
		User user = null;
        try {
            query = "select * from users where email=? and password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if(rs.next()){
            	user = new User();
            	user.setId(rs.getInt("id"));
            	user.setName(rs.getString("name"));
            	user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }
	
	public User getUserDetails(int userId) {
	    User user = new User();
	    try {
	        String query = "SELECT name, email FROM ecommerce_cart.users WHERE id = ?";
	        PreparedStatement pst = con.prepareStatement(query);
	        pst.setInt(1, userId);
	        ResultSet rs = pst.executeQuery();

	        if (rs.next()) {
	            user.setName(rs.getString("name"));
	            user.setEmail(rs.getString("email"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return user;
	}

}
