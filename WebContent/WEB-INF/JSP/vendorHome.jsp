<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
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
	<div class=container>
		<div class=jumbotron>
			<h2>
				Welcome
				<c:out value="${username }"></c:out>
			</h2>
		</div>
		<div align="right">
		<a href="${pageContext.request.contextPath }/vendor/logout" class="btn btn-secondary"s>Logout</a>
		</div>
		<h3>Select Category Where You Want To Add Product:</h3>
		<div class="card">
		<ul class="list-inline">
		<c:forEach items="${categoryList }" var="c">
			<li class="list-group-item"><a
				href="${pageContext.request.contextPath }/vendor/addProduct?catId=
	<c:out value="${c.getId() }"></c:out>&vid=<c:out value="${vid }"></c:out>">
				<c:out value="${c.getName() }"></c:out>
			</a></li>
			<BR>
		</c:forEach>
		</ul>
		</div>
	</div>
</body>
</html>