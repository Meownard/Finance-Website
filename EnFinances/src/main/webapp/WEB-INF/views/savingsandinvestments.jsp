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
<title>Savings & Investments - Enomy Finances</title>
</head>

<style>

* {
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}
/* General Styles */
body {
	font-family: "Montserrat Alternates", Poppins, sans-serif;
	background: #c4e3ff;
	margin: 0;
	padding: 0;
}

.container {
	width: 90%;
	max-width: 800px;
	margin: 5.5rem auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Title & Subtitle */
.title {
	font-size: 24px;
	font-weight: bold;
	color: #333;
	text-align: center;
}

.subtitle {
	font-size: 16px;
	text-align: center;
	color: #666;
	margin-bottom: 20px;
}

/* Form Styling */
.form-container {
	padding: 20px;
	background-color: #f1f5f9;
	border-radius: 8px;
}

.form-grid {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.input-group {
	display: flex;
	flex-direction: column;
}

.input-group label {
	font-weight: bold;
	color: #333;
	margin-bottom: 5px;
}

.input-field {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 14px;
}

/* Info Card */
.info-card {
	background-color: #e3f2fd;
	padding: 15px;
	border-left: 4px solid #2196f3;
	border-radius: 6px;
	font-size: 14px;
}

.info-card h3 {
	margin: 0 0 10px;
}

.info-list {
	list-style: none;
	padding: 0;
	margin: 0;
}

.info-list li {
	margin-bottom: 5px;
}

/* Submit Button */
.button-container {
	text-align: center;
}

.submit-btn {
	background-color: #007bff;
	color: #fff;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

.submit-btn:hover {
	background-color: #0056b3;
}

/* Investment Projection */
.investment-container {
	margin-top: 20px;
	padding: 20px;
	background-color: #f8f9fa;
	border-radius: 8px;
}

.investment-title {
	font-size: 20px;
	font-weight: bold;
	text-align: center;
}

.investment-section {
	margin-top: 15px;
	padding: 15px;
	background-color: #fff;
	border-radius: 6px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.investment-subtitle {
	font-size: 18px;
	font-weight: bold;
}

.investment-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 15px;
}

.investment-box {
	background-color: #f1f5f9;
	padding: 15px;
	border-radius: 6px;
	text-align: center;
}

.investment-label {
	font-size: 14px;
	color: #555;
}

.investment-value {
	font-size: 18px;
	font-weight: bold;
	color: #333;
}

.investment-range {
	font-size: 16px;
	font-weight: bold;
	color: #007bff;
}

/* Save Investment Button */
.save-investment-container {
	text-align: center;
	margin-top: 20px;
}

.save-investment-button {
	display: inline-flex;
	align-items: center;
	background-color: #28a745;
	color: #fff;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
}

.save-investment-button:hover {
	background-color: #218838;
}

.save-icon {
	width: 20px;
	height: 20px;
	margin-right: 5px;
}

/* Success & Error Messages */
.success-container {
    margin-top: 1rem;
}

.success-box {
    background-color: #f0fdf4;
    border-left: 4px solid #34d399;
    padding: 1rem;
}

.flex {
    display: flex;
}

.success-icon {
    flex-shrink: 0;
}

.success-message {
    margin-left: 0.75rem;
}

.success-text {
    font-size: 0.875rem;
    color: #047857;
}

.success-icon-svg {
    height: 1.25rem;
    width: 1.25rem;
    color: #34d399;
}

.error-container {
	margin-top: 1rem;
}

.error-box {
	background-color: #fef2f2;
	border-left: 4px solid #f87171;
	padding: 1rem;
}

.error-icon {
	flex-shrink: 0;
}

.error-message {
	margin-left: 0.75rem;
}

.error-text {
	font-size: 0.875rem;
	color: #b91c1c;
}

.error-icon-svg {
	height: 1.25rem;
	width: 1.25rem;
	color: #f87171;
}

/* Responsive */
@media (max-width: 600px) {
	.investment-grid {
		grid-template-columns: 1fr;
	}
}

}
</style>

<body class="page-bg">
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<!-- Savings & Investment Content -->
	<div class="container">
		<!-- Title Section -->
		<div class="content-box">
			<h1 class="title">Savings & Investments</h1>
			<p class="subtitle">Plan your financial future with our
				investment options</p>
		</div>

		<!-- Investment Form -->
		<div class="form-container">
			<form:form action="calculate-investment" method="POST"
				class="form-grid">
				<!-- Investment Type -->
				<div class="input-group">
					<label>Investment Type</label> <select name="investmentType"
						class="input-field">
						<option value="BASIC">Basic Savings Plan</option>
						<option value="PLUS">Savings Plan Plus</option>
						<option value="MANAGED">Managed Stock Investments</option>
					</select>
				</div>

				<!-- Initial Investment -->
				<div class="input-group">
					<label>Initial Lump Sum</label> <input type="number"
						name="initialInvestment" min="0" step="50" required
						class="input-field">
				</div>

				<!-- Monthly Investment -->
				<div class="input-group">
					<label>Monthly Investment</label> <input type="number"
						name="monthlyInvestment" min="50" step="50" required
						class="input-field">
				</div>

				<!-- Investment Info Card -->
				<div class="info-card">
					<h3>Investment Plans Information</h3>
					<ul class="info-list">
						<li>✔ Basic Plan: 1.2% - 2.4% returns</li>
						<li>✔ Plus Plan: 3% - 5.5% returns</li>
						<li>✔ Managed Stocks: 4% - 23% returns</li>
					</ul>
				</div>

				<!-- Submit Button -->
				<div class="button-container">
					<button type="submit" class="submit-btn">Calculate
						Investment</button>
				</div>
			</form:form>
		</div>

		<c:if test="${not empty oneYearMin}">
			<div class="investment-container">
				<h2 class="investment-title">Investment Projections</h2>

				<!-- 1 Year Projection -->
				<div class="investment-section">
					<h3 class="investment-subtitle">1 Year Projection</h3>
					<div class="investment-grid">
						<div class="investment-box">
							<h4 class="investment-label">Minimum Return</h4>
							<p class="investment-value">
								£
								<fmt:formatNumber value="${oneYearMin}" pattern="#,##0.00" />
							</p>
							<p class="investment-label">
								Tax: £
								<fmt:formatNumber value="${oneYearMinTax}" pattern="#,##0.00" />
							</p>
						</div>
						<div class="investment-box">
							<h4 class="investment-label">Maximum Return</h4>
							<p class="investment-value">
								£
								<fmt:formatNumber value="${oneYearMax}" pattern="#,##0.00" />
							</p>
							<p class="investment-label">
								Tax: £
								<fmt:formatNumber value="${oneYearMaxTax}" pattern="#,##0.00" />
							</p>
						</div>
						<div class="investment-box">
							<h4 class="investment-label">Total Fees</h4>
							<p class="investment-value">
								£
								<fmt:formatNumber value="${oneYearFees}" pattern="#,##0.00" />
							</p>
						</div>
						<div class="investment-box">
							<h4 class="investment-label">Total Profit Range</h4>
							<p class="investment-range">
								£
								<fmt:formatNumber value="${oneYearMinProfit}" pattern="#,##0.00" />
								to £
								<fmt:formatNumber value="${oneYearMaxProfit}" pattern="#,##0.00" />

							</p>
						</div>
					</div>
				</div>

				<!-- 5 Year Projection -->
				<div class="investment-section">
					<h3 class="investment-subtitle">5 Year Projection</h3>
					<div class="investment-grid">
						<div class="investment-box">
							<h4 class="investment-label">Minimum Return</h4>
							<p class="investment-value">
								£
								<fmt:formatNumber value="${fiveYearMin}" pattern="#,##0.00" />
							</p>
							<p class="investment-label">
								Tax: £
								<fmt:formatNumber value="${fiveYearMinTax}" pattern="#,##0.00" />
							</p>
						</div>
						<div class="investment-box">
							<h4 class="investment-label">Maximum Return</h4>
							<p class="investment-value">
								£
								<fmt:formatNumber value="${fiveYearMax}" pattern="#,##0.00" />
							</p>
							<p class="investment-label">
								Tax: £
								<fmt:formatNumber value="${fiveYearMaxTax}" pattern="#,##0.00" />
							</p>
						</div>
						<div class="investment-box">
							<h4 class="investment-label">Total Fees</h4>
							<p class="investment-value">
								£
								<fmt:formatNumber value="${fiveYearFees}" pattern="#,##0.00" />
							</p>
						</div>
						<div class="investment-box">
							<h4 class="investment-label">Total Profit Range</h4>
							<p class="investment-range">
								£
								<fmt:formatNumber value="${fiveYearMinProfit}"
									pattern="#,##0.00" />
								to £
								<fmt:formatNumber value="${fiveYearMaxProfit}"
									pattern="#,##0.00" />
							</p>
						</div>
					</div>
				</div>

				<!-- 10 Year Projection -->
				<div class="investment-section">
					<h3 class="investment-subtitle">10 Year Projection</h3>
					<div class="investment-grid">
						<div class="investment-box">
							<h4 class="investment-label">Minimum Return</h4>
							<p class="investment-value">
								£
								<fmt:formatNumber value="${tenYearMin}" pattern="#,##0.00" />
							</p>
							<p class="investment-label">
								Tax: £
								<fmt:formatNumber value="${tenYearMinTax}" pattern="#,##0.00" />
							</p>
						</div>
						<div class="investment-box">
							<h4 class="investment-label">Maximum Return</h4>
							<p class="investment-value">
								£
								<fmt:formatNumber value="${tenYearMax}" pattern="#,##0.00" />
							</p>
							<p class="investment-label">
								Tax: £
								<fmt:formatNumber value="${tenYearMaxTax}" pattern="#,##0.00" />
							</p>
						</div>
						<div class="investment-box">
							<h4 class="investment-label">Total Fees</h4>
							<p class="investment-value">
								£
								<fmt:formatNumber value="${tenYearFees}" pattern="#,##0.00" />
							</p>
						</div>
						<div class="investment-box">
							<h4 class="investment-label">Total Profit Range</h4>
							<p class="investment-range">
								£
								<fmt:formatNumber value="${tenYearMinProfit}" pattern="#,##0.00" />
								to £
								<fmt:formatNumber value="${tenYearMaxProfit}" pattern="#,##0.00" />
							</p>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${showSaveButton}">
			<div class="save-investment-container">
				<form action="save-investment" method="POST"
					class="save-investment-form">
					<input type="hidden" name="investmentType"
						value="${param.investmentType}"> <input type="hidden"
						name="initialInvestment" value="${param.initialInvestment}">
					<input type="hidden" name="monthlyInvestment"
						value="${param.monthlyInvestment}">
					<button type="submit" class="save-investment-button">
						<svg class="save-icon" fill="none" stroke="currentColor"
							viewBox="0 0 24 24">
                            <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                        </svg>
						Save Investment
					</button>
				</form>
			</div>
		</c:if>
		<!-- Success Message -->
		<c:if test="${not empty success}">
			<div class="success-container">
				<div class="success-box">
					<div class="flex">
						<div class="success-icon">
							<svg class="success-icon-svg" viewBox="0 0 20 20"
								fill="currentColor">
                        <path fill-rule="evenodd"
									d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
									clip-rule="evenodd" />
                    </svg>
						</div>
						<div class="success-message">
							<p class="success-text">${success}</p>
						</div>
					</div>
				</div>
			</div>
		</c:if>


		<!-- Error Message -->
		<c:if test="${not empty error}">
			<div class="error-container">
				<div class="error-box">
					<div class="flex">
						<div class="error-icon">
							<svg class="error-icon-svg" viewBox="0 0 20 20"
								fill="currentColor">
                        <path fill-rule="evenodd"
									d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z"
									clip-rule="evenodd" />
                    </svg>
						</div>
						<div class="error-message">
							<p class="error-text">${error}</p>
						</div>
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