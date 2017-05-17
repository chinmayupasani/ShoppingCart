<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="h2">Manage Supplier</div>
		<div id="CreateSupplier">
			<form class="form-horizontal" action="manage_supplier_add">
				<div class="form-group">
					<label class="control-label col-sm-3" for="sId">Supplier Id:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="sId" placeholder="Enter Supplier Id" name="sId" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="sName">Supplier Name:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="sName" placeholder="Enter Supplier Name" name="sName" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="sDescription">Supplier Description:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="sDescription" placeholder="Enter Supplier Description" name="sDescription" required>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-9">
						<button type="submit" class="btn btn-success">Create Supplier</button>
					</div>
				</div>
			</form>
		</div>
		
		<div id="UpdateSupplier">
			<form class="form-horizontal" action="manage_supplier_update" method="post">
				<div class="form-group">
					<label class="control-label col-sm-3" for="sId">Supplier Id:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="sId" placeholder="Enter Supplier Id" name="cId" value="${selectedSupplier.id}" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="sName">Supplier Name:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="cName" placeholder="Enter Supplier Name" name="cName" value="${selectedSupplier.name}" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="sDescription">Supplier Description:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="sDescription" placeholder="Enter Supplier Description" name="sDescription" value="${selectedSupplier.description}" required>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-9">
						<button type="submit" class="btn btn-info">Update Supplier</button>
					</div>
				</div>
			</form>
		</div>
		
		
		
		<div id="ShowSupplier">
			<table class="table table-striped">
			<thead>
				<tr>
					<td>Supplier Id</td>
					<td>Supplier Name</td>
					<td>Supplier Description</td>
					<td>Action</td>
				</tr>
			</thead>
				<c:forEach var="supplier" items="${supplierList}">
					<tr>
						<td>${supplier.id}</td>
						<td>${supplier.name}</td>
						<td>${supplier.description}</td>
						<td>
							<a href = "manage-supplier-delete/${supplier.id}" class="btn btn-danger">Delete</a>
							<a href = "manage-supplier-edit/${supplier.id}" class="btn btn-info">Edit</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>

</body>
