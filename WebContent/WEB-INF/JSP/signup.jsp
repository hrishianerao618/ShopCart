<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
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
	
<c:import url="header.jsp"></c:import>
	<br><br><br>
	<div class="container">
		<div class="card">
		<h1 class="card-header">Sign-Up</h1>
			<div class="card-body">
				<sf:form method="post"
					action="${pageContext.request.contextPath }/readSignup"
					modelAttribute="user" >
					<div class="form-group row">
						<div class="col-sm-2">Name:</div>
						<div class="col-sm-10">
							<sf:input type="text" path="name"></sf:input>
							<font color="red"><sf:errors path="name"></sf:errors></font>
						</div>
					</div>
					<hr>
					<div class="form-group row">
						<div class="col-sm-2">
							 Username:
						</div>
						<div class="col-sm-10">
							<sf:input type="text" path="username"></sf:input>
							<font color="red"><sf:errors path="username"></sf:errors></font>
						</div>
					</div>
					<hr>
					<div class="form-group row">
						<div class="col-sm-2">
							E-Mail:
						</div>
						<div class="col-sm-10">
							<sf:input type="text" path="mail" placeholder="name@example.com"></sf:input>
							<font color="red"><sf:errors path="mail"></sf:errors></font>
						</div>
					</div>
					<hr>
					<div class="form-group row">
						<div class="col-sm-2">Password:</div>
						<div class="col-sm-10">
							<sf:input type="password" path="password"></sf:input>
							<font color="red"><sf:errors path="password"></sf:errors></font>
							<br><br> <input type="submit" value="Sign-Up" class="btn btn-secondary"></input><br>
						</div>
					</div>
					
				</sf:form>
			</div>
		</div>
	</div>
	<br><br><br>
	<c:import url="footer.jsp"></c:import>
</body>
</html>