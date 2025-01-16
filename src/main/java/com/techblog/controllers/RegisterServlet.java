package com.techblog.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.techblog.dao.UserDao;
import com.techblog.helper.ConnectionProvider;
import com.techblog.models.User;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String chk = request.getParameter("check");
		if(chk == null)
		{
			out.println("Please check term's and conditions");
		}
		else
		{
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String pass = request.getParameter("user_password");
			String gender = request.getParameter("genders");
			String about = request.getParameter("about");
			
			//create user object and set all data to that object.
			User user = new User(name, email, pass, gender, about);
			
			//create a user dao object.
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			if (dao.saveUser(user)) {
			    out.println("Done");
			    System.out.println("User registered successfully.");
			} else {
			    out.println("Error");
			    System.out.println("Failed to register the user.");
			}
			
		}	
		
	}

}
