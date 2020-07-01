<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
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


	<div class="list-group">
		<div class="container">

			<div class="row">

				<div class="col-sm-8">
					<div class="card">
						<div class="card-body">

							<h1 class="list-group-item list-group-item-action active">Category</h1>

							<c:forEach items="${categoryList }" var="c">
								<a
									href="${pageContext.request.contextPath }/admin/getProducts?catId=
	<c:out value="${c.getId() }"></c:out>&catName=
	<c:out value="${c.getName() }"></c:out>"
									class="list-group-item list-group-item-action "> <c:out
										value="${c.getName() }"></c:out>
								</a>
								<BR>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>