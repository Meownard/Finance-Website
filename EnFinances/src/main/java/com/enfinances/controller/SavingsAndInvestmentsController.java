
package com.enfinances.controller;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.enfinances.entity.User;
import com.enfinances.repository.UserRepository;
import com.enfinances.service.SavingsAndInvestmentsService;

@Controller
public class SavingsAndInvestmentsController {

    @Autowired
    private SavingsAndInvestmentsService investmentsService;
    
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/savingsandinvestments")
    public ModelAndView showSavingsAndInvestmentsPage() {
        return new ModelAndView("savingsandinvestments");
    }

    @PostMapping("/calculate-investment")
    public ModelAndView calculateInvestment(
            @RequestParam String investmentType,
            @RequestParam BigDecimal initialInvestment,
            @RequestParam BigDecimal monthlyInvestment) {
        
        ModelAndView mv = new ModelAndView("savingsandinvestments");
        
        try {
            Map<String, Object> calculations = investmentsService.calculateInvestment(
                investmentType, initialInvestment, monthlyInvestment);
            
            mv.addAllObjects(calculations);
            mv.addObject("showSaveButton", true);
            
        } catch (Exception e) {
            mv.addObject("error", e.getMessage());
        }
        
        return mv;
    }

    @PostMapping("/save-investment")
    public ModelAndView saveInvestment(
            Principal principal,
            @RequestParam String investmentType,
            @RequestParam BigDecimal initialInvestment,
            @RequestParam BigDecimal monthlyInvestment) {
        
        ModelAndView mv = new ModelAndView("savingsandinvestments");
        
        try {
            User user = userRepository.findByEmail(principal.getName());
            Map<String, Object> calculations = investmentsService.calculateInvestment(
                investmentType, initialInvestment, monthlyInvestment);
                
            investmentsService.saveInvestment(user, investmentType, initialInvestment, 
                monthlyInvestment, calculations);
                
            mv.addObject("success", "Investment saved successfully!");
            mv.addObject("investments", investmentsService.getUserInvestments(user));
            
        } catch (Exception e) {
            mv.addObject("error", e.getMessage());
        }
        
        return mv;
    }
}
