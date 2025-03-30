package com.enfinances.repository;

import com.enfinances.entity.SavingsAndInvestments;
import com.enfinances.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface SavingsAndInvestmentsRepository extends JpaRepository<SavingsAndInvestments, Long> {
    
    // Find all investments for a specific user
    List<SavingsAndInvestments> findByUser(User user);
    
    // Find investments by user ordered by date
    List<SavingsAndInvestments> findByUserOrderByInvestmentDateDesc(User user);
    
    // Find investments by type for a user
    List<SavingsAndInvestments> findByUserAndInvestmentType(User user, SavingsAndInvestments.InvestmentType type);
    
    // Find investments between dates for a user
    List<SavingsAndInvestments> findByUserAndInvestmentDateBetween(User user, LocalDateTime startDate, LocalDateTime endDate);
    
    // Count total investments by type for a user
    Long countByUserAndInvestmentType(User user, SavingsAndInvestments.InvestmentType type);
    
    // Find latest investment for a user
    SavingsAndInvestments findFirstByUserOrderByInvestmentDateDesc(User user);
}