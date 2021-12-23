<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="./base.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product App</title>
</head>
<body class="bg-dark text-white">
	<div class="container mt-3">

		<div class="row">
			<div class="col-md-12">
				<h1 class="text-center mb-3">Welcome to Product App</h1>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">S.No.</th>
							<th scope="col">Product Name</th>
							<th scope="col">Product Description</th>
							<th scope="col">Product Price</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${products }" var="p">
							<tr>
								<th scope="row">${p.id }</th>
								<td>${p.productName }</td>
								<td>${p.productDescription }</td>
								<td class="font-weight-bold">&#x20B9; ${p.price }</td>
								<td>
									<!-- delete product --> <a href="delete-product/${p.id }"><i
										class="fas fa-trash text-danger" style="font-size: 20px"></i></a>
									<!-- update product -->
									<form action="update-product" method="post">
										<button type="submit" name="prodID" value="${p.id }">
											<i class="fas fa-edit" style="font-size: 20px"></i>
										</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="container text-center">
					<a href="add-product" class="btn btn-outline-success">Add
						Product</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>