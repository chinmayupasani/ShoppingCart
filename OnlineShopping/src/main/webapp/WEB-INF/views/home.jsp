<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<spring:url var="images" value="/resources/images" />
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">

		<div class="row">

			<div class="col-md-3">
			<!-- include  category from sidebar.jsp -->
			<%@include file="./shared/sidebar.jsp" %> 
			</div>

			<div class="col-md-9">

				<div class="row carousel-holder">

					<div class="col-md-12">
						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0"
									class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								<li data-target="#carousel-example-generic" data-slide-to="2"></li>
								<li data-target="#carousel-example-generic" data-slide-to="3"></li>
								<li data-target="#carousel-example-generic" data-slide-to="4"></li>
							</ol>
							<div class="carousel-inner">
								<div class="item active">
									<img class="slide-image" src="${images}/iPhone-SE.jpg"
										alt="iPhone SE">
								</div>
								<div class="item">
									<img class="slide-image" src="${images}/led.jpg"
										alt="Smart LED TV">
								</div>
								
								<div class="item">
									<img class="slide-image" src="${images}/laptop.jpg"
										alt="Apple Mackbook Air">
								</div>
								
								<div class="item">
									<img class="slide-image" src="${images}/iphone-6s.jpg"
										alt="iPhone 6s">
								</div>
								
								<div class="item">
									<img class="slide-image" src="${images}/headPhone.jpg"
										alt="HeadPhone">
								</div>
								
								
							</div>
							<a class="left carousel-control" href="#carousel-example-generic"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span>
							</a> <a class="right carousel-control"
								href="#carousel-example-generic" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span>
							</a>
						</div>
					</div>

				</div>
				
				
				
				  <div class="row">
				<c:forEach items="${products}" var="product">
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                              <a href="${contextroot}/show/${product.id}/product">
                              <img src="${product.code}" alt="product" width="200px" height="100px" /></a>
                            <div class="caption">
                                <h4 class="pull-right">&#8377;${product.price}</h4>
                                <h4><a href="${contextroot}/show/${product.id}/product">${product.name}</a>
                                </h4>
                                <p>${product.description}</p>
                            </div>
                           <div>
                           <a href="${contextRoot}/cart/add/${product.id}/product"
						class="btn btn-success"> <span
						class="glyphicon glyphicon-shopping-cart"></span> Add to Cart </a>
                          		         
                           </div>
                        </div>
                        </div>
                    
				</c:forEach>

<!-- 				<div class="row">

					<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
							<img src="http://placehold.it/320x150" alt="">
							<div class="caption">
								<h4 class="pull-right">$24.99</h4>
								<h4>
									<a href="#">First Product</a>
								</h4>
								<p>
									See more snippets like this online store item at <a
										target="_blank" href="http://www.bootsnipp.com">Bootsnipp
										- http://bootsnipp.com</a>.
								</p>
							</div>
							<div class="ratings">
								<p class="pull-right">15 reviews</p>
								<p>
									<span class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span>
								</p>
							</div>
						</div>
					</div>

					<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
							<img src="http://placehold.it/320x150" alt="">
							<div class="caption">
								<h4 class="pull-right">$64.99</h4>
								<h4>
									<a href="#">Second Product</a>
								</h4>
								<p>This is a short description. Lorem ipsum dolor sit amet,
									consectetur adipiscing elit.</p>
							</div>
							<div class="ratings">
								<p class="pull-right">12 reviews</p>
								<p>
									<span class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star-empty"></span>
								</p>
							</div>
						</div>
					</div>

					<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
							<img src="http://placehold.it/320x150" alt="">
							<div class="caption">
								<h4 class="pull-right">$74.99</h4>
								<h4>
									<a href="#">Third Product</a>
								</h4>
								<p>This is a short description. Lorem ipsum dolor sit amet,
									consectetur adipiscing elit.</p>
							</div>
							<div class="ratings">
								<p class="pull-right">31 reviews</p>
								<p>
									<span class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star-empty"></span>
								</p>
							</div>
						</div>
					</div>

					<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
							<img src="http://placehold.it/320x150" alt="">
							<div class="caption">
								<h4 class="pull-right">$84.99</h4>
								<h4>
									<a href="#">Fourth Product</a>
								</h4>
								<p>This is a short description. Lorem ipsum dolor sit amet,
									consectetur adipiscing elit.</p>
							</div>
							<div class="ratings">
								<p class="pull-right">6 reviews</p>
								<p>
									<span class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star-empty"></span> <span
										class="glyphicon glyphicon-star-empty"></span>
								</p>
							</div>
						</div>
					</div>

					<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
							<img src="http://placehold.it/320x150" alt="">
							<div class="caption">
								<h4 class="pull-right">$94.99</h4>
								<h4>
									<a href="#">Fifth Product</a>
								</h4>
								<p>This is a short description. Lorem ipsum dolor sit amet,
									consectetur adipiscing elit.</p>
							</div>
							<div class="ratings">
								<p class="pull-right">18 reviews</p>
								<p>
									<span class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star-empty"></span>
								</p>
							</div>
						</div>
					</div>

					<div class="col-sm-4 col-lg-4 col-md-4">
						<h4>
							<a href="#">Like this template?</a>
						</h4>
						<p>
							If you like this template, then check out <a target="_blank"
								href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">this
								tutorial</a> on how to build a working review system for your online
							store!
						</p>
						<a class="btn btn-primary" target="_blank"
							href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">View
							Tutorial</a>
					</div>

				</div>
 -->
			</div>

		</div>

	</div>
	<!-- /.container -->
</body>
</html>