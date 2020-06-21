<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Productlines</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="bg-secondary">
	<%-- 	####<br> ${productLines}
	<br> #### --%>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="index.jsp"><i class="fa fa-ravelry"
			aria-hidden="true"></i></a>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="productlines">Product
					Lines</a></li>
			<li class="nav-item"><a class="nav-link" href="products">Products</a>
			</li>
		</ul>
	</nav>

	<div id="accordion">
		<div class="card bg-success">
			<a class="collapsed card-link" data-toggle="collapse"
				href="#collapseTwo"><div class="card-header text-white h4 text-center">Product lines
					Insert And Update Operation</div></a>
			<div id="collapseTwo" class="collapse" data-parent="#accordion">
				<div class="card-body container-fluid p-2">
					<div class="row">
						<div class="col bg-light rounded m-3">
							<div class="d-flex justify-content-center">
								<h4>Product lines Insert Row</h4>
							</div>
							<div>
								<form:form action="productlinesInsert" method="post" modelAttribute="productLine">
									<div class="form-group">
										<label for="productLine">Product Line:</label> <form:input path="productLine"
											type="text" class="form-control" placeholder="Product Line"
											id="productLine" required="required"/>
									</div>
									<div class="form-group">
										<label for="textDescription">TextDescription:</label>
										<form:textarea path="textDescription" class="form-control" rows="5" id="textDescription" required="required"/>
									</div>
									<button class="btn btn-primary" type="submit">Insert</button>
								</form:form>
							</div>
						</div>
						<div class="col bg-light rounded m-3">
							<div class="d-flex justify-content-center">
								<h4>Product lines Update Row</h4>
							</div>
							<div>
								<form:form action="productlinesEdit" method="post" modelAttribute="productLine">
									<div class="form-group">
										<label for="productLine">Product Line:</label> <form:select
											class="form-control" id="productLine" path="productLine">
											<c:choose>
												<c:when test="${not empty productLines}">
													<c:forEach var="current" items="${productLines}"
														varStatus="count">
														<form:option value="${current.productLine}" label="${current.productLine}"></form:option>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<option>No data available</option>
												</c:otherwise>
											</c:choose>

										</form:select>
									</div>
									<div class="form-group">
										<label for="textDescription">TextDescription:</label>
										<form:textarea class="form-control" rows="5" id="textDescription"
											path="textDescription" required="required"/>
									</div>
									<button class="btn btn-primary" type="submit">Update</button>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- <div class="container-fluid bg-success p-2"></div> -->
	<div class="container-fluid p-2">
		<div class="d-flex justify-content-center text-white">
			<h2>Product lines Table Data</h2>
		</div>
		<div id="products-table-area" class="m-3 p-3 text-white">
			<c:choose>
				<c:when test="${not empty productLines}">
					<table
						class="table table-dark table-striped table-hover table-bordered">
						<thead>
							<tr>
								<th scope='col'>Product Line</th>
								<th scope='col'>Description</th>
								<th scope='col'>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="current" items="${productLines}">
								<tr>
									<td>${current.productLine}</td>
									<td>${current.textDescription}</td>
									<td><a href="productlinesDelete?productline=${current.productLine}"><i class='fa fa-trash-o fa-2x text-white' aria-hidden='true'></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<option>No data available</option>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
</body>
</html>
