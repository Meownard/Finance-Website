package com.enfinances.service;

import com.enfinances.entity.CurrencyExchange;
import com.enfinances.entity.User;
import java.math.BigDecimal;
import java.util.List;

public interface CurrencyExchangeService {
	
	CurrencyExchange processExchange(User user, String fromCurrency, String toCurrency, BigDecimal amount,
			BigDecimal exchangeRate);

	List<CurrencyExchange> getUserExchangeHistory(User user);
}
