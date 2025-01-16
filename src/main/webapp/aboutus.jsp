<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About-Us</title>
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
	
	<main>
		<div class="container-fluid p-5 p-5 m-0 primary-background text-white">
			<div class="accordion" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button primary-background text-white" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="true" aria-controls="collapseOne">
							Accordion Item 1</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse show"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">
							Welcome to <strong>BloGgY</strong> your one-stop platform for creating, sharing, and discovering engaging content. We empower individuals and communities to express their unique voices through a user-friendly interface, allowing you to effortlessly publish insightful articles, captivating stories, and thought-provoking ideas, all while connecting with a diverse audience eager to explore new perspectives."
Key elements to highlight in your "About Us" for a blog application:
Core purpose:
Clearly state the primary function of your app - to provide a space for users to create and share blog posts.
User-centric design:
Emphasize the simplicity and ease of use of your application, making it accessible to bloggers of all levels.
Community building:
Mention the potential for readers to interact with bloggers through comments, likes, and sharing features.
Unique value proposition:
What sets your blog application apart from others? Is it a specific niche, advanced customization options, or a strong community focus?
Accessibility:
Highlight features that make your platform inclusive for diverse users, such as mobile optimization or accessibility tools.
Example variations:
For a niche blog app:
"Passionate about new thoughts? Our platform is designed specifically for you to share your expertise, connect with like-minded individuals, and dive deeper into the conversations that matter most."
For a visually-focused app:
"Elevate your storytelling with our visually-driven blog app. Seamlessly integrate high-quality images and videos to captivate your audience and bring your content to life."
For a collaborative blog app:
"Collaborate with others to create powerful, multi-faceted content. Easily invite co-authors, manage edits, and publish impactful pieces together."
Important considerations:
Keep it concise:
Aim for a short, impactful description that captures the essence of your app.
Use engaging language:
Choose words that resonate with your target audience, highlighting the benefits of using your platform.
Call to action:
Encourage users to explore your app by inviting them to "sign up today" or "start blogging now."
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed primary-background text-white" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">
							Accordion Item 2</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<strong>This is the second item's accordion body.</strong> It is
							hidden by default, until the collapse plugin adds the appropriate
							classes that we use to style each element. These classes control
							the overall appearance, as well as the showing and hiding via CSS
							transitions. You can modify any of this with custom CSS or
							overriding our default variables. It's also worth noting that
							just about any HTML can go within the
							<code>.accordion-body</code>
							, though the transition does limit overflow.
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button collapsed primary-background text-white" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">
							Accordion Item 3</button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">
							
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
	
</body>
</html>