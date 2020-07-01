<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
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

<c:import url="loginHeader.jsp"></c:import>
<br><br><br>
<c:set var="total" value="0"></c:set>
<div class="container">
<h1>My Cart</h1><br><hr>
<c:forEach items="${cartList }" var="c">
	<h3><c:out value="${c.getName() }"></c:out></h3><br>
	<h3><c:out value="${c.getPrice() }₹"></c:out></h3><br>
	<c:set var="total" value="${total + c.getPrice() }"></c:set>
	<a href="${pageContext.request.contextPath }/removeFromCart?prodId=
	<c:out value="${c.getId() }"></c:out>">Remove Product</a><br><br>
	<hr>
</c:forEach>

<h2>Total:<c:out value="${total }"></c:out>₹</h2>
<br>
 <a
							href="${pageContext.request.contextPath }/buy"  class="btn btn-dark">Buy</a>

</div>
<br><br><br>
<c:import url="footer.jsp"></c:import>
</body>
</html>