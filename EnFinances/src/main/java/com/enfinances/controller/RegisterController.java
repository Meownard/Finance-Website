package com.enfinances.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.enfinances.entity.User;
import com.enfinances.service.UserService;

@Controller
public class RegisterController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/registerUser")
	public ModelAndView showRegistrationForm() {
		return new ModelAndView("registerUser");
	}
	
	
	
	@GetMapping("/confirmation")
	public String showConfirmation(@ModelAttribute("user") User user, Model model) {
	    if (user == null || user.getEmail() == null) {
	        return "redirect:/registerUser";
	    }
	    
	    model.addAttribute("user", user);
	    model.addAttribute("userRole", user.getRoleNames());
	    return "confirmation";
	}
	
	
	@PostMapping("/registerUser")
	public String registerUser(@RequestParam String fname,
            @RequestParam String lname,
            @RequestParam String email,
            @RequestParam String contactNumber,
            @RequestParam String password,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

if (userService.emailExists(email)) {
redirectAttributes.addFlashAttribute("error", "Email already exists, Try Again!");
return "redirect:/registerUser";
}

User newUser = userService.registerNewClient(fname, lname, email, contactNumber, password);
redirectAttributes.addFlashAttribute("user", newUser);
return "redirect:/confirmation";
}
	
}