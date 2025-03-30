<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<title>Admin Dashboard - Enomy Finance</title>
</head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

a {
	text-decoration: none;
}

li {
	list-style: none;
}

:root {
	--poppins: 'Poppins', sans-serif;
	--lato: 'Lato', sans-serif;
	--light: #F9F9F9;
	--blue: #3C91E6;
	--light-blue: #CFE8FF;
	--grey: #eee;
	--dark-grey: #AAAAAA;
	--dark: #342E37;
	--red: #DB504A;
	--yellow: #FFCE26;
	--light-yellow: #FFF2C6;
	--orange: #FD7238;
	--light-orange: #FFE0D3;
}

/* General Styles */
body {
	font-family: Arial, sans-serif;
	background: #c4e3ff;
	margin: 0;
	padding: 0;
}

/* Container */
.container {
	max-width: 1200px;
	margin: 5rem auto;
	padding: 20px;
}

/* Card Styles */
.card {
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

.card h3 {
	margin: 0;
	color: #555;
}

.title {
	font-size: 24px;
	font-weight: bold;
}

.subtitle {
	color: #777;
}

.box-info {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
	grid-gap: 24px;
	margin-top: 36px;
	padding: 0;
}

.box-info li {
	padding: 24px;
	background: var(--light);
	border-radius: 20px;
	display: flex;
	align-items: center;
	grid-gap: 24px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s ease-in-out;
}

.box-info li:hover {
	transform: translateY(-5px);
}

.box-info li .bx {
	width: 80px;
	height: 80px;
	border-radius: 10px;
	font-size: 36px;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* Users - Yellow */
.box-info li:nth-child(1) .bx {
	background: var(--light-yellow);
	color: var(--yellow);
}

/* Investments - Orange */
.box-info li:nth-child(2) .bx {
	background: var(--light-orange);
	color: var(--orange);
}

/* System Status - Blue */
.box-info li:nth-child(3) .bx {
	background: var(--light-blue);
	color: var(--blue);
}

.box-info li .text h3 {
	font-size: 24px;
	font-weight: 600;
	color: var(--dark);
}

.box-info li .text p {
	color: var(--dark-grey);
	font-size: 14px;
}

/* Tables */
.table-container {
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
	overflow-x: auto;
}

.table-container h2 {
	margin-bottom: 10px;
	color: #333;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background: #f8f8f8;
	color: #555;
}

tr:hover {
	background: #f1f1f1;
}

/* Badges */
.role {
	display: inline-block;
	padding: 5px 10px;
	border-radius: 15px;
	background: #d1e7dd;
	color: #155724;
	font-size: 12px;
	font-weight: bold;
}

.no-role {
	background: #f8d7da;
	color: #721c24;
}

.type {
	display: inline-block;
	padding: 5px 10px;
	border-radius: 15px;
	background: #cce5ff;
	color: #004085;
}
</style>
<body>

	<!-- Navigation -->
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<!-- Dashboard Content -->
	<div class="container">

		<!-- Welcome Section -->
		<div class="card">
			<h1 class="title">Admin Dashboard</h1>
			<p class="subtitle">Manage users and monitor transactions</p>
		</div>

		<!-- Stats Grid -->
		<ul class="box-info">
			<li><i class='bx bxs-group'></i> <span class="text">
					<h3>${users.size()}</h3>
					<p>Total Users</p>
			</span></li>
			<li><i class='bx bxs-dollar-circle'></i> <span class="text">
					<h3>${investments.size()}</h3>
					<p>Total Investments</p>
			</span></li>
			<li><i class='bx bxs-check-circle'></i> <span class="text">
					<h3>Active</h3>
					<p>System Status</p>
			</span></li>
		</ul>


		<!-- Users Table -->
		<div class="table-container">
			<h2>Registered Users</h2>
			<table>
				<thead>
					<tr>
						<th>Name</th>
						<th>Email</th>
						<th>Contact</th>
						<th>Role</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${users}" var="user">
						<tr>
							<td>${user.fname}${user.lname}</td>
							<td>${user.email}</td>
							<td>${user.contactNumber}</td>
							<td><c:if test="${not empty user.roles}">
									<c:forEach items="${user.roles}" var="role">
										<span class="role">${role.id == 1 ? 'ADMIN' : 'USER'}</span>
									</c:forEach>
								</c:if> <c:if test="${empty user.roles}">
									<span class="role no-role">No Role Assigned</span>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- Investment Transactions Table -->
		<div class="table-container">
			<h2>Investment Transactions</h2>
			<table>
				<thead>
					<tr>
						<th>User</th>
						<th>Type</th>
						<th>Initial Investment</th>
						<th>Monthly Investment</th>
						<th>Min Return</th>
						<th>Max Return</th>
						<th>Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${investments}" var="investment">
						<tr>
							<td>${investment.user.fname}${investment.user.lname}</td>
							<td><span class="type">${investment.investmentType}</span></td>
							<td>£${investment.initialInvestment}</td>
							<td>£${investment.monthlyInvestment}</td>
							<td>£${investment.minimumReturn}</td>
							<td>£${investment.maximumReturn}</td>
							<td><c:if test="${not empty investment.investmentDate}">
									<fmt:parseDate value="${investment.investmentDate}"
										pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
									<fmt:formatDate value="${parsedDate}"
										pattern="dd/MM/yyyy HH:mm" />
								</c:if> <c:if test="${empty investment.investmentDate}">N/A</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>
