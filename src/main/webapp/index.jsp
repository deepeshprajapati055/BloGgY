<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<!-- CSS -->
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

	<!-- Hero Section -->
	<div class="container-fluid p-5 p-5 m-0 primary-background text-white">
		<div class="jumotron">
			<div class="container">
				<h3 class="display-3">Welcome to BloGgY</h3>
				<p>Welcome to technical blog, world of technology. A programming language is a system of notation for writing computer programs. Programming languages are described in terms of their syntax (form) and semantics (meaning), usually defined by a formal language.</p>
					
	<%-- <%  
		Connection con = ConnectionProvider.getConnection();
	    if (con != null) {
	        out.println("<h1>Connection Established: " + con + "</h1>");
	    } else {
	        out.println("<h1>Connection is NULL</h1>");
	    }
	%>
	<h1><%= con %></h1> --%>
		
<!-- <p> Thousands of programming languages—often classified as imperative, functional, logic, or object-oriented—have been developed for a wide variety of uses. Many aspects of programming language design involve tradeoffs—for example, exception handling simplifies error handling, but at a performance cost. Programming language theory is the subfield of computer science that studies the design, implementation, analysis, characterization, and classification of programming languages.</p> -->

			<a class="btn btn-outline-light btn-lg" href="register.jsp"><span class="fa fa-external-link"></span> Start ! It's Free</a> 
					<a href="login.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user"></span>
					Login</a>
			</div>
		</div>
	</div>

	<!-- Cards -->
	<div class="container mt-5 mb-5">
	<!-- RowOne -->
		<div class="row mb-3">
			<div class="col-md-4">
				<div class="card primary-background text-white style=width: 18rem;">	<!-- style="width: 18rem;" -->
					<img src="img/python.png" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Python</h5>
						<p class="card-text">Python is a popular programming language. It was created by Guido van Rossum, and released in 1991. 
						<p>It is used for:<p>
<ul><li>web development</li>
<li>software development</li>
<li>mathematics</li>
<li>System scripting</li></ul>

						<a href="#" class="btn btn-outline-light"><span class="fa fa-external-link"></span> See more</a>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card primary-background text-white style=width: 18rem;">	<!-- style="width: 18rem;" -->
					<img src="img/Java.png" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Java</h5>
						<p class="card-text">Java is a programming language and a platform. Java is a high level, robust, object-oriented and secure programming language. Java was developed by Sun Microsystems in the year 1995. James Gosling is known as the father of Java. Before Java, its name was Oak......</p>
						<a href="#" class="btn btn-outline-light"><span class="fa fa-external-link"></span> See more</a>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card primary-background text-white style=width: 18rem;">	<!-- style="width: 18rem;" -->
					<img src="img/javascript.png" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">JavaScript</h5>
						<p class="card-text">JavaScript (js) is a light-weight object-oriented programming language which is used by several websites for scripting the webpages. It is an interpreted, full-fledged programming language that enables dynamic interactivity on websites when applied to an HTML document......</p>
						<a href="#" class="btn btn-outline-light"><span class="fa fa-external-link"></span> See more</a>
					</div>
				</div>
			</div>
		</div>
		
		<!-- RowTwo -->
		<div class="row">
			<div class="col-md-4">
				<div class="card primary-background text-white style=width: 18rem;">	<!-- style="width: 18rem;" -->
					<img src="img/python.png" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Machine Learning</h5>
						<p class="card-text">Machine learning is a branch of artificial intelligence (AI) that allows machines to learn and improve from data without being explicitly programmed. It uses algorithms to analyze large amounts of data, identify patterns, and make decisions. Machine learning systems can improve their performance over time as they are trained with more data....</p>
						<a href="#" class="btn btn-outline-light"><span class="fa fa-external-link"></span> See more</a>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card primary-background text-white style=width: 18rem;">	<!-- style="width: 18rem;" -->
					<img src="img/python.png" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Deep Learning</h5>
						<p class="card-text">Deep learning is a type of artificial intelligence (AI) that teaches computers to process data in a similar way to the human brain. Deep learning models can recognize complex patterns in data, such as pictures, sounds, and text, to make predictions and insights....</p>
						<a href="#" class="btn btn-outline-light"><span class="fa fa-external-link"></span> See more</a>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card primary-background text-white style=width: 18rem;">	<!-- style="width: 18rem;" -->
					<img src="img/AI.png" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Generative AI</h5>
						<p class="card-text">Generative artificial intelligence (AI) is a type of AI that can create new content, such as text, images, videos, music, and audio. It uses machine learning to learn from data and then generate new data with similar characteristics....</p>
						<a href="#" class="btn btn-outline-light"><span class="fa fa-external-link"></span> See more</a>
					</div>
				</div>
			</div>
		</div>
	</div>

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

</body>
</html>