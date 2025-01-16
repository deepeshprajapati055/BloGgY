<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register page</title>

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

	<main class="primary-background pt-4 pb-5">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-header text-center primary-background text-white">
						<span class="fa fa-2x fa-user-circle"></span>
						<br>
						<p>SIGN UP</p>
						</div>
						<div class="card-body">
							
							<form id="reg-form" action="RegisterServlet" method="post">
							<div class="mb-3">
							<label for="user_name" class="form-label">Username</label><input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter your name" required></div>
						
							<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Email address</label> <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email address" required></div>
								
							<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Create Password</label><input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter password" required></div>
								
							<div class="mb-3">
							<label for="gender" class="form-label">Select Gender</label><br><input type="radio" id="gender" name="genders" value="Male">Male <input type="radio" id="gender" name="genders" value="Female">Female</div>
							
							<div class="form-group">
								<textarea name="about" class="form-control mb-2" cols="30" rows="5" placeholder="Enter something about yourself"></textarea></div>
							
							<div class="mb-3 form-check">
							<input name="check" type="checkbox" class="form-check-input" id="exampleCheck1"> <label class="form-check-label" for="exampleCheck1">Agree Term's and Conditions</label></div>
				<div class="containter text-center mb-2" id="loader" style="display:none;">
					<span class="fa fa-refresh fa-spin fa-3x"></span>
					<h4>Please wait...</h4>
				</div>
				<button id="submit-button" type="submit" class="btn primary-background text-white w-100 mb-2">Register</button>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>
    $(document).ready(function () {
        console.log("Document is loaded...");

        // Event listener for form submission
        $('#reg-form').on('submit', function (event) {
            event.preventDefault(); // Prevent the default form submission
            let form = new FormData(this); // Create FormData from the form element
            
            // Show loader and hide submit button
            $("#submit-button").hide();
            $("#loader").show();

            // Send data to the server via AJAX
            $.ajax({
                url: "RegisterServlet", // Servlet URL
                type: 'POST', // HTTP POST method
                data: form, // Form data
                processData: false, // Prevents jQuery from converting FormData into a query string
                contentType: false, // Prevents jQuery from setting the Content-Type header
                success: function (data, textStatus, jqXHR) {
                    console.log("Response from server:", data);
                    
                    // Show submit button and hide loader
                    $("#submit-button").show();
                    $("#loader").hide();
                    
                    // Handle server response
                    if (data.trim().toLowerCase() === 'done') {
                        swal("Done", "Registered Successfully! Redirecting to the login page...", "success").then(() => {
                        	// Set timeout for 5 seconds before redirecting
                            setTimeout(function () {
                                window.location = "login.jsp"; // Redirect to login page
                            }, 2000); // 5000 milliseconds = 5 seconds
                        });
                    } else {
                        swal("Error", data, "error"); // Show error message
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error("AJAX Error:", textStatus, errorThrown);
                    
                    // Show submit button and hide loader
                    $("#submit-button").show();
                    $("#loader").hide();

                    // Display generic error message
                    swal("Error", "Something went wrong. Please try again later.", "error");
                }
            });
        });
    });
</script>

</body>
</html>