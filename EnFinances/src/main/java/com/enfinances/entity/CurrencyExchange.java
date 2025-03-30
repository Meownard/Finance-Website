package com.enfinances.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "currency_exchanges")
public class CurrencyExchange {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "currencyexchange_id")
	private Long id;

	@ManyToOne(optional = false)
	@JoinColumn(name = "user_id", nullable = false)
	private User user;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<SavingsAndInvestments> investments = new ArrayList<>();

	@Column(name = "from_currency")
	private String fromCurrency;

	@Column(name = "to_currency")
	private String toCurrency;

	@Column(name = "original_amount", precision = 10, scale = 2)
	private BigDecimal originalAmount;

	@Column(name = "converted_amount", precision = 10, scale = 2)
	private BigDecimal convertedAmount;

	@Column(name = "exchange_rate", precision = 5, scale = 2)
	private BigDecimal exchangeRate;

	@Column(name = "fee_percentage", precision = 5, scale = 2)
	private BigDecimal feePercentage;

	@Column(name = "fee_amount", precision = 10, scale = 2)
	private BigDecimal feeAmount;

	@Column(name = "final_amount", precision = 10, scale = 2)
	private BigDecimal finalAmount;

	@Column(name = "transaction_date")
	private LocalDateTime transactionDate;

	public CurrencyExchange() {

	}

	public CurrencyExchange(Long id, User user, String fromCurrency,
			String toCurrency, BigDecimal originalAmount, BigDecimal convertedAmount, BigDecimal exchangeRate,
			BigDecimal feePercentage, BigDecimal feeAmount, BigDecimal finalAmount, LocalDateTime transactionDate) {
		this.id = id;
		this.user = user;
		
		this.fromCurrency = fromCurrency;
		this.toCurrency = toCurrency;
		this.originalAmount = originalAmount;
		this.convertedAmount = convertedAmount;
		this.exchangeRate = exchangeRate;
		this.feePercentage = feePercentage;
		this.feeAmount = feeAmount;
		this.finalAmount = finalAmount;
		this.transactionDate = transactionDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getFromCurrency() {
		return fromCurrency;
	}

	public void setFromCurrency(String fromCurrency) {
		this.fromCurrency = fromCurrency;
	}

	public String getToCurrency() {
		return toCurrency;
	}

	public void setToCurrency(String toCurrency) {
		this.toCurrency = toCurrency;
	}

	public BigDecimal getOriginalAmount() {
		return originalAmount;
	}

	public void setOriginalAmount(BigDecimal originalAmount) {
		this.originalAmount = originalAmount;
	}

	public BigDecimal getConvertedAmount() {
		return convertedAmount;
	}

	public void setConvertedAmount(BigDecimal convertedAmount) {
		this.convertedAmount = convertedAmount;
	}

	public BigDecimal getExchangeRate() {
		return exchangeRate;
	}

	public void setExchangeRate(BigDecimal exchangeRate) {
		this.exchangeRate = exchangeRate;
	}

	public BigDecimal getFeePercentage() {
		return feePercentage;
	}

	public void setFeePercentage(BigDecimal feePercentage) {
		this.feePercentage = feePercentage;
	}

	public BigDecimal getFeeAmount() {
		return feeAmount;
	}

	public void setFeeAmount(BigDecimal feeAmount) {
		this.feeAmount = feeAmount;
	}

	public BigDecimal getFinalAmount() {
		return finalAmount;
	}

	public void setFinalAmount(BigDecimal finalAmount) {
		this.finalAmount = finalAmount;
	}

	public LocalDateTime getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(LocalDateTime transactionDate) {
		this.transactionDate = transactionDate;
	}
}