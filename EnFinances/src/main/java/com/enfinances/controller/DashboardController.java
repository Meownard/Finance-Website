package com.enfinances.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.enfinances.entity.User;
import com.enfinances.service.UserService;

@Controller
public class DashboardController {

	@Autowired
    private UserService userService;

    @GetMapping("/dashboard")
    public ModelAndView showDashboard() {
        ModelAndView modelAndView = new ModelAndView("dashboard");

        // Retrieve authenticated user
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName(); // Assuming username is email
        
        User user = userService.findByEmail(email); // Fetch user from DB

        modelAndView.addObject("user", user);
        return modelAndView;
    }
}