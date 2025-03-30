<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--=============== REMIXICONS ===============-->
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
	rel="stylesheet" />

<title>Enomy Finances</title>
</head>

<style>
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap")
	;

:root {
	--primary-color: hsl(244, 75%, 57%);
	--primary-color-dark: #3228C1;
	--text-dark: #18181b;
	--text-light: #6b7280;
	--white: #ffffff;
	--max-width: 1200px;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: "Montserrat Alternates", Poppins, sans-serif;
	background: #c4e3ff;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
}

.section__container {
	max-width: var(--max-width);
	margin: auto;
	padding: 5rem 1rem;
}

.section__header {
	margin-bottom: 1rem;
	font-size: 2.5rem;
	font-weight: 700;
	line-height: 3rem;
	color: hsl(244, 75%, 57%);
	text-align: center;
}

.section__description {
	color: var(--text-dark);
	line-height: 1.75rem;
	text-align: center;
}

.btn {
	padding: 0.75rem 1.5rem;
	outline: none;
	border: none;
	white-space: nowrap;
	font-size: 1rem;
	color: var(--white);
	background-color: var(--primary-color);
	border-radius: 10px;
	transition: 0.3s;
	cursor: pointer;
}

.btn:hover {
	background-color: var(--primary-color-dark);
}

.logo a {
	font-size: 1.5rem;
	font-weight: 700;
	color: var(--primary-color);
}

.logo a span {
	color: var(--text-dark);
}

img {
	display: flex;
	width: 100%;
}

a {
	text-decoration: none;
	transition: 0.3s;
}

ul {
	list-style: none;
}

html, body {
	scroll-behavior: smooth;
}

body {
	font-family: "Poppins", sans-serif;
}

.header__container {
	display: grid;
	gap: 2rem;
	overflow: hidden;
}

.header__image img {
	max-width: 600px;
	margin-inline: auto;
}

.header__content h1 {
	margin-bottom: 1rem;
	font-size: 3.5rem;
	font-weight: 700;
	line-height: 4.5rem;
	color: var(--text-dark);
	text-align: center;
}

.header__content h1 span {
	color: var(--primary-color);
}

.header__content .section__description {
	margin-bottom: 2rem;
}

.header__btn {
	text-align: center;
}

.special__container :is(.section__header, .section__description) {
	max-width: 600px;
	margin-inline: auto;
}

.special__grid {
	margin-top: 4rem;
	display: grid;
	gap: 1rem;
}

.special__card {
	background-color: white;
	padding: 1rem;
	text-align: center;
	border-radius: 2rem;
	transition: 0.3s;
}

.special__card:hover {
	box-shadow: 10px 10px 40px rgba(0, 0, 0, 0.1);
}

.special__card img {
	max-width: 200px;
	margin-inline: auto;
	margin-bottom: 1rem;
	filter: drop-shadow(10px 10px 20px rgba(0, 0, 0, 0.3));
}

.special__card h4 {
	margin-bottom: 0.5rem;
	font-size: 1.5rem;
	font-weight: 700;
	color: var(--text-dark);
}

.special__card p {
	margin-bottom: 0.5rem;
	color: var(--text-light);
	line-height: 1.75rem;
}

.special__ratings {
	margin-bottom: 1rem;
	font-size: 1rem;
	color: goldenrod;
}

.special__footer {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
}

.special__footer .price {
	font-size: 1.2rem;
	font-weight: 600;
	color: var(--text-dark);
}

@media ( width > 540px) {
	.special__grid {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( width > 768px) {
	.header__container {
		grid-template-columns: 2fr 2fr;
		align-items: center;
	}
	.header__content h1, .header__content .section__description,
		.header__btn {
		text-align: left;
	}
	.header__image {
		grid-area: 1/2/2/2;
	}
	.special__grid {
		grid-template-columns: repeat(3, 1fr);
	}
}

@media ( width > 1024px) {
	.special__grid {
		gap: 2rem;
	}
	.special__card {
		padding: 2rem;
		border-radius: 3rem;
	}
}
</style>

<body>

	<jsp:include page="/WEB-INF/views/header.jsp" />

	<header class="section__container header__container" id="home">
		<div class="header__image">
			<img src="<c:url value='/images/currency-head.png'/>" alt="header" />
		</div>
		<div class="header__content">
			<h1>
				Meet, Eat & Enjoy The <span>True Taste</span>.
			</h1>
			<p class="section__description">Discover the true essence of
				culinary delight as you meet, eat, and savor the authentic flavors
				that define our passion for food.</p>
			<div class="header__btn">
				<a href="/EnFinances/registerUser">
					<button class="btn">Get Started</button>
				</a>
			</div>
		</div>
	</header>

	<section class="section__container special__container" id="about">
		<h2 class="section__header">Our Specialties</h2>
		<p class="section__description">Your Trusted Partner in Financial
			Growth and Security.</p>
		<div class="special__grid">
			<div class="special__card">
				<h4>Currency Conversion Services</h4>
				<p>Real-time currency conversion with secure transactions and
					up-to-date exchange rates, offering transaction limits for user
					protection.</p>
				<div class="special__ratings">
					<span><i class="ri-star-fill"></i></span> <span><i
						class="ri-star-fill"></i></span> <span><i class="ri-star-fill"></i></span>
					<span><i class="ri-star-fill"></i></span> <span><i
						class="ri-star-fill"></i></span>
				</div>
				<div class="special__footer">
					<button class="btn">EXCHANGE</button>
				</div>
			</div>
			<div class="special__card">
				<h4>Personalized Savings & Investment Plans</h4>
				<p>Customized investment quotes with clear projections, tax
					details, and fees, tailored to users' financial goals and
					investment duration.</p>
				<div class="special__ratings">
					<span><i class="ri-star-fill"></i></span> <span><i
						class="ri-star-fill"></i></span> <span><i class="ri-star-fill"></i></span>
					<span><i class="ri-star-fill"></i></span> <span><i
						class="ri-star-fill"></i></span>
				</div>
				<div class="special__footer">
					<button class="btn">INVEST</button>
				</div>
			</div>
			<div class="special__card">
				<h4>Secure Client Data Management</h4>
				<p>Robust data security with encryption for client information,
					ensuring confidentiality and easy, secure access through login
					systems.</p>
				<div class="special__ratings">
					<span><i class="ri-star-fill"></i></span> <span><i
						class="ri-star-fill"></i></span> <span><i class="ri-star-fill"></i></span>
					<span><i class="ri-star-fill"></i></span> <span><i
						class="ri-star-fill"></i></span>
				</div>
				<div class="special__footer">
					<button class="btn">SECURITY</button>
				</div>
			</div>
		</div>
	</section>


	<jsp:include page="/WEB-INF/views/footer.jsp" />
	<!--=============== MAIN JS ===============-->
	<script>
		
	</script>
</body>
</html>