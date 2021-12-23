<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Product</title>
<meta charset="ISO-8859-1">
<%@include file="./base.jsp"%>
</head>
<body class="bg-dark text-white">

	<div class="container mt-3 p-3 mb-2 ">

		<div class="row">

			<div class="col-md-6 offset-md-3">

				<h1 class="text-center mb-3">Change Product Details</h1>

				<form action="handle-product" method="post">
				<label>Product Id</label>
					<input type="text" value="${prodDetails.id }"  class="form-control" name="id" readonly/>
					<div class="form-group">

						<label for="productName">Product Name</label> <input type="text"
							class="form-control" id="productName" name="productName"
							placeholder="Enter the product name here"
							value="${prodDetails.productName }">
					</div>

					<div class="form-group">
						<label for="productDescription">Product Description</label>
						<textarea rows="5" class="form-control" name="productDescription"
							id="description" placeholder="Enter the product description"
							>${prodDetails.productDescription}</textarea>
					</div>

					<div class="form-group">
						<label for="price">Product Price</label> <input type="number"
							placeholder="Enter Product Price" name="price"
							value="${prodDetails.price }" class="form-control" id="price">
					</div>

					<div class="container text-center">
						<a href="${pageContext.request.contextPath }/"
							class="btn btn-danger">Back</a>
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</form>
			</div>
		</div>

	</div>
</body>
</html>