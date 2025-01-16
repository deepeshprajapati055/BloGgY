package com.techblog.dao;

import java.sql.*;
import java.util.*;

import com.techblog.models.Categories;
import com.techblog.models.Post;

public class PostDao {
	Connection con;
	
	public PostDao(Connection con) {
		this.con = con;
	}
	
	public ArrayList<Categories> getAllCategory(){
		ArrayList<Categories> list = new ArrayList<>();
		
		try {	
			String sql_query = "SELECT * FROM categories";
			Statement st = this.con.createStatement();
			ResultSet rs = st.executeQuery(sql_query);
			
			while(rs.next()) {
				
				int id = rs.getInt("cid");
				String name = rs.getString("cname");
				String description = rs.getString("cdescription");
				Categories c = new Categories(id, name, description);
				
				list.add(c);
			}
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean savePost(Post post) {
	    boolean success = false;
	    
	    String query = "INSERT INTO post (title, content, code, picture, created_at, category_id, user_id) VALUES (?, ?, ?, ?, NOW(), ?, ?)";

	    try (PreparedStatement pstmt = con.prepareStatement(query)) {
	        pstmt.setString(1, post.getpTitle());
	        pstmt.setString(2, post.getpContent());
	        pstmt.setString(3, post.getpCode());
	        pstmt.setString(4, post.getpPic());
	        pstmt.setInt(5, post.getCatId());
	        pstmt.setInt(6, post.getUserId());

	        int rowsAffected = pstmt.executeUpdate();
	        if (rowsAffected > 0) {
	            success = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return success;
	}
}
