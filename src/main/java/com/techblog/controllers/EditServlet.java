package com.techblog.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
//import java.io.PrintWriter;

import com.techblog.dao.UserDao;
import com.techblog.helper.ConnectionProvider;
import com.techblog.helper.Helper;
import com.techblog.models.Message;
import com.techblog.models.User;

@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//Fetch all the data
		String userEmail = request.getParameter("user_email");
		String userName = request.getParameter("user_name");
		String userPass = request.getParameter("user_pass");
		String userAbout = request.getParameter("user_about");
		
		Part part = request.getPart("image");
		String imageName = part != null ? part.getSubmittedFileName() : "";
		
		//Get the user from the session.
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPass);
		user.setAbout(userAbout);
		user.setProfile(imageName);
		
		// Check if a new image is uploaded
        if (imageName != null && !imageName.isEmpty()) {
            // New image uploaded
            user.setProfile(imageName);

            // Get the real path for saving the new image
            String path = request.getServletContext().getRealPath("/") + "pics" + File.separator + user.getProfile();

            // Delete old image
            String oldImagePath = request.getServletContext().getRealPath("/") + "pics" + File.separator + ((User) session.getAttribute("currentUser")).getProfile();
            Helper.deleteFile(oldImagePath);

            // Save the new image
            Helper.saveFile(part.getInputStream(), path);
        }
        
		//updata database.........
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		boolean ans = userDao.updateUser(user);

		//PrintWriter out = response.getWriter();
		
		if (ans) {
            Message msg = new Message("Profile Details Updated Successfully", "success", "alert-success");
            session.setAttribute("msg", msg);
        } else {
            Message msg = new Message("Something Went Wrong!", "error", "alert-danger");
            session.setAttribute("msg", msg);
        }

        response.sendRedirect("profile.jsp");
	}

}
