<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
	rel="stylesheet" />
<title>Dashboard - Enomy Finances</title>
<link rel="stylesheet" href="styless.css">
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: "Montserrat Alternates", Poppins, sans-serif;
  background: #c4e3ff;
  margin: 0;
  padding: 0;
  display: flex;
  flex-direction: column;
  min-height: 100vh; /* Ensure body takes full height */
}

.container {
  margin-top: 4rem;
  max-width: 1280px;
  margin-left: auto;
  margin-right: auto;
  padding-left: 1rem;
  padding-right: 1rem;
  padding-top: 2rem;
  padding-bottom: 2rem;
  width: 70%;
  flex: 1; /* Allows the container to grow and push footer down */
}

/* Cards */
.card {
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
	width: 100%;
}

.card span{
	color: #4a3fe4;
}

/* Grid Layout */
.grid {
    display: flex;
    justify-content: space-between; /* Distributes space between the cards */
    gap: 1.5rem; /* Space between each card */
    flex-wrap: nowrap; /* Allows items to wrap to the next row on small screens */
}

/* Card Header */
.card-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

/* Icons */
.icon {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* Ensure icons inside the .icon div are 40px */
.icon i {
	font-size: 25px;
}

.balance-icon {
	background: #d1fae5;
	color: #10b981;
}

.savings-icon {
	background: #dbedff;
	color: #2563eb;
}

.expenses-icon {
	background: #fee2e2;
	color: #dc2626;
}

/* Amount Styling */
.amount {
	font-size: 1.5rem;
	font-weight: bold;
	color: #111827;
	margin-top: 10px;
}

.positive {
	color: #10b981;
}

.negative {
	color: #dc2626;
}

/* Transactions */
.transaction {
	display: flex;
	justify-content: space-between;
	padding: 15px;
	border-radius: 8px;
	transition: background 0.3s;
}

.transaction:hover {
	background: #f1f5f9;
}

.transaction-info {
	display: flex;
	align-items: center;
	gap: 10px;
}

.transaction-title {
	font-weight: bold;
	color: #111827;
}

.transaction-subtitle {
	color: #6b7280;
	font-size: 0.875rem;
}

.transaction-amount {
	text-align: right;
}

.transaction-date {
	color: #6b7280;
	font-size: 0.875rem;
}
@media (min-width: 1024px) {
  .grid {
    flex-direction: row; /* Keep cards in a row on large screens */
  }
}

/* Media Queries for Responsiveness */
@media (max-width: 768px) {
  .container {
    width: 90%;
    margin-top: 2rem;
  }

  .grid {
    flex-direction: column; /* Stack cards on smaller screens */
    gap: 1rem;
  }

  .card-header h3 {
    font-size: 1.25rem; /* Smaller font size for card titles */
  }

  .amount {
    font-size: 1.25rem; /* Slightly smaller amount font size */
  }

  .transaction {
    flex-direction: column; /* Stack transaction details */
    align-items: flex-start;
  }

  .transaction-amount {
    text-align: left;
    margin-top: 5px;
  }

  .transaction-info {
    flex-direction: column;
    align-items: flex-start;
  }

  .transaction-title, .transaction-subtitle {
    font-size: 1rem;
  }

  .transaction-date {
    font-size: 0.8rem;
  }
}

@media (max-width: 480px) {
  body {
    font-size: 14px; /* Adjust body font size for very small screens */
  }

  .container {
    padding-left: 0.5rem;
    padding-right: 0.5rem;
  }

  .grid {
    gap: 0.8rem; /* Reduce gap between cards */
  }

  .card-header h3 {
    font-size: 1rem; /* Further reduce title font size */
  }

  .amount {
    font-size: 1.1rem;
  }
}
</style>

</head>
<body>
	<!-- Navigation -->
	<header>
		<nav>
			<jsp:include page="/WEB-INF/views/header.jsp" />
		</nav>
	</header>

	<!-- Dashboard Content -->
	<div class="container">
		<!-- Welcome Section -->
		<div class="card">
			<h1>Welcome Back, <span>${user.fname} ${user.lname}</span></h1>
			<p>Here's an overview of your finances</p>
		</div>

		<!-- Stats Grid -->
		<div class="grid">
			<!-- Balance Card -->
			<div class="card">
				<div class="card-header">
					<h3>Total Balance</h3>
					<div class="icon balance-icon">
						<i class='bx bx-wallet' style='color: #01a41f'></i>
					</div>
				</div>
				<p class="amount">$32,800.00</p>
				<p class="positive">↑ 3.85% from last month</p>
			</div>

			<!-- Savings Card -->
			<div class="card">
				<div class="card-header">
					<h3>Total Savings</h3>
					<div class="icon savings-icon">
						<i class='bx bxs-bank' style='color: #188afb'></i>
					</div>
				</div>
				<p class="amount">$15,200.00</p>
				<p class="positive">↑ 5.2% from last month</p>
			</div>

			<!-- Expenses Card -->
			<div class="card">
				<div class="card-header">
					<h3>Monthly Expenses</h3>
					<div class="icon expenses-icon">
						<i class='bx bx-money-withdraw' style='color: #f92e27'></i>
					</div>
				</div>
				<p class="amount">$4,500.00</p>
				<p class="negative">↓ 0.9% from last month</p>
			</div>
		</div>

		<!-- Recent Transactions -->
		<div class="card">
			<h2>Recent Transactions</h2>
			<div class="transaction">
				<div class="transaction-info">
					<div class="icon transaction-icon"></div>
					<div>
						<p class="transaction-title">Online Payment</p>
						<p class="transaction-subtitle">
							<i class="ri-netflix-fill" style='color: #FF0000'></i> Netflix
							Subscription
						</p>
					</div>
				</div>
				<div class="transaction-amount">
					<p class="negative">-$24.99</p>
					<p class="transaction-date">Today</p>
				</div>
			</div>

			<div class="transaction">
				<div class="transaction-info">
					<div class="icon transaction-icon"></div>
					<div>
						<p class="transaction-title">Food Delivery</p>
						<p class="transaction-subtitle">
							<i class="ri-restaurant-2-fill" style="color: #FFA500"></i> Uber
							Eats
						</p>
					</div>
				</div>
				<div class="transaction-amount">
					<p class="negative">-$18.75</p>
					<p class="transaction-date">Yesterday</p>
				</div>
			</div>

			<div class="transaction">
				<div class="transaction-info">
					<div class="icon transaction-icon"></div>
					<div>
						<p class="transaction-title">Online Shopping</p>
						<p class="transaction-subtitle">
							<i class="ri-shopping-bag-fill" style="color: #007BFF"></i>
							Amazon Purchase
						</p>
					</div>
				</div>
				<div class="transaction-amount">
					<p class="negative">-$120.50</p>
					<p class="transaction-date">Feb 3</p>
				</div>
			</div>
		</div>
	</div>
	
		<jsp:include page="/WEB-INF/views/footer.jsp" />
	
</body>
</html>
