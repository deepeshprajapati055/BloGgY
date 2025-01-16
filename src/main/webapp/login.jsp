<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.techblog.models.Message" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

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

	<!-- Navigation Bar -->
	<%@include file="header.jsp"%>

	<!-- Login Page  -->
	<main class="d-flex align-item-center pt-5 primary-background text-white" style="height: 100vh">
		<div class="container mb-5">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-header primary-background text-white text-center"><span class="fa fa-user-circle fa-2x"></span><p>SIGN IN</p></div>
						
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
						<div class="card-body">
							<form action="LoginServlet" method="post">
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input name="email" type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email address" required></div>
<div class="mb-3 position-relative">
<label for="exampleInputPassword1" class="form-label">Password</label>
	<input name="pass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter password" required>
<span class="position-absolute" id="togglePassword" 
        style="top: 55%; right: 10px; cursor: pointer; z-index: 10; ">
        <i class="fa fa-eye" id="toggleIcon"></i>
    </span>
</div>
								<!-- <div class="mb-3 form-check">
									<input type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Check me out</label>
								</div> -->
								<button type="submit" class="btn primary-background text-white w-100 mt-2">Login</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- Footer Bar -->
	<%@include file="footer.jsp"%>

	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
		
<script>
    // JavaScript to hide the alert
    setTimeout(() => {
        const messageAlert = document.getElementById('messageAlert');
        if (messageAlert) {
            messageAlert.style.display = 'none';
        }
    }, 20000);
    
    
    // JavaScript to toggle password visibility
    const passwordField = document.getElementById('exampleInputPassword1');
    const togglePassword = document.getElementById('togglePassword');
    const toggleIcon = document.getElementById('toggleIcon');

    togglePassword.addEventListener('click', () => {
        const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordField.setAttribute('type', type);
        toggleIcon.classList.toggle('fa-eye');
        toggleIcon.classList.toggle('fa-eye-slash');
    });
</script>

</body>
</html>