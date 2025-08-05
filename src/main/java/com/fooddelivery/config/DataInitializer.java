package com.fooddelivery.config;

import com.fooddelivery.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class DataInitializer implements CommandLineRunner {
    
    @Autowired
    private MenuService menuService;
    
    @Override
    public void run(String... args) throws Exception {
        // Initialize sample menu data
        menuService.initializeSampleData();
        System.out.println("Sample menu data initialized successfully!");
    }
} 