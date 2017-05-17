<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Displaying All Products</title>
</head>
<body>

<h2> View All Products </h2>

<table class="tg">
<c:forEach var="product" items="${productList}">

<tr>
<td>
<img alt="${product.name}" src="resources/images/${product.id}.jpg">
</td>
<td>
<a class="icon-shopping-cart" href="myCart/add/${product.id}">Add To Cart</a>
</td>
</tr>
</c:forEach>
</table>
</body>
</html>