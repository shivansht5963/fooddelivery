package com.fooddelivery.repository;

import com.fooddelivery.model.MenuItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuItemRepository extends JpaRepository<MenuItem, Long> {
    
    List<MenuItem> findByAvailableTrue();
    
    List<MenuItem> findByCategoryAndAvailableTrue(String category);
    
    @Query("SELECT DISTINCT m.category FROM MenuItem m WHERE m.available = true ORDER BY m.category")
    List<String> findDistinctCategories();
    
    List<MenuItem> findByNameContainingIgnoreCaseAndAvailableTrue(String name);
} 