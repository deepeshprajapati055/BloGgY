package com.techblog.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;

import com.techblog.dao.PostDao;
import com.techblog.helper.ConnectionProvider;
import com.techblog.models.Post;
import com.techblog.models.User;

public class AddPost extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        // Validate session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            out.println("User not logged in!");
            return;
        }
        User user = (User) session.getAttribute("currentUser");

        // Validate inputs
        int cId;
        try {
            cId = Integer.parseInt(request.getParameter("cid"));
        } catch (NumberFormatException e) {
            out.println("Invalid category ID.");
            return;
        }
        
        String pTitle = request.getParameter("pTitle");
        String pContent = request.getParameter("pContent");
        String pCode = request.getParameter("pCode");
        Part part = request.getPart("pPic");

        if (pTitle == null || pTitle.trim().isEmpty() ||
            pContent == null || pContent.trim().isEmpty() ||
            part == null || part.getSubmittedFileName().trim().isEmpty()) {
            out.println("Invalid inputs. Please fill all required fields.");
            return;
        }

        // Save the uploaded file
        String uploadPath = "C:/uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        part.write(uploadPath + File.separator + fileName);

        // Create Post object
        Post p = new Post(pTitle, pContent, pCode, fileName, null, cId, user.getId());

        // Save Post to the database
        try {
            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            if (dao.savePost(p)) {
                out.println("Post added successfully.");
            } else {
                out.println("Error saving post.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("An unexpected error occurred.");
        }
    }
}
