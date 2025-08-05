package com.fooddelivery.service;

import com.fooddelivery.model.MenuItem;
import com.fooddelivery.repository.MenuItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MenuService {
    
    @Autowired
    private MenuItemRepository menuItemRepository;
    
    public List<MenuItem> getAllAvailableItems() {
        return menuItemRepository.findByAvailableTrue();
    }
    
    public List<MenuItem> getItemsByCategory(String category) {
        return menuItemRepository.findByCategoryAndAvailableTrue(category);
    }
    
    public List<String> getAllCategories() {
        return menuItemRepository.findDistinctCategories();
    }
    
    public List<MenuItem> searchItems(String searchTerm) {
        return menuItemRepository.findByNameContainingIgnoreCaseAndAvailableTrue(searchTerm);
    }
    
    public Optional<MenuItem> getItemById(Long id) {
        return menuItemRepository.findById(id);
    }
    
    public MenuItem saveItem(MenuItem menuItem) {
        return menuItemRepository.save(menuItem);
    }
    
    public void deleteItem(Long id) {
        menuItemRepository.deleteById(id);
    }
    
    public void initializeSampleData() {
        if (menuItemRepository.count() == 0) {
            // Appetizers
            menuItemRepository.save(new MenuItem("Chicken Wings", "Crispy fried chicken wings with hot sauce", new java.math.BigDecimal("299"), "Appetizers"));
            menuItemRepository.save(new MenuItem("Spring Rolls", "Fresh vegetables wrapped in rice paper", new java.math.BigDecimal("199"), "Appetizers"));
            menuItemRepository.save(new MenuItem("Onion Rings", "Crispy battered onion rings", new java.math.BigDecimal("149"), "Appetizers"));
            
            // Main Course
            menuItemRepository.save(new MenuItem("Butter Chicken", "Creamy tomato-based curry with tender chicken", new java.math.BigDecimal("399"), "Main Course"));
            menuItemRepository.save(new MenuItem("Biryani", "Fragrant rice dish with spices and meat", new java.math.BigDecimal("499"), "Main Course"));
            menuItemRepository.save(new MenuItem("Paneer Tikka", "Grilled cottage cheese with Indian spices", new java.math.BigDecimal("349"), "Main Course"));
            menuItemRepository.save(new MenuItem("Fish Curry", "Spicy fish curry with coconut milk", new java.math.BigDecimal("449"), "Main Course"));
            
            // Desserts
            menuItemRepository.save(new MenuItem("Gulab Jamun", "Sweet milk dumplings in sugar syrup", new java.math.BigDecimal("99"), "Desserts"));
            menuItemRepository.save(new MenuItem("Ice Cream", "Vanilla ice cream with chocolate sauce", new java.math.BigDecimal("149"), "Desserts"));
            menuItemRepository.save(new MenuItem("Chocolate Cake", "Rich chocolate cake with cream", new java.math.BigDecimal("199"), "Desserts"));
            
            // Beverages
            menuItemRepository.save(new MenuItem("Masala Chai", "Spiced Indian tea with milk", new java.math.BigDecimal("49"), "Beverages"));
            menuItemRepository.save(new MenuItem("Lassi", "Sweet yogurt-based drink", new java.math.BigDecimal("79"), "Beverages"));
            menuItemRepository.save(new MenuItem("Coca Cola", "Refreshing carbonated drink", new java.math.BigDecimal("59"), "Beverages"));
        }
    }
} 