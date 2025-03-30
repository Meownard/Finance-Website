package com.enfinances.service;

import com.enfinances.entity.CurrencyExchange;
import com.enfinances.entity.User;
import com.enfinances.repository.CurrencyExchangeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class CurrencyExchangeServiceImpl implements CurrencyExchangeService {

    @Autowired
    private CurrencyExchangeRepository exchangeRepository;

    @Override
    public CurrencyExchange processExchange(User user, String fromCurrency, String toCurrency, 
                                          BigDecimal amount, BigDecimal exchangeRate) {
        CurrencyExchange exchange = new CurrencyExchange();
        
        // Set the user explicitly
        exchange.setUser(user);
        
        // Set other fields
        exchange.setFromCurrency(fromCurrency);
        exchange.setToCurrency(toCurrency);
        exchange.setOriginalAmount(amount);
        exchange.setExchangeRate(exchangeRate);
        
        BigDecimal convertedAmount = amount.multiply(exchangeRate);
        exchange.setConvertedAmount(convertedAmount);
        
        BigDecimal feePercentage = calculateFeePercentage(amount);
        BigDecimal feeAmount = convertedAmount.multiply(feePercentage.divide(BigDecimal.valueOf(100)));
        
        exchange.setFeePercentage(feePercentage);
        exchange.setFeeAmount(feeAmount);
        exchange.setFinalAmount(convertedAmount.subtract(feeAmount));
        exchange.setTransactionDate(LocalDateTime.now());
        
        return exchangeRepository.save(exchange);
    }

    @Override
    public List<CurrencyExchange> getUserExchangeHistory(User user) {
        return exchangeRepository.findByUserOrderByTransactionDateDesc(user);
    }

    private BigDecimal calculateFeePercentage(BigDecimal amount) {
        if (amount.compareTo(BigDecimal.valueOf(2500)) > 0) {
            return BigDecimal.valueOf(1.5);
        } else if (amount.compareTo(BigDecimal.valueOf(1500)) > 0) {
            return BigDecimal.valueOf(2.0);
        } else if (amount.compareTo(BigDecimal.valueOf(500)) > 0) {
            return BigDecimal.valueOf(2.7);
        }
        return BigDecimal.valueOf(3.5);
    }
}