<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Currency Exchange - Enomy Finances</title>
<link rel="stylesheet" href="style.css">
</head>

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
}

/* Title Section */
.title-section {
	background-color: #ffffff;
	border-radius: 1rem;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	padding: 2rem;
	margin-bottom: 2rem;
}

.title-section h1 {
	font-size: 1.75rem;
	font-weight: 700;
	color: #1f2937;
}

.title-section p {
	font-size: 1rem;
	color: #6b7280;
}

/* Exchange Form */
.exchange-form {
	background-color: #ffffff;
	border-radius: 1rem;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	padding: 2rem;
	margin-bottom: 2rem;
}

/* Form Grid */
.form-grid {
	display: grid;
	grid-template-columns: 1fr;
	gap: 2rem;
}

@media ( min-width : 768px) {
	.form-grid {
		grid-template-columns: 1fr 1fr;
	}
}

/* Form Fields */
.relative {
	position: relative;
}

label {
	display: block;
	font-size: 0.9rem;
	font-weight: 600;
	color: #4b5563;
	margin-bottom: 0.5rem;
}

select, input {
	width: 100%;
	padding-left: 1rem;
	padding-top: 0.75rem;
	padding-bottom: 0.75rem;
	border: 2px solid #e5e7eb;
	border-radius: 0.5rem;
	background-color: #ffffff;
	transition: all 0.2s ease;
	font-size: 1rem;
}

select:focus, input:focus {
	border-color: #3b82f6;
	box-shadow: 0 0 0 2px rgba(59, 130, 246, 0.2);
}

input[type="number"] {
	-moz-appearance: textfield;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

/* Fee Information Section */
.fee-information {
	background: linear-gradient(135deg, #eff6ff 0%, #c3dafe 100%);
	border-radius: 1rem;
	padding: 1.5rem;
	border: 2px solid #bfdbfe;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.fee-information h3 {
	font-weight: 600;
	color: #1f2937;
	margin-bottom: 0.75rem;
	display: flex;
	align-items: center;
}

.fee-information svg {
	width: 1.25rem;
	height: 1.25rem;
	margin-right: 0.5rem;
	color: #3b82f6;
}

.fee-information ul {
	margin-top: 0.75rem;
}

.fee-information li {
	display: flex;
	align-items: center;
	font-size: 1rem;
	color: #4b5563;
}

.fee-information li svg {
	width: 1rem;
	height: 1rem;
	margin-right: 0.5rem;
	color: #10b981;
}

/* Submit Button */
.submit-btn {
	display: inline-flex;
	align-items: center;
	padding-left: 1.5rem;
	padding-right: 1.5rem;
	padding-top: 0.75rem;
	padding-bottom: 0.75rem;
	font-size: 1.125rem;
	font-weight: 600;
	border-radius: 0.5rem;
	background-color: #2563eb;
	color: #ffffff;
	border: 1px solid transparent;
	box-shadow: 0 0 0 2px rgba(59, 130, 246, 0.2);
	cursor: pointer;
	transition: all 0.2s ease;
}

.submit-btn:hover {
	background-color: #1d4ed8;
}

.submit-btn svg {
	width: 1.25rem;
	height: 1.25rem;
	margin-right: 0.5rem;
}

/* Result Section */
.result-container {
	background-color: #ffffff;
	border-radius: 1rem;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	padding: 2rem;
}

.result-container h2 {
	font-size: 1.5rem;
	font-weight: 700;
	color: #1f2937;
	margin-bottom: 1.5rem;
}

.grid-container {
	display: grid;
	grid-template-columns: 1fr;
	gap: 1.5rem;
}

@media ( min-width : 768px) {
	.grid-container {
		grid-template-columns: repeat(3, 1fr);
	}
}

.card {
	background-color: #f9fafb;
	border-radius: 0.75rem;
	padding: 1.5rem;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.card-title {
	font-size: 1rem;
	font-weight: 600;
	color: #4b5563;
}

.card-value {
	font-size: 1.25rem;
	font-weight: 700;
	color: #111827;
}

.final-card {
	background-color: #ebf5ff;
	border-radius: 0.75rem;
	padding: 1.5rem;
	border: 2px solid #bfdbfe;
}

.final-card-title {
	font-size: 1rem;
	font-weight: 600;
	color: #4b5563;
}

.final-card-value {
	font-size: 1.5rem;
	font-weight: 700;
	color: #2563eb;
}

/* Transaction History Section */
.transaction-history {
	margin-top: 2rem;
	background-color: #ffffff;
	border-radius: 1rem;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	padding: 2rem;
}

.transaction-history .section-title {
	font-size: 1.5rem;
	font-weight: 700;
	color: #1f2937;
	margin-bottom: 1.5rem;
}

.transaction-table {
	width: 100%;
	border-collapse: collapse;
}

.transaction-table th, .transaction-table td {
	padding: 1rem;
	text-align: left;
	font-size: 1rem;
	color: #4b5563;
}

.transaction-table th {
	background-color: #f9fafb;
	text-transform: uppercase;
	font-weight: 600;
}

.transaction-table td {
	background-color: #ffffff;
}

.transaction-table .hover\:bg-gray-50:hover {
	background-color: #f9fafb;
}

/* Error Message Section */
.error-message {
	margin-top: 1.5rem;
}

.error-container {
	display: flex;
	padding: 1.5rem;
	background-color: #fef2f2;
	border-left: 4px solid #f87171;
	border-radius: 0.5rem;
}

.error-icon {
	flex-shrink: 0;
}

.icon {
	height: 1.25rem;
	width: 1.25rem;
	color: #f87171;
}

.error-message-text {
	margin-left: 1rem;
}

.error-text {
	font-size: 1rem;
	color: #b91c1c;
}
</style>


<body>

	<header>
		<nav>
			<jsp:include page="/WEB-INF/views/header.jsp" />
		</nav>
	</header>

	<div class="container">
		<!-- Title Section -->
		<div class="title-section">
			<h1>Currency Exchange</h1>
			<p>Convert between multiple currencies with real-time rates</p>
		</div>

		<!-- Exchange Form -->
		<div class="exchange-form">
			<form action="exchange" method="POST" class="space-y-8">
				<div class="form-grid">
					<!-- From Currency -->
					<div class="relative">
						<label for="fromCurrency">From Currency</label> <select
							name="fromCurrency" id="fromCurrency">
							<option value="GBP">🇬🇧 British Pound (GBP)</option>
							<option value="USD">🇺🇸 US Dollar (USD)</option>
							<option value="EUR">🇪🇺 Euro (EUR)</option>
							<option value="BRL">🇧🇷 Brazilian Real (BRL)</option>
							<option value="JPY">🇯🇵 Japanese Yen (JPY)</option>
							<option value="TRY">🇹🇷 Turkish Lira (TRY)</option>
						</select>
					</div>

					<!-- To Currency -->
					<div class="relative">
						<label for="toCurrency">To Currency</label> <select
							name="toCurrency" id="toCurrency">
							<option value="USD">🇺🇸 US Dollar (USD)</option>
							<option value="GBP">🇬🇧 British Pound (GBP)</option>
							<option value="EUR">🇪🇺 Euro (EUR)</option>
							<option value="BRL">🇧🇷 Brazilian Real (BRL)</option>
							<option value="JPY">🇯🇵 Japanese Yen (JPY)</option>
							<option value="TRY">🇹🇷 Turkish Lira (TRY)</option>
						</select>
					</div>

					<!-- Amount -->
					<div class="relative">
						<label for="amount">Amount</label> <input type="number"
							name="amount" min="300" max="5000" step="0.01" required
							placeholder="Enter amount (300-5000)" id="amount">
						<p>Min: 300 - Max: 5000</p>
					</div>

					<!-- Fee Information -->
					<div class="fee-information">
						<h3>
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                <path fill-rule="evenodd"
									d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z"
									clip-rule="evenodd" />
                            </svg>
							Transaction Fees
						</h3>
						<ul>
							<li>Up to 500: 3.5%</li>
							<li>Over 500: 2.7%</li>
							<li>Over 1500: 2.0%</li>
							<li>Over 2500: 1.5%</li>
						</ul>
					</div>
				</div>

				<!-- Submit Button -->
				<div class="flex justify-end mt-8">
					<button type="submit" class="submit-btn">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z" />
                        </svg>
						Calculate Exchange
					</button>
				</div>
			</form>
		</div>

		<!-- Result Section (shown conditionally) -->
		<!-- Result Section (shown conditionally) -->
		<c:if test="${not empty originalAmount}">
			<div class="result-container">
				<h2 class="section-title">Exchange Result</h2>
				<div class="grid-container">
					<!-- Original Amount -->
					<div class="card">
						<h3 class="card-title">Original Amount</h3>
						<p class="card-value" id="originalAmount">${originalAmount}</p>
					</div>

					<!-- Exchange Rate -->
					<div class="card">
						<h3 class="card-title">Exchange Rate</h3>
						<p class="card-value" id="exchangeRate">1 = ${exchangeRate}</p>
					</div>

					<!-- Converted Amount Before Fees -->
					<div class="card">
						<h3 class="card-title">Converted Amount</h3>
						<p class="card-value" id="convertedAmount">${convertedAmount}</p>
					</div>

					<!-- Fee Percentage -->
					<div class="card">
						<h3 class="card-title">Fee Rate</h3>
						<p class="card-value" id="feePercentage">${feePercentage}%</p>
					</div>

					<!-- Fee Amount -->
					<div class="card">
						<h3 class="card-title">Fee Amount</h3>
						<p class="card-value" id="feeAmount">${feeAmount}</p>
					</div>

					<!-- Final Amount -->
					<div class="final-card">
						<h3 class="final-card-title">Final Amount</h3>
						<p class="final-card-value" id="finalAmount">${finalAmount}</p>
					</div>
				</div>
			</div>
		</c:if>


		<!-- Transaction History Section (shown conditionally) -->
		<c:if test="${not empty exchangeHistory}">
			<div class="transaction-history">
				<h2 class="section-title">Transaction History</h2>
				<div class="table-container">
					<table class="transaction-table">
						<thead>
							<tr>
								<th>Date</th>
								<th>From</th>
								<th>To</th>
								<th>Original Amount</th>
								<th>Exchange Rate</th>
								<th>Final Amount</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${exchangeHistory}" var="exchange">
								<tr class="table-row">
									<td class="table-cell">${exchange.transactionDate}</td>
									<td class="table-cell">${exchange.fromCurrency}</td>
									<td class="table-cell">${exchange.toCurrency}</td>
									<td class="table-cell">${exchange.originalAmount}</td>
									<td class="table-cell">${exchange.exchangeRate}</td>
									<td class="table-cell">${exchange.finalAmount}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:if>


		<c:if test="${not empty error}">
			<div class="error-message">
				<div class="error-container">
					<div class="error-icon">
						<svg class="icon" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd"
								d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z"
								clip-rule="evenodd" />
                </svg>
					</div>
					<div class="error-message-text">
						<p class="error-text">${error}</p>
					</div>
				</div>
			</div>
		</c:if>
	</div>

	<footer>
		<jsp:include page="/WEB-INF/views/footer.jsp" />
	</footer>
	<script>
		
	</script>

</body>

</html>