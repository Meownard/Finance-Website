package com.enfinances.repository;

import com.enfinances.entity.CurrencyExchange;
import com.enfinances.entity.User;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CurrencyExchangeRepository extends JpaRepository<CurrencyExchange, Long> {
	
    List<CurrencyExchange> findByUserOrderByTransactionDateDesc(User user);
}