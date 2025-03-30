package com.enfinances.service;

import java.math.BigDecimal;
import org.springframework.stereotype.Service;

@Service
public class ExchangeRateServiceImpl implements ExchangeRateService {

    public BigDecimal getExchangeRate(String fromCurrency, String toCurrency) {
        double rate = convertCurrencyStatic(fromCurrency, toCurrency);
        return BigDecimal.valueOf(rate);
    }

    // Static conversion rates between currencies
    private double convertCurrencyStatic(String sourceCurrency, String targetCurrency) {
        switch (sourceCurrency) {
            case "USD":
                return convertFromUSD(targetCurrency);
            case "EUR":
                return convertFromEUR(targetCurrency);
            case "JPY":
                return convertFromJPY(targetCurrency);
            case "BRL":
                return convertFromBRL(targetCurrency);
            case "GBP":
                return convertFromGBP(targetCurrency);
            case "TRY":
                return convertFromTRY(targetCurrency);
            default:
                // Handle unknown source currency
                return 1.0;
        }
    }

    // Example conversion rates from USD
    private double convertFromUSD(String targetCurrency) {
        switch (targetCurrency) {
            case "EUR":
                return 0.85;
            case "JPY":
                return 110.0;
            case "BRL":
                return 5.0;
            case "GBP":
                return 0.73;
            case "TRY":
                return 11.0;
            default:
                return 1.0;
        }
    }

    private double convertFromEUR(String targetCurrency) {
        switch (targetCurrency) {
            case "USD":
                return 1.18;
            case "JPY":
                return 130.0;
            case "BRL":
                return 6.5;
            case "GBP":
                return 0.85;
            case "TRY":
                return 10.0;
            default:
                return 1.0;
        }
    }

    private double convertFromJPY(String targetCurrency) {
        switch (targetCurrency) {
            case "USD":
                return 0.0091;
            case "EUR":
                return 0.0077;
            case "BRL":
                return 0.05;
            case "GBP":
                return 0.0067;
            case "TRY":
                return 0.081;
            default:
                return 1.0;
        }
    }

    private double convertFromBRL(String targetCurrency) {
        switch (targetCurrency) {
            case "USD":
                return 0.2;
            case "EUR":
                return 0.15;
            case "JPY":
                return 20.0;
            case "GBP":
                return 0.13;
            case "TRY":
                return 1.5;
            default:
                return 1.0;
        }
    }

    private double convertFromGBP(String targetCurrency) {
        switch (targetCurrency) {
            case "USD":
                return 1.38;
            case "EUR":
                return 1.18;
            case "JPY":
                return 150.0;
            case "BRL":
                return 7.7;
            case "TRY":
                return 12.0;
            default:
                return 1.0;
        }
    }

    private double convertFromTRY(String targetCurrency) {
        switch (targetCurrency) {
            case "USD":
                return 0.091;
            case "EUR":
                return 0.10;
            case "JPY":
                return 12.0;
            case "BRL":
                return 0.67;
            case "GBP":
                return 0.083;
            default:
                return 1.0;
        }
    }
}
