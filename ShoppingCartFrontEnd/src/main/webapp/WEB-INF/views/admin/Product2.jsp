<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product page</title>
</head>
<body>

<div class="container">
		<div class="h2">Manage Products</div>
		<div id="AddProduct">
			<sf:form class="form-horizontal" modelAttribute="product" action="${contextRoot}/manage-product-add" enctype="multipart/form-data" method="POST">
				<div class="form-group">
					<label class="control-label col-sm-3" for="id">Product Id:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="id" placeholder="Enter Product Id" name="id" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="name">Product Name:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="name" placeholder="Enter Product Name" name="name" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="description">Product Description:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="description" placeholder="Enter Product Description" name="description" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="price">Product Price:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="price" placeholder="Enter Product Price" name="price" required>
					</div>
				</div>
				<div class="form-group">

							<label class="control-label col-md-4" for="file">Select an Image:</label>
							<div class="col-md-8">
							
							<sf:input type="file" path="file" id="file"  class="form-control"/>
							<sf:errors path="file" cssClass="help-block" element="em"/>
							
							</div>
						</div>
			</div>
				

				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-9">
						<button type="submit" class="btn btn-success">Create Product</button>
					</div>
				</div>
				</sf:form>
				
			
		</div>
		
		<%-- <div id="UpdateProduct">
			<form class="form-horizontal" action="manage-product-update" method="post">
				<div class="form-group">
					<label class="control-label col-sm-3" for="pId">Product Id:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="pId" placeholder="Enter Product Id" name="pId" value="${selectedProduct.id}" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="pName">Product Name:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="pName" placeholder="Enter Product Name" name="pName" value="${selectedProduct.name}" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="pDescription">Product Description:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="pDescription" placeholder="Enter Product Description" name="pDescription" value="${selectedProduct.description}" required>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-9">
						<button type="submit" class="btn btn-info">Update Product</button>
					</div>
				</div>
			</form>
		</div> --%>
		
		
		
		<div id="ShowProduct">
			<table class="table table-striped">
			<thead>
				<tr>
					<td>Product Id</td>
					<td>Product Name</td>
					<td>Product Description</td>
					<td>Action</td>
				</tr>
			</thead>
				<c:forEach var="Product" items="${productList}">
					<tr>
						<td>${product.id}</td>
						<td>${product.name}</td>
						<td>${product.description}</td>
						<td>
							<a href = "manage-product-delete/${product.id}" class="btn btn-danger">Delete</a>
							<a href = "manage-product-edit/${product.id}" class="btn btn-info">Edit</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>

</body>
</html>