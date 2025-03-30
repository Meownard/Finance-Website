
package com.enfinances.controller;

import com.enfinances.entity.CurrencyExchange;
import com.enfinances.entity.User;
import com.enfinances.repository.UserRepository;
import com.enfinances.service.CurrencyExchangeService;
import com.enfinances.service.ExchangeRateService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.math.BigDecimal;
import java.security.Principal;

@Controller
public class CurrencyExchangeController {

    @Autowired
    private CurrencyExchangeService exchangeService;
    
    @Autowired
    private ExchangeRateService exchangeRateService;
    
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/currencyexchange")
    public ModelAndView showCurrencyExchange(@AuthenticationPrincipal User user) {
        ModelAndView mv = new ModelAndView("currencyexchange");
        mv.addObject("exchangeHistory", exchangeService.getUserExchangeHistory(user));
        return mv;
    }
    
    @PostMapping("/exchange")
    public ModelAndView calculateExchange(
            Principal principal,
            @RequestParam String fromCurrency,
            @RequestParam String toCurrency,
            @RequestParam BigDecimal amount) {
            
        ModelAndView mv = new ModelAndView("currencyexchange");
        
        try {
            User user = userRepository.findByEmail(principal.getName());
            BigDecimal exchangeRate = exchangeRateService.getExchangeRate(fromCurrency, toCurrency);
            
            // Process the exchange using the service
            CurrencyExchange exchange = exchangeService.processExchange(
                user, fromCurrency, toCurrency, amount, exchangeRate);
            
            // Add results to model
            mv.addObject("originalAmount", exchange.getOriginalAmount());
            mv.addObject("convertedAmount", exchange.getConvertedAmount());
            mv.addObject("exchangeRate", exchange.getExchangeRate());
            mv.addObject("feePercentage", exchange.getFeePercentage());
            mv.addObject("feeAmount", exchange.getFeeAmount());
            mv.addObject("finalAmount", exchange.getFinalAmount());
            mv.addObject("exchangeHistory", exchangeService.getUserExchangeHistory(user));
            
        } catch (Exception e) {
            mv.addObject("error", "Error processing exchange: " + e.getMessage());
        }
        
        return mv;
    }
}
