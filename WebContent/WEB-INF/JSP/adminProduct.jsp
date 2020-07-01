<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	
	
		<div class="container">
		<h1 class="list-group-item list-group-item-action active">Products</h1>
	<div class="card">
  <div class="card-body">
  		<h3><c:out value="${catName }"></c:out></h3><hr>
    	<c:forEach items="${prodList }" var="p">
	<c:out value="${p.getName()}"></c:out><br>
	<c:out value="${p.getShort_desc() }"></c:out><br>
	<c:out value="${p.getDescription() }"></c:out><br>
	<c:out value="${p.getPrice() }"></c:out><br>
	<br>
	
	<a href="${pageContext.request.contextPath }/admin/removeProduct?prodId=
	<c:out value="${p.getId() }"></c:out>&catId=<c:out value="${p.getCat_id() }"></c:out>">Remove <c:out value="${p.getName()}"></c:out></a>
	<br>
	
	<br><br>
	</c:forEach>
    </div>
  </div>
  </div>

</body>
</html>