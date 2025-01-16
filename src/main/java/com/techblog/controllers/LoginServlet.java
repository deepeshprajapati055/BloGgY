package com.techblog.controllers;

import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
//import java.io.PrintWriter;

import com.techblog.dao.UserDao;
import com.techblog.helper.ConnectionProvider;
import com.techblog.models.Message;
import com.techblog.models.User;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		PrintWriter out = response.getWriter();
		
		String userEmail = request.getParameter("email");
		String userPassword = request.getParameter("pass");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		User u = dao.loginUser(userEmail, userPassword);
		
		if(u == null)
		{
			//loginError
			Message msg = new Message("Invalid Credentials ! Try agin.", "error", "alert-danger");
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			response.sendRedirect("login.jsp");
		}
		else
		{
			//loginSuccess
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", u);
			response.sendRedirect("profile.jsp");
		}
	}

}
