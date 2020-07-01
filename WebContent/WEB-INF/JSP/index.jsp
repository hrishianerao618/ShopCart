<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
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
<br><br>
	<div class="container">

		<div class="row">

			<div class="col-sm-2">
			<div class="card">
			<br>
				<div class="jumbotron">

					<h6>Categories:</h6>
				</div>
				<c:set var="count" value="0"></c:set>

				<ul class="list-inline">
					<c:forEach items="${categoryList }" var="c">
						<li class="list-group-item"><a
							href="${pageContext.request.contextPath }/getProductsVisitor?catId=
	<c:out value="${c.getId() }"></c:out>"
							class="btn btn-default btn-lg"> <c:out
									value="${c.getName() }"></c:out>
						</a></li>
						<BR>
					</c:forEach>
				</ul>
				</div>
			</div>
		
			<div class="col-6">
<br>
				<c:forEach items="${prodList }" var="p">

					<div class="jumbotron">
						<h2>
							<c:out value="${p.getName()}"></c:out>
						</h2>
						<br>
						<h3>
							<c:out value="${p.getShort_desc() }"></c:out>
						</h3>
						<br>
						<h4>
							<c:out value="${p.getDescription() }"></c:out>
						</h4>
						<br>
						<h3>
							<c:out value="${p.getPrice() }₹"></c:out>
						</h3>
						<br> <br> <a
							href="${pageContext.request.contextPath }/addToCartVisitor?prodId=
	<c:out value="${p.getId() }"></c:out>"
							class="btn btn-dark">Add To Cart</a> <br>
						<br> <a href="${pageContext.request.contextPath }/buyLogin"
							class="btn btn-primary ">Buy</a>
					</div>
					<br>
					<br>


				</c:forEach>

			</div>
		</div>
	</div>

	<c:import url="footer.jsp"></c:import>
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
