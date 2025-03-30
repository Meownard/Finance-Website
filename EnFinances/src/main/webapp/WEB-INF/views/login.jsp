<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
@charset "UTF-8";

/*=============== GOOGLE FONTS ===============*/
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap")
	;
/*=============== VARIABLES CSS ===============*/
:root {
	/*========== Colors ==========*/
	/*Color mode HSL(hue, saturation, lightness)*/
	--first-color: hsl(244, 75%, 57%);
	--second-color: hsl(249, 64%, 47%);
	--title-color: hsl(244, 12%, 12%);
	--text-color: hsl(244, 4%, 36%);
	--body-color: hsl(208, 97%, 85%);
	/*========== Font and typography ==========*/
	/*.5rem = 8px | 1rem = 16px ...*/
	--body-font: "Poppins", sans-serif;
	--h2-font-size: 1.25rem;
	--small-font-size: .813rem;
	--smaller-font-size: .75rem;
	/*========== Font weight ==========*/
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

.container {
	
}

img {
	max-width: 100%;
	height: auto;
}

/*=============== LOGIN FORM ===============*/
.login__content, .login__form, .login__inputs {
	display: grid;
}

.login__content {
	position: relative;
	height: 100vh;
	align-items: center;
}

.login__img {
	margin-top: 4rem;
	margin-bottom: 2rem;
	position: absolute;
	width: 100%;
	height: 87%;
	object-fit: cover;
	object-position: center;
}

.login__form {
	margin-top: 2rem;
	position: relative;
	background-color: hsla(244, 16%, 92%, 0.6);
	border: 2px solid hsla(244, 16%, 92%, 0.75);
	margin-inline: 1.5rem;
	row-gap: 1.25rem;
	backdrop-filter: blur(20px);
	padding: 2rem;
	border-radius: 1rem;
}

.login__title {
	color: var(--title-color);
	font-size: var(--h2-font-size);
	margin-bottom: 0.5rem;
}

.login__title span {
	color: var(--first-color);
}

.login__description {
	font-size: var(--small-font-size);
}

.login__inputs {
	row-gap: 0.75rem;
	margin-bottom: 0.5rem;
}

.login__label {
	display: block;
	color: var(--title-color);
	font-size: var(--small-font-size);
	font-weight: var(--font-semi-bold);
	margin-bottom: 0.25rem;
}

.login__input {
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

.login__input::placeholder {
	color: var(--text-color);
}

.login__input:focus, .login__input:valid {
	border: 2px solid var(--first-color);
}

.login__box {
	position: relative;
}

.login__box .login__input {
	padding-right: 36px;
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

.login__check {
	display: flex;
	column-gap: 0.5rem;
	align-items: center;
}

.login__check-input {
	appearance: none;
	width: 16px;
	height: 16px;
	border: 2px solid var(--text-color);
	background-color: hsla(244, 16%, 92%, 0.2);
	border-radius: 0.25rem;
}

.login__check-input:checked {
	background: var(--first-color);
}

.login__check-input:checked::before {
	content: "✔";
	display: block;
	color: #fff;
	font-size: 0.75rem;
	transform: translate(1.5px, -2.5px);
}

.login__check-label {
	font-size: var(--small-font-size);
}

.login__buttons {
	display: flex;
	column-gap: 0.75rem;
	justify-content: space-evenly;
}

.login__button {
	width: 100%;
	padding: 14px 2rem;
	border-radius: 6px;
	background: linear-gradient(180deg, var(--first-color),
		var(--second-color));
	color: #fff;
	font-size: var(--small-font-size);
	font-weight: var(--font-semi-bold);
	box-shadow: 0 6px 24px hsla(244, 75%, 48%, 0.5);
	margin-bottom: 1rem;
	cursor: pointer;
	border: 2px solid var(--first-color);
	white-space: nowrap;
}

.login__button-ghost {
	background: hsla(244, 16%, 92%, 0.6);
	color: var(--first-color);
	box-shadow: none;
}

.login__forgot {
	font-size: var(--smaller-font-size);
	font-weight: var(--font-semi-bold);
	color: var(--first-color);
	text-decoration: none;
}

/* Error Message Styles */
.error-message {
    background-color: #fecaca; /* Light red background */
    border: 1px solid #f87171; /* Red border */
    color: #b91c1c; /* Red text color */
    padding: 0.75rem 1rem; /* Padding around the message */
    border-radius: 0.375rem; /* Rounded corners */
    margin-bottom: 1rem; /* Space below the error message */
    display: flex;
    align-items: center;
    animation: fade-in 0.5s ease-in-out;
    transition: opacity 1s ease-out; /* Smooth transition to fade out */
}

/* Error Icon */
.error-icon {
    width: 20px;
    height: 20px;
    margin-right: 0.5rem; /* Space between icon and text */
}

/* Error Text */
.error-text {
    font-size: 1rem;
    display: inline-block;
}

/* Fade-in animation */
@keyframes fade-in {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}


}
.login-form {
	display: flex;
	flex-direction: column;
	gap: 1.5rem;
}

/*=============== BREAKPOINTS ===============*/
/* For small devices */
@media screen and (max-width: 360px) {
	.login__buttons {
		flex-direction: column;
	}
	.login__img {
		margin-top: 5rem;
	}
	.login__form {
		margin-top: 4rem;
		margin-bottom: 2rem;
	}
}

@media screen and (min-width: 425px) {
	.login__button {
		padding: 14px 3rem;
	}
}

@media screen and (min-width: 475px) {
	.login__button {
		padding: 14px 3.8rem;
	}
}

@media screen and (min-width: 768px) {
	.login__button {
		padding: 14px 4rem;
	}
}
/* For medium devices */
@media screen and (min-width: 576px) {
	.login__form {
		width: 450px;
		justify-self: center;
	}
}
/* For large devices */
@media screen and (min-width: 1064px) {
	.container {
		height: 100vh;
		display: grid;
		place-items: center;
	}
	.login__content {
		width: 1024px;
		height: 600px;
	}
	.login__img {
		border-radius: 3.5rem;
		box-shadow: 0 24px 48px hsla(244, 75%, 36%, 0.45);
	}
	.login__form {
		justify-self: flex-end;
		margin-right: 4.5rem;
	}
}

@media screen and (min-width: 1200px) {
	.login__button {
		padding: 14px 3.25rem;
	}
	.login__content {
		height: 700px;
	}
	.login__form {
		row-gap: 2rem;
		padding: 1rem;
		border-radius: 1.25rem;
		border: 2.5px solid hsla(244, 16%, 92%, 0.75);
	}
	.login__description, .login__label, .login__button {
		font-size: var(--normal-font-size);
	}
	.login__inputs {
		row-gap: 1.25rem;
		margin-bottom: 0.75rem;
	}
	.login__input {
		border: 2.5px solid var(--text-color);
		padding: 1rem;
		font-size: var(--small-font-size);
	}
	.login__input:focus, .login__input:valid {
		border: 2.5px solid var(--first-color);
	}
	.login__button {
		padding-block: 1rem;
		margin-bottom: 1.25rem;
	}
	.login__button-ghost {
		border: 2.5px solid var(--first-color);
	}
}
</style>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp" />

	<form:form action="login" method="post" class="login-form">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

		<div class="container">
			<div class="login__content">
				<img src="<c:url value='/images/bg-login.png'/>" alt="login image"
					class="login__img">

				<div class="login__form">
					<h1 class="login__title">
						<span>Welcome</span> Back
					</h1>
					<p class="login__description">Welcome! Please login to
						continue.</p>

					<div class="login__inputs">
						<div>
							<label for="input-email" class="login__label">Email</label> <input
								type="email" placeholder="Enter your email address" required
								class="login__input" id="input-email" name="username">
						</div>

						<div>
							<label for="input-pass" class="login__label">Password</label>
							<div class="login__box">
								<input type="password" placeholder="Enter your password"
									required class="login__input" id="input-pass" name="password">
								<i class="ri-eye-off-line login__eye" id="input-icon"></i>
							</div>
						</div>
					</div>

					<div class="login__check">
						<input type="checkbox" class="login__check-input" id="input-check"
							name="rememberMe"> <label for="input-check"
							class="login__check-label">Remember me</label>
					</div>

					<div class="login__buttons">
						<button type="submit" class="login__button">Log In</button>

						<a href="/EnFinances/registerUser"><button type="button"
								class="login__button login__button-ghost">Sign Up</button></a>
					</div>

					<a href="#" class="login__forgot">Forgot Password?</a>
					
						<%
						if (request.getAttribute("error") != null) {
						%>
						<div class="error-message">
							<div class="error-icon">
								<!-- SVG icon for error -->
								<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
									xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
										d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z"
										clip-rule="evenodd" />
            </svg>
							</div>
							<span class="error-text"><%=request.getAttribute("errorMsg")%></span>
						</div>
						<%
						}
						%>
				</div>
			</div>
		</div>

	</form:form>

	<jsp:include page="/WEB-INF/views/footer.jsp" />

	<!--=============== MAIN JS ===============-->
	<script>
        /*=============== SHOW HIDDEN - PASSWORD ===============*/
        const showHiddenPass = (inputPass, inputIcon) => {
            const input = document.getElementById(inputPass),
                iconEye = document.getElementById(inputIcon);

            iconEye.addEventListener('click', () => {
                if(input.type === 'password'){
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

        showHiddenPass('input-pass', 'input-icon');
        
     // Check if the error message exists
        window.onload = function() {
            var errorMessage = document.getElementById('error-message');
            if (errorMessage) {
                // Hide the error message after 3 seconds
                setTimeout(function() {
                    errorMessage.style.opacity = 0; // Fade out the error message
                    setTimeout(function() {
                        errorMessage.style.display = 'none'; // Remove from DOM after fade out
                    }, 1000); // Wait for the opacity transition to finish
                }, 3000); // Wait 3 seconds before hiding the error
            }
        };
    </script>
</body>
</html>