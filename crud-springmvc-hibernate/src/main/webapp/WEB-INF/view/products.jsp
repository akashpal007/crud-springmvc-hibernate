<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>Products</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="bg-secondary">
	<%-- 	####
	<br> ${products}
	<br>$$
	<br> ${productLines}
	<br>#### --%>
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
				href="#collapseTwo"><div
					class="card-header text-white h4 text-center">Product Insert
					& Update Operation</div></a>
			<div id="collapseTwo" class="collapse" data-parent="#accordion">
				<div class="card-body container-fluid p-2">
					<div class="row">
						<div class="col bg-light rounded m-3">
							<div class="d-flex justify-content-center">
								<h4>Products Insert Row</h4>
							</div>
							<div>
								<form:form action="productsInsert" method="post" modelAttribute="product">
									<div class="form-group">
										<label for="productCode">Product Code:</label> <form:input
											type="text" class="form-control" placeholder="Product Code"
											id="productCode" path="productCode" required="required"/>
									</div>
									<div class="form-group">
										<label for="productName">Product Name:</label> <form:input
											type="text" class="form-control" placeholder="Product Name"
											id="productName" path="productName" required="required"/>
									</div>
									<div class="form-group">
										<label for="productLine">Product Line:</label><form:select
											class="form-control" id="productLine" path="productLineVO.productLine"
											required="required">
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
										<label for="productScale">Product Scale:</label> <form:input
											type="number" class="form-control"
											placeholder="Product Scale" id="productScale"
											path="productScale" min="0" step=".01" required="required"/>
									</div>
									<div class="form-group">
										<label for="productVendor">Product Vendor:</label> <form:input
											type="text" class="form-control" placeholder="Product Vendor"
											id="productVendor" path="productVendor" required="required"/>
									</div>
									<div class="form-group">
										<label for="productDescription">Product Description:</label>
										<form:textarea path="productDescription" class="form-control" rows="4"
											id="productDescription" required="required"/>
									</div>
									<div class="form-group">
										<label for="quantityInStock">QuantityInStock:</label> <form:input
											type="number" class="form-control"
											placeholder="QuantityInStock" id="quantityInStock"
											path="quantityInStock" min="0" required="required"/>
									</div>
									<div class="form-group">
										<label for="buyPrice">Buy Price:</label> <form:input type="number"
											class="form-control" placeholder="Buy Price" id="buyPrice"
											path="buyPrice" min="0" step=".01" required="required"/>
									</div>
									<div class="form-group">
										<label for="mSRP">MSRP:</label> <form:input type="number"
											class="form-control" placeholder="MSRP" id="mSRP" path="MSRP"
											min="0" step=".01" required="required"/>
									</div>
									<button class="btn btn-primary" type="submit">Insert</button>
								</form:form>
							</div>
						</div>
						<div class="col bg-light rounded m-3">
							<div class="d-flex justify-content-center">
								<h4>Products Update Row</h4>
							</div>
							<div>
								<form:form action="productsEdit" method="post" modelAttribute="product">
									<div class="form-group">
										<label for="productCode">Product Code:</label><form:select
											class="form-control" id="productCode" path="productCode"
											required="required">
											<c:choose>
												<c:when test="${not empty products}">
													<c:forEach var="current" items="${products}"
														varStatus="count">
														<form:option value="${current.productCode}" label="${current.productCode}"></form:option>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<option>No data available</option>
												</c:otherwise>
											</c:choose>

										</form:select>
									</div>
									<div class="form-group">
										<label for="productName">Product Name:</label> <form:input
											type="text" class="form-control" placeholder="Product Name"
											id="productName" path="productName" required="required"/>
									</div>
									<div class="form-group">
										<label for="productLine">Product Line:</label><form:select
											class="form-control" id="productLine" path="productLineVO.productLine"
											required="required">
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
										<label for="productScale">Product Scale:</label> <form:input
											type="number" class="form-control"
											placeholder="Product Scale" id="productScale"
											path="productScale" min="0" step=".01" required="required"/>
									</div>
									<div class="form-group">
										<label for="productVendor">Product Vendor:</label> <form:input
											type="text" class="form-control" placeholder="Product Vendor"
											id="productVendor" path="productVendor" required="required"/>
									</div>
									<div class="form-group">
										<label for="productDescription">Product Description:</label>
										<form:textarea class="form-control" rows="4"
											id="productDescription" path="productDescription" required="required"/>
									</div>
									<div class="form-group">
										<label for="quantityInStock">QuantityInStock:</label> <form:input
											type="number" class="form-control"
											placeholder="QuantityInStock" id="quantityInStock"
											path="quantityInStock" min="0" required="required"/>
									</div>
									<div class="form-group">
										<label for="buyPrice">Buy Price:</label> <form:input type="number"
											class="form-control" placeholder="Buy Price" id="buyPrice"
											path="buyPrice" min="0" step=".01" required="required"/>
									</div>
									<div class="form-group">
										<label for="mSRP">MSRP:</label> <form:input type="number"
											class="form-control" placeholder="MSRP" id="mSRP" path="MSRP"
											min="0" step=".01" required="required"/>
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
	<div class="container-fluid p-2">
		<div class="d-flex justify-content-center text-white">
			<h2>Products Table Data</h2>
		</div>
		<div id="products-table-area" class="m-3 p-3 text-white">
			<c:choose>
				<c:when test="${not empty products}">
					<table
						class="table table-dark table-striped table-hover table-bordered">
						<thead>
							<tr>
								<th scope='col'>Product Code</th>
								<th scope='col'>Product Name</th>
								<th scope='col'>Product Line</th>
								<th scope='col'>Product Scale</th>
								<th scope='col'>Product Vendor</th>
								<th scope='col'>Product Description</th>
								<th scope='col'>QuantityInStock</th>
								<th scope='col'>BuyPrice</th>
								<th scope='col'>MSRP</th>
								<th scope='col'>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="current" items="${products}">
								<tr>
									<td>${current.productCode}</td>
									<td>${current.productName}</td>
									<td>${current.productLineVO.productLine}</td>
									<td>${current.productScale}</td>
									<td>${current.productVendor}</td>
									<td>${current.productDescription}</td>
									<td>${current.quantityInStock}</td>
									<td>${current.buyPrice}</td>
									<td>${current.MSRP}</td>
									<td><a
										href="productsDelete?productcode=${current.productCode}"><i
											class='fa fa-trash-o fa-2x text-white' aria-hidden='true'></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<p>No data available</p>
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
