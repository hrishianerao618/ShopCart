<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
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
			<h1 class="card-header">Log-In</h1>
			<div class="card-body">
				<font size="3" color="red"><h2>
						<c:out value="${loginMsg }"></c:out>
					</h2></font>

				<sf:form action="${pageContext.request.contextPath }/processLogin"
					method="post" modelAttribute="user">
				<font size="3" color="red"><h2>	<c:out value="${msg }"></c:out></h2></font>
				
					<br>
					<h5>Username:</h5>
					<sf:input type="text" path="username"></sf:input>
					<hr>
					<h5>Password:</h5>
					<sf:input type="password" path="password"></sf:input>
					<br>
					<br>
					<input type="submit" value="Log-In" class="btn btn-secondary"></input>
					<br>

				</sf:form>
				</div>
				
			</div>
		</div>
		<br><br><br>
		<c:import url="footer.jsp"></c:import>
</body>
</html>