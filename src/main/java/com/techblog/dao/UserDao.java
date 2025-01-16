package com.techblog.dao;

import java.sql.*;

import com.techblog.models.User;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}
	
	//method to insert user to database: - SignUp form (Registration form)
	public boolean saveUser(User user)
	{
		boolean f = false;
		try 
		{
			//user -> database
			String query = "INSERT INTO user(name, email, password, gender, about) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement stm =this.con.prepareStatement(query);
			stm.setString(1, user.getName());
			stm.setString(2, user.getEmail());
			stm.setString(3, user.getPassword());
			stm.setString(4, user.getGender());
			stm.setString(5, user.getAbout());
			
			int rowCount = stm.executeUpdate();
			f = (rowCount>0);	// return true if rows are affected.
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	
	}
	
	//SignIn (Login)
	public User loginUser(String email, String password)
	{
		User user = null;
		
		try 
		{
			String query = "SELECT * FROM user WHERE email=? AND password=?";
			PreparedStatement stm = con.prepareStatement(query);
			stm.setString(1, email);
			stm.setString(2, password);
			
			ResultSet rs = stm.executeQuery();
			
			if(rs.next())
			{
				user = new User();
				//fetch data from Database
				String name = rs.getString("name");
				
				user.setName(name);
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDatetime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return user;
	}
	
	public boolean updateUser(User user)
	{
		boolean f = false;
		try {
			String query = "UPDATE user SET name=?, email=?, password=?, gender=?, about=?, profile=? WHERE id=?";
			PreparedStatement stm = con.prepareStatement(query);
			stm.setString(1, user.getName());
			stm.setString(2, user.getEmail());
			stm.setString(3, user.getPassword());
			stm.setString(4, user.getGender());
			stm.setString(5, user.getAbout());
			stm.setString(6, user.getProfile());
			stm.setInt(7, user.getId());
			
			stm.executeUpdate();
			f=true;
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return f;
	}
}
