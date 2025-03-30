package com.enfinances.entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "savings_investments")
public class SavingsAndInvestments {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "investment_id")
    private Long investmentId;
    
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;
    
    @Column(name = "investment_type")
    @Enumerated(EnumType.STRING)
    private InvestmentType investmentType;
    
    @Column(name = "initial_investment")
    private BigDecimal initialInvestment;
    
    @Column(name = "monthly_investment")
    private BigDecimal monthlyInvestment;
    
    @Column(name = "min_return")
    private BigDecimal minimumReturn;
    
    @Column(name = "max_return")
    private BigDecimal maximumReturn;
    
    @Column(name = "fees")
    private BigDecimal fees;
    
    @Column(name = "tax_paid")
    private BigDecimal taxPaid;
    
    @Column(name = "investment_date")
    private LocalDateTime investmentDate;
    
    public enum InvestmentType {
        BASIC, PLUS, MANAGED
    }
    
    // Default constructor
    public SavingsAndInvestments() {}
    
    
    
    public SavingsAndInvestments(Long investmentId, User user, InvestmentType investmentType,
			BigDecimal initialInvestment, BigDecimal monthlyInvestment, BigDecimal minimumReturn,
			BigDecimal maximumReturn, BigDecimal fees, BigDecimal taxPaid, LocalDateTime investmentDate) {
		this.investmentId = investmentId;
		this.user = user;
		this.investmentType = investmentType;
		this.initialInvestment = initialInvestment;
		this.monthlyInvestment = monthlyInvestment;
		this.minimumReturn = minimumReturn;
		this.maximumReturn = maximumReturn;
		this.fees = fees;
		this.taxPaid = taxPaid;
		this.investmentDate = investmentDate;
	}

	// Getters and Setters
    public Long getInvestmentId() {
        return investmentId;
    }
    
    public void setInvestmentId(Long investmentId) {
        this.investmentId = investmentId;
    }
    
    public User getUser() {
        return user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    
    public InvestmentType getInvestmentType() {
        return investmentType;
    }
    
    public void setInvestmentType(InvestmentType investmentType) {
        this.investmentType = investmentType;
    }
    
    public BigDecimal getInitialInvestment() {
        return initialInvestment;
    }
    
    public void setInitialInvestment(BigDecimal initialInvestment) {
        this.initialInvestment = initialInvestment;
    }
    
    public BigDecimal getMonthlyInvestment() {
        return monthlyInvestment;
    }
    
    public void setMonthlyInvestment(BigDecimal monthlyInvestment) {
        this.monthlyInvestment = monthlyInvestment;
    }
    
    public BigDecimal getMinimumReturn() {
        return minimumReturn;
    }
    
    public void setMinimumReturn(BigDecimal minimumReturn) {
        this.minimumReturn = minimumReturn;
    }
    
    public BigDecimal getMaximumReturn() {
        return maximumReturn;
    }
    
    public void setMaximumReturn(BigDecimal maximumReturn) {
        this.maximumReturn = maximumReturn;
    }
    
    public BigDecimal getFees() {
        return fees;
    }
    
    public void setFees(BigDecimal fees) {
        this.fees = fees;
    }
    
    public BigDecimal getTaxPaid() {
        return taxPaid;
    }
    
    public void setTaxPaid(BigDecimal taxPaid) {
        this.taxPaid = taxPaid;
    }
    
    public LocalDateTime getInvestmentDate() {
        return investmentDate;
    }
    
    public void setInvestmentDate(LocalDateTime investmentDate) {
        this.investmentDate = investmentDate;
    }
}