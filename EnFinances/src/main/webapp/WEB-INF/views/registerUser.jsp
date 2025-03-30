<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="styless.css" rel="stylesheet">
<!--=============== REMIXICONS ===============-->
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
	rel="stylesheet" />
<title>Registration - Enomy Finances</title>
</head>

<style>
@charset "UTF-8";
/*=============== GOOGLE FONTS ===============*/
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap")
	;

/*=============== VARIABLES CSS ===============*/
:root {
	--first-color: hsl(244, 75%, 57%);
	--second-color: hsl(249, 64%, 47%);
	--title-color: hsl(244, 12%, 12%);
	--text-color: hsl(244, 4%, 36%);
	--body-color: hsl(208, 97%, 85%);
	--body-font: "Poppins", sans-serif;
	--h2-font-size: 1.25rem;
	--small-font-size: .813rem;
	--smaller-font-size: .75rem;
	--font-medium: 500;
	--font-semi-bold: 600;
}

@media screen and (min-width: 1024px) {
	:root {
		--h2-font-size: 1.75rem;
		--normal-font-size: 1rem;
		--small-font-size: .875rem;
		--smaller-font-size: .813rem;
	}
}

/*=============== BASE ===============*/
* {
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}

body {
	background-color: var(--body-color);
	font-family: var(--body-font);
	color: var(--text-color);
}

input, button {
	font-family: var(--body-font);
	border: none;
	outline: none;
}

img {
	max-width: 100%;
	height: auto;
}

/*=============== FORM STYLES ===============*/
.container {
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 6rem 1rem;
	flex-direction: column;
}

.form-container {
	background-color: hsla(244, 16%, 92%, 0.6);
	border: 2px solid hsla(244, 16%, 92%, 0.75);
	padding: 2rem;
	border-radius: 1rem;
	backdrop-filter: blur(20px);
	width: 100%;
	max-width: 500px;
	box-shadow: 0 6px 24px rgba(0, 0, 0, 0.1);
	margin-bottom: 2rem;
}

.header_register {
	text-align: center;
	margin-bottom: 1.5rem;
}

.title span {
	color: #4a3fe4;
}

.title {
	color: var(--title-color);
	font-size: var(--h2-font-size);
	margin-bottom: 0.5rem;
}

.description {
	font-size: var(--small-font-size);
}

.form-grid {
	display: grid;
	gap: 1rem;
}

.form-group {
	display: flex;
	flex-direction: column;
}

.label {
	color: var(--title-color);
	font-size: var(--small-font-size);
	font-weight: var(--font-semi-bold);
	margin-bottom: 0.25rem;
}

.input {
	width: 100%;
	padding: 14px 12px;
	border-radius: 6px;
	border: 2px solid var(--text-color);
	background-color: hsla(244, 16%, 92%, 0.6);
	color: var(--title-color);
	font-size: var(--smaller-font-size);
	font-weight: var(--font-medium);
	transition: border 0.4s;
}

.input::placeholder {
	color: var(--text-color);
}

.input:focus, .input:valid {
	border: 2px solid var(--first-color);
}

.password-group {
	position: relative;
}

.show-password {
	display: flex;
	align-items: center;
	font-size: var(--small-font-size);
	margin-top: 0.5rem;
}

.submit-section {
	text-align: center;
	margin-top: 1.5rem;
	grid-column: span 2;
}

.submit-button {
	width: 100%;
	padding: 14px 2rem;
	border-radius: 6px;
	background: linear-gradient(180deg, var(--first-color),
		var(--second-color));
	color: #fff;
	font-size: var(--small-font-size);
	font-weight: var(--font-semi-bold);
	box-shadow: 0 6px 24px hsla(244, 75%, 48%, 0.5);
	cursor: pointer;
}

.login-link {
	font-size: var(--smaller-font-size);
	font-weight: var(--font-semi-bold);
	color: var(--first-color);
	text-decoration: none;
	margin-top: 1rem;
	display: block;
}

.error-text {
	color: red;
	font-size: var(--smaller-font-size);
	margin-top: 0.25rem;
}

.login__eye {
	width: max-content;
	height: max-content;
	position: absolute;
	right: 0.75rem;
	top: 0;
	bottom: 0;
	margin: auto 0;
	font-size: 1.25rem;
	cursor: pointer;
}

.footer {
	text-align: center;
	padding: 1rem 0;
	font-size: var(--small-font-size);
	color: var(--text-color);
}

.error-message {
  background-color: #fef2f2;
  border: 1px solid #fca5a5;
  color: #b91c1c;
  padding: 0.75rem 1rem;
  border-radius: 0.375rem;
  position: relative;
  font-size: 1rem;
}

/* Responsive Design */
@media screen and (max-width: 525px) {
	.form-container {
		padding: 1rem;
		max-width: 100%;
	}
	.form-grid {
		display: inline;
		grid-template-columns: 1fr;
	}
}

@media screen and (min-width: 1024px) {
	.form-container {
		max-width: 600px;
	}
}
</style>


<body>
	<nav>
		<jsp:include page="/WEB-INF/views/header.jsp" />
	</nav>
	<div class="container">
		<div class="form-container">
			<form action="registerUser" method="post" class="form"
				onsubmit="return validatePasswords()">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />

				<!-- Header -->
				<div class="header_register">
					<h1 class="title">
						Sign Up To <span>Enomy Finances</span>
					</h1>
					<p class="description">Take charge of your financial future
						with Enomy Finances. Join us today and start your journey toward
						financial empowerment and security. Together, we can create a
						brighter tomorrow!</p>
				</div>

				<!-- Form Grid -->
				<div class="form-grid">
					<!-- First Name -->
					<div class="form-group">
						<label for="firstName" class="label">First Name</label> <input
							type="text" id="firstName" name="fname" class="input"
							maxlength="50" required> <span id="errorFirstName"
							class="error-text"></span>
					</div>

					<!-- Last Name -->
					<div class="form-group">
						<label for="lastName" class="label">Last Name</label> <input
							type="text" id="lastName" name="lname" class="input"
							maxlength="50" required> <span id="errorLastName"
							class="error-text"></span>
					</div>

					<!-- Email -->
					<div class="form-group">
						<label for="email" class="label">Email</label> <input type="email"
							id="email" name="email" class="input" required> <span
							id="errorEmail" class="error-text"></span>
					</div>

					<!-- Contact Number -->
					<div class="form-group">
						<label for="contactNumber" class="label">Contact Number</label> <input
							type="tel" id="contactNumber" name="contactNumber" class="input"
							placeholder="+63" pattern="\+63\d{10}" maxlength="13" required>
						<span id="errorContactNumber" class="error-text"></span>
					</div>

					<!-- Password -->
					<div class="form-group">
						<label for="password" class="label">Password</label>
						<div class="password-group">
							<input type="password" id="password" name="password"
								class="input" minlength="8" required> <i
								class="ri-eye-off-line login__eye" id="input-icon-password"></i>
						</div>
						<span id="errorPassword" class="error-text"></span>
					</div>

					<!-- Confirm Password -->
					<div class="form-group">
						<label for="confirmPassword" class="label">Confirm
							Password</label>
						<div class="password-group">
							<input type="password" id="confirmPassword"
								name="confirmPassword" class="input" required> <i
								class="ri-eye-off-line login__eye"
								id="input-icon-confirmPassword"></i>
						</div>
						<span id="errorConfirmPassword" class="error-text"></span>
					</div>



					<!-- Submit Button -->
					<div class="submit-section">
						<button type="submit" class="submit-button">Register</button>
						<p class="login-link">
							Already have an Account? <a href="login" class="login-link-text">Back
								to login</a>
						</p>
					</div>

					<!-- Error Message -->
					<%
					if (request.getAttribute("error") != null) {
					%>
					<div class="error-message">
						<%=request.getAttribute("error")%>
					</div>
					<%
					}
					%>


				</div>
			</form>
		</div>
	</div>
	<footer>
		<jsp:include page="/WEB-INF/views/footer.jsp" />
	</footer>
</body>

<script>
  /*=============== SHOW HIDDEN - PASSWORD ===============*/
const showHiddenPass = (password, inputicon) => {
   const input = document.getElementById(password),
         iconEye = document.getElementById(inputicon);
         
   iconEye.addEventListener('click', () => {
       // Toggle between password and text
       if (input.type === 'password') {
           input.type = 'text';
           iconEye.classList.add('ri-eye-line');
           iconEye.classList.remove('ri-eye-off-line');
       } else {
           input.type = 'password';
           iconEye.classList.remove('ri-eye-line');
           iconEye.classList.add('ri-eye-off-line');
       }
   });
}

// Apply function to password and confirm password
showHiddenPass('password', 'input-icon-password');
showHiddenPass('confirmPassword', 'input-icon-confirmPassword');


    // Validate passwords
    function validatePasswords() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        var errorPassword = document.getElementById("errorPassword");
        var errorConfirmPassword = document.getElementById("errorConfirmPassword");

        // Clear previous error messages
        errorPassword.textContent = "";
        errorConfirmPassword.textContent = "";

        // Check if passwords match
        if (password !== confirmPassword) {
            errorPassword.textContent = "Passwords do not match.";
            errorConfirmPassword.textContent = "Passwords do not match.";
            return false;  // Prevent form submission
        }

        return true;  // Allow form submission
    }
</script>


</html>