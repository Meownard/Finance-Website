package com.enfinances.authentication;


import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.enfinances.entity.Roles;
import com.enfinances.entity.User;
import com.enfinances.repository.UserRepository;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
	private UserRepository userRepository;

	@Override
	@Transactional
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		UserDetails userDetails = (UserDetails) authentication.getPrincipal();

		User user = userRepository.findByEmail(userDetails.getUsername());
		if (user != null) {
            Set<Roles> roles = user.getRoles();
            boolean isAdmin = roles.stream().anyMatch(role -> role.getId() == 1); // Assuming 1 is the role ID for ADMIN
            if (isAdmin) {
            	String firstName = user.getFname();
                String lastName = user.getLname();
                HttpSession session = request.getSession();
                session.setAttribute("fname", firstName);
                session.setAttribute("lname", lastName);
                response.sendRedirect("adminpage"); // Redirect to adminpage
            } else {
                String userEmail = userDetails.getUsername();
                String firstName = user.getFname();
                String lastName = user.getLname();

                HttpSession session = request.getSession();
                session.setAttribute("login", true);
                session.setAttribute("userEmail", userEmail);
                session.setAttribute("fname", firstName);
                session.setAttribute("lname", lastName);
                response.sendRedirect("dashboard");
            }
        } else {
            request.getSession().setAttribute("error", true);
            request.getSession().setAttribute("loginError", "Wrong email and password.");
            response.sendRedirect("login");
        }
	}
}
