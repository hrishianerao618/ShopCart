<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

	
<footer>
		<div  class="jumbotron  bg-dark text-white">
			<div class="container text-center text-md-left">

				<div class="row">

					<div class="col-md-3 mx-auto">
						<h5 class="font-weight-bold text-uppercase mt-3 mb-4">Quick
							Links</h5>
						<ul class="list-unstyled">
							<li><a href="#"  style="color: white;">Help Desk</a></li>
							<li><a href="#" style="color: white;">Contact Us</a></li>
							<li><a href="#" style="color: white;">Reviews</a></li>
							<li><a href="#" style="color: white;">About Us</a></li>
						</ul>

					</div>


					<hr class="clearfix w-100 d-md-none">


					<div class="col-md-3 mx-auto">


						<h5 class="font-weight-bold text-uppercase mt-3 mb-4">Navigation</h5>

						<ul class="list-unstyled">
							<li><a href="#" style="color: white;">FAQ</a></li>
							<li><a href="${pageContext.request.contextPath }/loginCustomer" style="color: white;">Login</a></li>
							<li><a href="${pageContext.request.contextPath }/signup" style="color: white;">Sign-Up</a></li>

						</ul>

					</div>
					
					<hr class="clearfix w-100 d-md-none">
					
					<div class="col-md-6 mx-auto">
						<h5 class="font-weight-bold text-uppercase mt-3 mb-4">Notification</h5>
						<form class="input-group">
							<input type="text" class="form-control form-control-sm"
								placeholder="name@example.com" aria-label="Your email"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="button button5" style="color: black;border-radius: 50%;" type="button">Subscribe</button>
							</div>
						</form>
					</div>
					
				</div>
			</div>
		</div>
</footer>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

</body>
</html>