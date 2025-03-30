<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
	rel="stylesheet" />
<title>Enomy Finances - Secure Financial Solutions</title>
</head>
<style>
/* General styles */
body {
  font-family: Arial, sans-serif;
  background: hsl(208, 97%, 85%);
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0;
}

/* Container */
.container {
  max-width: 500px;
  width: 90%;
}

/* Card styles */
.card {
  background: white;
  border-radius: 15px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  overflow: hidden;
}

/* Header */
.card-header {
  background: #4a3fe4;
  color: white;
  text-align: center;
  padding: 20px;
}

.icon {
  height: 50px;
  width: 50px;
}

/* Body */
.card-body {
  padding: 20px;
  text-align: center;
}

/* User details */
.details {
  background: #f3f4f6;
  padding: 15px;
  border-radius: 10px;
  margin: 15px 0;
  text-align: left;
}

.details h2 {
  margin-bottom: 10px;
}

/* Next steps */
.next-steps {
  background: #eff6ff;
  padding: 15px;
  border-radius: 10px;
  text-align: left;
}

.next-steps ul {
  list-style: none;
  padding: 0;
}

.next-steps li {
  margin: 5px 0;
  color: #1e3a8a;
}

/* Buttons */
.actions {
  margin-top: 15px;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.btn {
  text-decoration: none;
  padding: 10px;
  border-radius: 5px;
  font-size: 16px;
  text-align: center;
}

.primary {
  background:linear-gradient(180deg, hsl(244, 75%, 57%), hsl(249, 64%, 47%));
  color: white;
}

.secondary {
  background: white;
  color: #333;
  border: 1px solid #ccc;
}

.user__role {
    background-color: #D1FAE5;
    color: #047857; 
    padding-left: 0.75rem;
    padding-right: 0.75rem;
    padding-top: 0.25rem;
    padding-bottom: 0.25rem;
    border-radius: 9999px;
    font-size: 0.875rem; 
    font-weight: 500; 
}

/* Responsive */
@media (min-width: 640px) {
  .actions {
      flex-direction: row;
      justify-content: center;
  }
}

</style>

<body>
 <div class="container">
        <div class="card">
            <!-- Success Message -->
            <div class="card-header">
                <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                <path d="M4 12C4 7.58172 7.58172 4 12 4C16.4183 4 20 7.58172 20 12C20 16.4183 16.4183 20 12 20C7.58172 20 4 16.4183 4 12ZM12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2ZM17.4571 9.45711L16.0429 8.04289L11 13.0858L8.20711 10.2929L6.79289 11.7071L11 15.9142L17.4571 9.45711Z">
                </path></svg>
                <h1>Registration Successful!</h1>
            </div>

            <!-- User Details -->
            <div class="card-body">
                <p>Welcome to Enomy Finances! Your account has been successfully created.</p>

                <div class="details">
                    <h2>Account Details</h2>
                    <div><strong>Name:</strong> <span id="user-name">${user.fname} ${user.lname}</span></div>
                    <div><strong>Email:</strong> <span id="user-email">${user.email}</span></div>
                    <div><strong>Contact:</strong> <span id="user-contact">${user.contactNumber}</span></div>
                    <div><strong>Account Type:</strong> <span class="user__role" id="user-role">${userRole}</span></div>
                </div>

                <!-- Next Steps -->	
                <div class="next-steps">
                    <h3>Next Steps</h3>
                    <ul>
                        <li>✔ Complete your profile information</li>
                        <li>✔ Verify your email address</li>
                        <li>✔ Set up your security preferences</li>
                    </ul>
                </div>

                <!-- Action Buttons -->
                <div class="actions">
                    <a href="login.html" class="btn primary">Proceed to Login</a>
                    <a href="index.html" class="btn secondary">Back to Home</a>
                </div>
            </div>
        </div>
    </div>
</body>
</body>
</html>