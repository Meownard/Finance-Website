<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--=============== REMIXICONS ===============-->
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
	rel="stylesheet" />

</head>
<style>
/*=============== GOOGLE FONTS ===============*/
@import
	url("https://fonts.googleapis.com/css2?family=Montserrat+Alternates:wght@400;500&display=swap")
	;

/*=============== VARIABLES CSS ===============*/
:root {
	--header-height: 3.5rem;
	/*========== Colors ==========*/
	/*Color mode HSL(hue, saturation, lightness)*/
	--white-color: hsl(0, 0%, 100%);
	--black-color: hsl(0, 0%, 0%);
	/*========== Font and typography ==========*/
	/*.5rem = 8px | 1rem = 16px ...*/
	--body-font: "Montserrat Alternates", sans-serif;
	--h1-font-size: 1.5rem;
	--normal-font-size: .938rem;
	/*========== Font weight ==========*/
	--font-regular: 400;
	--font-medium: 500;
	/*========== z index ==========*/
	--z-tooltip: 10;
	--z-fixed: 100;
}

/*========== Responsive typography ==========*/
@media screen and (min-width: 1150px) {
	:root {
		--normal-font-size: 1rem;
	}
}

/*=============== BASE ===============*/
* {
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
}

/*=============== REUSABLE CSS CLASSES ===============*/
.header_container {
	max-width: 1120px;
	margin-inline: 1.5rem;
	height: 30px;
}

/*=============== HEADER & NAV ===============*/
.header {
	position: fixed;
	height: 3.5rem;
	width: 100%;
	top: 0;
	left: 0;
	background-color: #05104c;
	z-index: var(--z-fixed);
}

.nav {
	position: relative;
	height: var(--header-height);
	display: flex;
	justify-content: space-evenly;
	align-items: center;
	top: 1rem;
}

.nav__logo {
	color: var(--white-color);
	font-weight: var(--font-medium);
	white-space: nowrap;
}

.nav__close, .nav__toggle {
	display: flex;
	color: var(--white-color);
	font-size: 1.5rem;
	cursor: pointer;
}

.nav__button {
	display: flex; /* Center the button horizontally */
	width: 100%; /* Ensure it takes full width */
	margin-top: auto; /* Push the button to the bottom */
	align-items: center; /* Center vertically if needed */
}
/* Navigation Buttons Container */
.nav__buttons {
	display: flex;
	align-items: center;
	gap: 12px; /* Space between items */
	white-space: nowrap; /* Prevent wrapping */
}

/* Login Button */
.nav__button__sign {
	padding: 0.25rem 0.5rem; /* Adjusted padding */
	border-radius: 4px;
	font-size: 16px;
	font-weight: bold;
	text-decoration: none;
	transition: background-color 0.3s;
	min-width: 120px; /* Ensures both buttons have the same length */
	text-align: center; /* Center the text inside the button */
}

.nav__button__sign:hover {
	background-color: #a1b7c5;
}

/* Divider */
.divider {
	font-size: 20px;
	font-weight: bold;
	color: white;
	align-self: flex-start; /* Align the divider towards the top */
	/* Move it up */
}

/* Sign Up Button */
.nav__button-ghost {
	background-color: #007bff; /* Bright Blue */
	color: white;
	padding: 0.25rem 0.5rem; /* Adjusted padding */
	border-radius: 4px;
	font-size: 16px;
	font-weight: bold;
	text-decoration: none;
	transition: background-color 0.3s;
	min-width: 120px; /* Ensures both buttons have the same length */
	text-align: center; /* Center the text inside the button */
	border: none; /* Remove border */
}

.nav__button-ghost:hover {
	background-color: #0056b3; /* Darker Blue */
}

.nav__bar {
	position: relative;
	top: 0;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 2rem;
}

.nav__header {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.logout-form {
	display: flex;
	text-align: center;
	margin-top: auto; /* Push the button to the bottom */
	align-items: center; /* Center vertically if needed */
	justify-content: center;
}

.logout-button {
	background-color: #e11d48; /* Red */
	color: white;
	padding: 0.3rem 2rem; /* Adjusted padding */
	border-radius: 4px;
	border: none;
	font-size: 16px;
	cursor: pointer;
	min-width: 120px;
	transition: background-color 0.3s, transform 0.3s;
}

.logout-button:hover {
	background-color: #9b1c33; /* Darker red */
	transform: scale(1.05);
}

/* Navigation for mobile devices */
@media screen and (max-width: 1150px) {
	.logout-form {
		width: 100%;
	}
	.logout-button {
		padding: .75rem;
		min-width: 250px
	}
	.nav__button__sign, .nav__button-ghost {
		padding: .5rem;
		min-width: 250px;
	}
	.nav__buttons {
		flex-direction: column;
	}
	.divider {
		display: none; /* Hides the divider completely */
	}
	.nav__list {
		flex-grow: 1; /* Allow list to take up available space */
		display: flex;
		flex-direction: column;
		row-gap: 3rem;
	}
	.nav__header {
		align-items: flex-end;
		justify-content: center;
	}
	.nav__mobile {
		width: 100%;
		justify-content: space-between;
	}
	.header {
		height: 5rem;
	}
	.nav__menu {
		position: fixed;
		left: -100%;
		top: 0;
		background-color: var(--black-color);
		width: 100%;
		height: 100%;
		padding: 6rem 3.5rem 4.5rem;
		display: flex;
		flex-direction: column; /* Stack content vertically */
		align-items: flex-start; /* Align items to the left */
		justify-content: space-between;
		transition: left .8s;
		/* Ensure there's space between list and button */
	}
	.nav__item {
		transform: translateX(-150px);
		visibility: hidden;
		transition: transform .4s ease-out, visibility .4s;
	}
	.nav__item:nth-child(1) {
		transition-delay: .1s;
	}
	.nav__item:nth-child(2) {
		transition-delay: .2s;
	}
	.nav__item:nth-child(3) {
		transition-delay: .3s;
	}
	.nav__item:nth-child(4) {
		transition-delay: .4s;
	}
	.nav__item:nth-child(5) {
		transition-delay: .5s;
	}
}

.nav__list, .nav__social {
	display: flex;
}

.nav__list {
	flex-direction: column;
	row-gap: 3rem;
}

.nav__link {
	position: relative;
	color: var(--white-color);
	font-size: var(--h1-font-size);
	font-weight: var(--font-medium);
	display: inline-flex;
	align-items: center;
	transition: opacity .4s;
}

.nav__link i {
	font-size: 2rem;
	position: absolute;
	opacity: 0;
	visibility: hidden;
	transition: opacity .4s, visibility .4s;
}

.nav__link span {
	position: relative;
	transition: margin .4s;
}

.nav__link span::after {
	content: "";
	position: absolute;
	left: 0;
	bottom: -6px;
	width: 0;
	height: 2px;
	background-color: var(--white-color);
	transition: width .4s ease-out;
}

/* Animation link on hover */
.nav__link:hover span {
	margin-left: 2.5rem;
}

.nav__link:hover i {
	opacity: 1;
	visibility: visible;
}

.nav__link:hover span::after {
	width: 100%;
}

/* Sibling fade animation */
.nav__list:has(.nav__link:hover) .nav__link:not(:hover) {
	opacity: .4;
}

.nav__close {
	position: absolute;
	top: 1rem;
	right: 1.5rem;
}

.nav__social {
	column-gap: 1rem;
}

.nav__social-link {
	color: var(--white-color);
	font-size: 1.5rem;
	transition: transform .4s;
}

.nav__social-link:hover {
	transform: translateY(-.25rem);
}

/* Show menu */
.show-menu {
	left: 0;
}

/* Animation link when displaying menu */
.show-menu .nav__item {
	visibility: visible;
	transform: translateX(0);
}

/*=============== BREAKPOINTS ===============*/
/* For large devices */
@media screen and (min-width: 1150px) {
	.header_container {
		margin-inline: auto;
	}
	.nav {
		height: calc(var(--header-height)+ 2rem);
	}
	.nav__toggle, .nav__close {
		display: none;
	}
	.nav__link {
		font-size: var(--normal-font-size);
	}
	.nav__link i {
		font-size: 1.5rem;
	}
	.nav__list {
		width: 100%;
		flex-direction: row;
		column-gap: 3.5rem;
		justify-content: flex-end;
	}
	.nav__menu {
		width: 100%;
		display: flex;
		align-items: center;
		column-gap: 3.5rem;
	}
	.nav__button__sign {
		
	}
}
</style>

<!--==================== HEADER ====================-->
<header class="header" id="header">
	<nav class="nav header_container">
		<div class="nav__bar">
			<div class="nav__header nav__mobile">
				<div>
					<a href="#" class="nav__logo">Enomy Finances</a>
				</div>
				<!-- Toggle button -->
				<div class="nav__toggle" id="nav-toggle">
					<i class="ri-menu-line"></i>
				</div>
			</div>
			<div class="nav__menu" id="nav-menu">
				<ul class="nav__list">

					<sec:authorize access="isAnonymous()">
						<li class="nav__item"><a href="#" class="nav__link"> <i
								class="ri-arrow-right-up-line"></i> <span>Home</span>
						</a></li>

						<li class="nav__item"><a href="#about" href="about" class="nav__link"> <i
								class="ri-arrow-right-up-line"></i> <span>About Us</span>
						</a></li>
					</sec:authorize>

					<!-- Guest Navigation (For unauthenticated users) -->
					<%-- <sec:authorize access="isAnonymous()"> 
    <li class="nav__item"><a href="#" class="nav__link"> <i
            class="ri-arrow-right-up-line"></i> <span>Personal
            Banking</span>
    </a></li>

    <li class="nav__item"><a href="#" class="nav__link"> <i
            class="ri-arrow-right-up-line"></i> <span>Business
            Banking</span>
    </a></li>F

    <li class="nav__item"><a href="#" class="nav__link"> <i
            class="ri-arrow-right-up-line"></i> <span>Investments</span>
    </a></li>

    <li class="nav__item"><a href="#" class="nav__link"> <i
            class="ri-arrow-right-up-line"></i> <span>Insurance</span>
    </a></li>
</sec:authorize> --%>

					<sec:authorize access="hasRole('USER')">
						<li class="nav__item"><a href="/EnFinances/dashboard" class="nav__link"> <i
								class="ri-arrow-right-up-line"></i> <span>Dashboard</span>
						</a></li>

					</sec:authorize>


					<!-- Admin Navigation -->
					<sec:authorize access="hasRole('ADMIN')">
						<li class="nav__item"><a href="/EnFinances/adminpage" class="nav__link">
								<i class="ri-arrow-right-up-line"></i> <span>Admin
									Dashboard</span>
						</a></li>
					</sec:authorize>

					<!-- Authenticated User Navigation (For logged-in users with ROLE_USER) -->
					<sec:authorize access="hasAnyRole('USER', 'ADMIN')">
						<li class="nav__item"><a href="/EnFinances/currencyexchange"
							class="nav__link"> <i class="ri-arrow-right-up-line"></i> <span>Curency
									Exchange</span>
						</a></li>
						<li class="nav__item"><a href="/EnFinances/savingsandinvestments" class="nav__link">
								<i class="ri-arrow-right-up-line"></i> <span>Saving and
									Investment Plans</span>
						</a></li>
					</sec:authorize>
				</ul>


				<sec:authorize access="isAnonymous()">
					<div class="nav__button nav__header">
						<div class="nav__buttons">
							<a href="/EnFinances/login"><button class="nav__button__sign">Log
									In</button></a> <span class="divider">|</span> <a
								href="/EnFinances/registerUser"><button
									class="nav__button__sign nav__button-ghost">Sign Up</button></a>
						</div>
					</div>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<form:form action="logout" method="post" class="logout-form">

						<button type="submit" class="logout-button">Logout</button>

					</form:form>
				</sec:authorize>




				<!-- Close button -->
				<div class="nav__close" id="nav-close">
					<i class="ri-close-large-line"></i>
				</div>
			</div>

		</div>
	</nav>

</header>

<!--=============== MAIN JS ===============-->
<script>
/*=============== SHOW MENU ===============*/
const navMenu = document.getElementById('nav-menu'),
      navToggle = document.getElementById('nav-toggle'),
      navClose = document.getElementById('nav-close');

/* Menu show */
if(navToggle){
   navToggle.addEventListener('click', () =>{
      navMenu.classList.add('show-menu');
      document.body.style.overflow = 'hidden';  // Disable scrolling
   });
}

/* Menu hidden */
if(navClose){
   navClose.addEventListener('click', () =>{
      navMenu.classList.remove('show-menu');
      document.body.style.overflow = 'auto';  // Enable scrolling again
   });
}
      </script>
