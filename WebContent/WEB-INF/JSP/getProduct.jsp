<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop-Cart</title>
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


	<div class="container">
	<div align="right"><a href="${pageContext.request.contextPath }/vendor/home">Home</a></div>
	<br>
	<br>
	<div class="jumbotron">
		<h4>Information Required:</h4><hr>
		<sf:form method="post"
		action="${pageContext.request.contextPath }/vendor/readProduct" modelAttribute="product">
		<h5>Name:</h5><sf:input type="text" path="name" class="form-control" id="example-text-input"></sf:input> <sf:errors path="name"></sf:errors><hr>
		<h5>Short-Desc:</h5><sf:input type="text" path="short_desc" class="form-control" id="example-text-input"></sf:input><sf:errors path="short_desc"></sf:errors><hr> 
		<h5>Description:</h5><sf:input type="text" path="description" class="form-control" id="example-text-input"></sf:input><sf:errors path="description"></sf:errors><hr> 
		
		<h5>Price:</h5><sf:input type="text" path="price" class="form-control" id="example-text-input"></sf:input> <br><br>
		<c:set var="catId" value="${catId }"></c:set>
		<c:set var="vid" value="${vid }"></c:set>
		<input type="submit" value="ADD" class="btn btn-info" ></input><br>
		
	</sf:form>
	</div>
	</div>
</body>
</html>