package com.enfinances.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.enfinances.entity.SavingsAndInvestments;
import com.enfinances.entity.User;
import com.enfinances.repository.SavingsAndInvestmentsRepository;

@Service
public class SavingsAndInvestmentsServiceImpl implements SavingsAndInvestmentsService {

    @Autowired
    private SavingsAndInvestmentsRepository investmentsRepository;

    @Override
    public Map<String, Object> calculateInvestment(String investmentType, BigDecimal initialInvestment,
            BigDecimal monthlyInvestment) {
        Map<String, Object> results = new HashMap<>();

        BigDecimal minReturn, maxReturn, monthlyFee;
        boolean isTaxable = false;
        String taxType = "NONE";
        BigDecimal maxYearlyInvestment = null;

        switch (investmentType) {
            case "BASIC":
                minReturn = new BigDecimal("0.012"); // 1.2% return
                maxReturn = new BigDecimal("0.024"); // 2.4% return
                monthlyFee = new BigDecimal("0.0025"); // 0.25% per month (3% per year)
                maxYearlyInvestment = new BigDecimal("20000"); // Max investment
                validateBasicPlan(initialInvestment, monthlyInvestment);
                break;
            case "PLUS":
                minReturn = new BigDecimal("0.03"); // 3% return
                maxReturn = new BigDecimal("0.055"); // 5.5% return
                monthlyFee = new BigDecimal("0.003"); // 0.3% per month (3.6% per year)
                isTaxable = true;
                taxType = "PLUS";
                maxYearlyInvestment = new BigDecimal("30000"); // Max investment
                validatePlusPlan(initialInvestment, monthlyInvestment);
                break;
            default: // MANAGED
                minReturn = new BigDecimal("0.04"); // 4% return
                maxReturn = new BigDecimal("0.23"); // 23% return
                monthlyFee = new BigDecimal("0.005"); // Reduced to 0.5% per month (6% per year)
                isTaxable = true;
                taxType = "MANAGED";
                maxYearlyInvestment = null; // No maximum investment for Managed plan
                validateManagedPlan(initialInvestment, monthlyInvestment);
                break;
        }

        // Check if investment exceeds the maximum allowed for the selected plan
        if (monthlyInvestment.multiply(BigDecimal.valueOf(12)).compareTo(maxYearlyInvestment) > 0) {
            throw new IllegalArgumentException(investmentType + " plan has a maximum yearly investment of " + maxYearlyInvestment);
        }

        // Calculate projections for 1, 5, and 10 years
        results.putAll(calculateProjection(initialInvestment, monthlyInvestment, minReturn, maxReturn, monthlyFee, 1, isTaxable, taxType));
        results.putAll(calculateProjection(initialInvestment, monthlyInvestment, minReturn, maxReturn, monthlyFee, 5, isTaxable, taxType));
        results.putAll(calculateProjection(initialInvestment, monthlyInvestment, minReturn, maxReturn, monthlyFee, 10, isTaxable, taxType));

        // Include initial and monthly investments in the result map
        results.put("initialInvestment", initialInvestment);
        results.put("monthlyInvestment", monthlyInvestment);

        return results;
    }

    @Override
    public SavingsAndInvestments saveInvestment(User user, String investmentType, 
        BigDecimal initialInvestment, BigDecimal monthlyInvestment, 
        Map<String, Object> calculations) {
        
        SavingsAndInvestments investment = new SavingsAndInvestments();
        investment.setUser(user);
        investment.setInvestmentType(SavingsAndInvestments.InvestmentType.valueOf(investmentType));
        investment.setInitialInvestment(initialInvestment);
        investment.setMonthlyInvestment(monthlyInvestment);
        
        // Save one-year projections
        investment.setMinimumReturn((BigDecimal) calculations.get("oneYearMinProfit"));
        investment.setMaximumReturn((BigDecimal) calculations.get("oneYearMaxProfit"));
        investment.setFees((BigDecimal) calculations.get("oneYearFees"));
        investment.setTaxPaid((BigDecimal) calculations.get("oneYearMaxTax"));
        investment.setInvestmentDate(LocalDateTime.now());
        
        return investmentsRepository.save(investment);
    }

    @Override
    public List<SavingsAndInvestments> getUserInvestments(User user) {
        return investmentsRepository.findByUserOrderByInvestmentDateDesc(user);
    }

    private Map<String, Object> calculateProjection(BigDecimal initial, BigDecimal monthly, BigDecimal minReturn,
            BigDecimal maxReturn, BigDecimal monthlyFee, int years, boolean isTaxable, String taxType) {
        Map<String, Object> projection = new HashMap<>();
        String prefix = years == 1 ? "one" : years == 5 ? "five" : "ten";

        BigDecimal minMonthlyRate = minReturn.divide(BigDecimal.valueOf(12), 10, RoundingMode.HALF_UP);
        BigDecimal maxMonthlyRate = maxReturn.divide(BigDecimal.valueOf(12), 10, RoundingMode.HALF_UP);

        BigDecimal[] minResult = calculateInvestmentValue(initial, monthly, minMonthlyRate, monthlyFee, years);
        BigDecimal[] maxResult = calculateInvestmentValue(initial, monthly, maxMonthlyRate, monthlyFee, years);

        BigDecimal minValue = minResult[0];
        BigDecimal maxValue = maxResult[0];
        BigDecimal totalFees = minResult[1];

        BigDecimal totalInvested = initial.add(monthly.multiply(BigDecimal.valueOf(12 * years)));

        BigDecimal minProfit = minValue.subtract(totalInvested);
        BigDecimal maxProfit = maxValue.subtract(totalInvested);

        BigDecimal minTax = isTaxable ? calculateTax(minProfit, taxType) : BigDecimal.ZERO;
        BigDecimal maxTax = isTaxable ? calculateTax(maxProfit, taxType) : BigDecimal.ZERO;

        projection.put(prefix + "YearMin", minValue);
        projection.put(prefix + "YearMax", maxValue);
        projection.put(prefix + "YearMinTax", minTax);
        projection.put(prefix + "YearMaxTax", maxTax);
        projection.put(prefix + "YearMinProfit", minProfit.subtract(minTax));
        projection.put(prefix + "YearMaxProfit", maxProfit.subtract(maxTax));
        projection.put(prefix + "YearFees", totalFees); // Store total fees

        return projection;
    }

    private BigDecimal[] calculateInvestmentValue(BigDecimal initial, BigDecimal monthly, BigDecimal monthlyRate,
            BigDecimal monthlyFeeRate, int years) {
        BigDecimal totalValue = initial;
        BigDecimal totalFees = BigDecimal.ZERO;

        for (int month = 0; month < years * 12; month++) {
            // Apply interest for the month
            BigDecimal interest = totalValue.multiply(monthlyRate);
            totalValue = totalValue.add(interest);  // Add interest to the total value

            // Add monthly contribution
            totalValue = totalValue.add(monthly);

            // Apply monthly fee after interest and contribution
            BigDecimal fee = totalValue.multiply(monthlyFeeRate);
            totalFees = totalFees.add(fee);
            totalValue = totalValue.subtract(fee);  // Subtract fee from the total value
        }

        return new BigDecimal[]{
            totalValue.setScale(2, RoundingMode.HALF_UP),
            totalFees.setScale(2, RoundingMode.HALF_UP)
        };
    }


    private BigDecimal calculateTax(BigDecimal profit, String taxType) {
        if (profit.compareTo(BigDecimal.ZERO) <= 0) {
            return BigDecimal.ZERO;
        }

        BigDecimal tax = BigDecimal.ZERO;
        BigDecimal taxFreeAllowance = new BigDecimal("12000");
        BigDecimal basicRateLimit = new BigDecimal("40000");
        BigDecimal basicRate = new BigDecimal("0.10");
        BigDecimal higherRate = new BigDecimal("0.20");

        if (taxType.equals("PLUS") || taxType.equals("MANAGED")) {
            if (profit.compareTo(taxFreeAllowance) > 0) {
                BigDecimal taxableAtBasic = profit.min(basicRateLimit).subtract(taxFreeAllowance);
                if (taxableAtBasic.compareTo(BigDecimal.ZERO) > 0) {
                    tax = tax.add(taxableAtBasic.multiply(basicRate));
                }
            }

            if (taxType.equals("MANAGED") && profit.compareTo(basicRateLimit) > 0) {
                BigDecimal taxableAtHigher = profit.subtract(basicRateLimit);
                tax = tax.add(taxableAtHigher.multiply(higherRate));
            }
        }

        return tax.setScale(2, RoundingMode.HALF_UP);
    }

    private void validateBasicPlan(BigDecimal initial, BigDecimal monthly) {
        if (monthly.compareTo(new BigDecimal("50")) < 0) {
            throw new IllegalArgumentException("Basic plan requires minimum £50 monthly investment");
        }
        if (monthly.multiply(BigDecimal.valueOf(12)).compareTo(new BigDecimal("20000")) > 0) {
            throw new IllegalArgumentException("Basic plan has a maximum yearly investment of £20,000");
        }
    }

    private void validatePlusPlan(BigDecimal initial, BigDecimal monthly) {
        if (initial.compareTo(new BigDecimal("300")) < 0) {
            throw new IllegalArgumentException("Plus plan requires minimum £300 initial investment");
        }
        if (monthly.multiply(BigDecimal.valueOf(12)).compareTo(new BigDecimal("30000")) > 0) {
            throw new IllegalArgumentException("Plus plan has a maximum yearly investment of £30,000");
        }
    }

    private void validateManagedPlan(BigDecimal initial, BigDecimal monthly) {
        if (initial.compareTo(new BigDecimal("1000")) < 0) {
            throw new IllegalArgumentException("Managed plan requires minimum £1000 initial investment");
        }
        if (monthly.compareTo(new BigDecimal("150")) < 0) {
            throw new IllegalArgumentException("Managed plan requires minimum £150 monthly investment");
        }
    }
}
