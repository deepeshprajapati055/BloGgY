<%@page import="com.techblog.models.Categories"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.techblog.models.User"%>
<%@ page errorPage="errorpage.jsp"%>
<%@ page import="com.techblog.models.Message" %>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User-profile</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link href="css/style.css" rel="stylesheet" type="text/css" />

<!-- Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<!-- Navbar start -->
	<!-- Navigation bar open -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark primary-background ">
		<div class="container-fluid">
			<a class="navbar-brand ms-5" href="index.jsp"><span
				class="fa fa-asterisk"></span> BloGgY</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#"><span
							class="fa fa-user-secret"></span> AboutUs</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> <span
							class="fa fa-check-square-o"></span> Categories
					</a>
						<ul class="dropdown-menu dropdown-menu-dark primary-background">
							<li><a class="dropdown-item" href="#"><span
									class="fa fa-coffee"></span> Programming Language</a></li>
							<li><a class="dropdown-item" href="#"><span
									class="fa fa-coffee"></span> Project Implementation</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#"><span
									class="fa fa-code-fork"></span> DataStructure & Algorithm's</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link text-capitalize"
						href="#"><span class="fa fa-address-card-o"></span> ContactUs</a></li>
						<li class="nav-item"><a class="nav-link text-capitalize" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal"><span class="fa fa-thumb-tack"></span>DoPost</a></li>
				</ul>

				<ul class="navbar-nav mr-right">
					<li class="nav-item"><a
						class="nav-link text-capitalize btn btn-link myclass" href="#!"
						data-bs-toggle="modal" data-bs-target="#profile-modal"><span
							class="fa fa-user-circle"></span><%=user.getName()%></a></li>
					<li class="nav-item"><a
						class="nav-link text-capitalize btn btn-link myclass"
						href="LogoutServlet"><span class="fa fa-users"></span>Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Navbar end -->
	<!-- Displaying invalid credentials in login page. -->
		<%
			Message m = (Message)session.getAttribute("msg");
			if(m != null){
		%>
		<div class="alert text-center <%=m.getCssClass() %>" id="messageAlert" role="alert">
		<%= m.getContent() %>
		</div>		
		<%
			session.removeAttribute("msg");
		}
		%>
	
	<main>
		<div class="container">
			<h1>This is user profile main section.</h1>
		</div>
	</main>

	<!-- Profile Start -->
	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h1 class="modal-title fs-5" id="exampleModalLabel">BloGgY</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img
							src="<%=request.getContextPath()%>/pics/<%=(user.getProfile() != null && !user.getProfile().isEmpty()) ? user.getProfile() : "default.png"%>"
							style="border-radius: 50%; max-width: 150px;">
						<h4 class="modal-title fs-5 mt-2" id="exampleModalLabel"><%=user.getName()%></h4>

						<!-- Details -->
						<div id="profile-details">
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">ID:</th>
									<td><%=user.getId()%></td>
								</tr>
								<tr>
									<th scope="row">Email:</th>
									<td><%=user.getEmail()%></td>
								</tr>
								<tr>
									<th scope="row">Gender:</th>
									<td><%=user.getGender()%></td>
								</tr>
								<tr>
									<th scope="row">Status:</th>
									<td><%=user.getAbout()%></td>
								</tr>
								<tr>
									<th scope="row">Timing:</th>
									<td><%=user.getDatetime().toString()%></td>
								</tr>
							</tbody>
						</table>
						</div>	
					<!-- Profile Edit -->
						<div id="profile-edit" style="display:none;">
							<h4 class="mt-2"></h4>
							<form action="EditServlet" method="post" enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID: </td>
										<td><%= user.getId() %></td>
									</tr>
									<tr>
										<td>Email: </td>
										<td><input type="email" name="user_email" class="form-control" value="<%= user.getEmail() %>"/></td>
									</tr>
									<tr>
										<td>Name: </td>
										<td><input type="text" name="user_name" class="form-control" value="<%= user.getName() %>"/></td>
									</tr>
									<tr>
										<td>Password: </td>
										<td><input type="password" name="user_pass" class="form-control" value="<%= user.getPassword() %>"/></td>
									</tr>
									<tr>
										<td>Gender: </td>
										<td><%= user.getGender()%></td>
									</tr>
									<tr>
										<td>About: </td>
										<td>
										<textarea rows="3" class="form-control" name="user_about" ><%= user.getAbout() %></textarea>
										</td>
									</tr>
									<tr>
										<td>Pic: </td>
										<td>
										<input type="file" name="image" class="form-control" required>
										</td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-success">Save</button>
								</div>
							</form>
						</div>
						
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" id="edit-profile" class="btn btn-primary primary-background text-white">Edit</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Profile End -->
	
	<!-- Post Modal -->
<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Post Details</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
        <form id="add-post-form" action="AddPost" method="post">
        	<div class="form-group">
        		<select class="form-control" name="cid">
        			<option selected disabled> ---select category---</option>
        			<%
        				PostDao post = new PostDao(ConnectionProvider.getConnection());
        				ArrayList<Categories> list = post.getAllCategory();
        				for(Categories c : list)
        				{
        			%>	
        			<option value=<%= c.getCid() %>><%= c.getCname() %></option>
        			<%
        				}
        			%>
        		</select>
        	</div><br>
        	<div class="form-group">
        		<input name="pTitle" type="text" placeholder="Enter Title" class="form-control" />
        	</div><br>
        	<div class="form-group">
        		<textarea name="pContent" placeholder="Enter Content" style="height:200px" class="form-control" ></textarea>
        	</div><br>
        	<div class="form-group">
        		<textarea name="pCode" placeholder="Enter Code" style="height:200px" class="form-control"></textarea>
        	</div><br>
        	<div class="form-group">
        		<label>Image</label><br>
        		<input name="pPic" type="file" class="form-control" />
        	</div><br>
        	<div class="container text-center">
        		<button type="submit" class="btn btn-success">Post</button>
        	</div>
        </form>
      </div>
    </div>
  </div>
</div>
	<!-- Post Modal end -->

	<!-- Footer Bar -->
	<%@include file="footer.jsp"%>

	<!-- JavaScript Start -->
	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
		
	<script src="/js/script.js" type="text/javascript"></script>
	<script>
	$(document).ready(function(){
		let editStatus = false;
		$('#edit-profile').click(function(){
			if(editStatus == false){
				$('#profile-details').hide()
				$('#profile-edit').show()
				editStatus = true;
				$(this).text("Back")
			}else{
				$('#profile-details').show()
				$('#profile-edit').hide()
				editStatus = false;
				$(this).text("Edit")
			}
		})
	});
	
	setTimeout(() => {
        const messageAlert = document.getElementById('messageAlert');
        if (messageAlert) {
            messageAlert.style.display = 'none'; // Hide the alert
        }
    }, 5000);
    
	// for post
	$(document).ready(function() {
    $("#add-post-form").on("submit", function(event) {
        event.preventDefault();
        console.log("Submit clicked by deepesh");

        let form = new FormData(this);

        // Debugging form data
        for (let [key, value] of form.entries()) {
            console.log(key, value);
        }

        $.ajax({
            url: "AddPost",
            type: 'post',
            data: form,
            processData: false,
            contentType: false,
            success: function(data, textStatus, jqXHR) {
                console.log("Successfully added");
                alert("Post added successfully!");
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error("Error occurred:", errorThrown);
                alert("Failed to add post.");
            }
        });
    });
});
    
	</script>
</body>
</html>