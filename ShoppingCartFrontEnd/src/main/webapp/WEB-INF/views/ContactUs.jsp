<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contact Us</title>
</head>
<body>

	<div class="container">
		<h2>Contact Us</h2>
		<form class="form-horizontal" action="saveContact" method="post">
			<div class="form-group">
				<label class="control-label col-sm-2" for="contactName">Name:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="contactName" id="contactName" placeholder="Enter Name" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="contactEmail">Email:</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" name="contactEmail" id="contactEmail" placeholder="Enter Email" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="contactContact">Mobile:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="contactContact" id="contactContact" placeholder="Enter Mobile Number" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="contactMessage">Message:</label>
				<div class="col-sm-10">
					<textarea class="form-control" name="contactMessage" id="contactMessage" placeholder="Enter Your Message" required></textarea>
				</div>
			</div>
			

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-warning">Submit</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>