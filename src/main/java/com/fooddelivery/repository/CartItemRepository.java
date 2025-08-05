package com.fooddelivery.repository;

import com.fooddelivery.model.CartItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Long> {
    
    List<CartItem> findBySessionId(String sessionId);
    
    Optional<CartItem> findBySessionIdAndMenuItemId(String sessionId, Long menuItemId);
    
    void deleteBySessionId(String sessionId);
    
    void deleteBySessionIdAndMenuItemId(String sessionId, Long menuItemId);
} 