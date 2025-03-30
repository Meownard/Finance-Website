package com.enfinances.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.enfinances.entity.User;
import com.enfinances.repository.SavingsAndInvestmentsRepository;
import com.enfinances.repository.UserRepository;

@Controller
public class AdminController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SavingsAndInvestmentsRepository investmentsRepository;

    @GetMapping("/adminpage")
    public ModelAndView showAdminPage() {
        ModelAndView mv = new ModelAndView("adminpage");
        
        // Fetch users with roles eagerly loaded
        List<User> users = userRepository.findAllWithRoles();
        mv.addObject("users", users);
        mv.addObject("investments", investmentsRepository.findAll());
        
        return mv;
    }
}