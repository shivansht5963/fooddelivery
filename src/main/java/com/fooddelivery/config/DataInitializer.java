package com.fooddelivery.config;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.fooddelivery.model.MenuItem;
import com.fooddelivery.service.MenuService;

@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private MenuService menuService;

    @Override
    public void run(String... args) throws Exception {
        // Check if data already exists
        if (menuService.getAllAvailableItems().isEmpty()) {
            initializeSampleData();
        }
    }

    private void initializeSampleData() {
        // Salads
        MenuItem item1 = new MenuItem("Mediterranean Quinoa Bowl", 
            "Fresh quinoa with cucumber, tomatoes, olives, and feta cheese", 
            new BigDecimal("299.0"), "salads");
        item1.setImageUrl("https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400");
        menuService.saveItem(item1);
        
        MenuItem item2 = new MenuItem("Kale Caesar Salad", 
            "Nutrient-rich kale with parmesan, croutons, and light caesar dressing", 
            new BigDecimal("249.0"), "salads");
        item2.setImageUrl("https://images.unsplash.com/photo-1540420773420-3366772f4999?w=400");
        menuService.saveItem(item2);
        
        MenuItem item3 = new MenuItem("Rainbow Power Bowl", 
            "Mixed greens, roasted vegetables, avocado, and tahini dressing", 
            new BigDecimal("329.0"), "salads");
        item3.setImageUrl("https://images.unsplash.com/photo-1511690743698-d9d85f2fbf38?w=400");
        menuService.saveItem(item3);

        // Healthy Mains
        MenuItem item4 = new MenuItem("Grilled Salmon Bowl", 
            "Omega-3 rich salmon with brown rice, steamed broccoli, and lemon", 
            new BigDecimal("449.0"), "healthy-mains");
        item4.setImageUrl("https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=400");
        menuService.saveItem(item4);
        
        MenuItem item5 = new MenuItem("Chickpea Buddha Bowl", 
            "Protein-packed chickpeas with roasted sweet potato and tahini", 
            new BigDecimal("349.0"), "healthy-mains");
        item5.setImageUrl("https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400");
        menuService.saveItem(item5);
        
        MenuItem item6 = new MenuItem("Zucchini Noodle Pasta", 
            "Spiralized zucchini with cherry tomatoes and basil pesto", 
            new BigDecimal("279.0"), "healthy-mains");
        item6.setImageUrl("https://images.unsplash.com/photo-1594756202469-d0d29ca1bdb1?w=400");
        menuService.saveItem(item6);
        
        MenuItem item7 = new MenuItem("Quinoa Stuffed Bell Peppers", 
            "Colorful bell peppers stuffed with quinoa, vegetables, and herbs", 
            new BigDecimal("329.0"), "healthy-mains");
        item7.setImageUrl("https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400");
        menuService.saveItem(item7);

        // Healthy Desserts
        MenuItem item8 = new MenuItem("Chia Pudding Bowl", 
            "Vanilla chia pudding with fresh berries and coconut flakes", 
            new BigDecimal("179.0"), "healthy-desserts");
        item8.setImageUrl("https://images.unsplash.com/photo-1511690656952-34342bb7c2f2?w=400");
        menuService.saveItem(item8);
        
        MenuItem item9 = new MenuItem("Acai Bowl", 
            "Antioxidant-rich acai bowl topped with granola and fresh fruit", 
            new BigDecimal("229.0"), "healthy-desserts");
        item9.setImageUrl("https://images.unsplash.com/photo-1511690743698-d9d85f2fbf38?w=400");
        menuService.saveItem(item9);
        
        MenuItem item10 = new MenuItem("Raw Energy Balls", 
            "Dates, nuts, and seeds rolled into nutritious energy balls", 
            new BigDecimal("149.0"), "healthy-desserts");
        item10.setImageUrl("https://images.unsplash.com/photo-1511690656952-34342bb7c2f2?w=400");
        menuService.saveItem(item10);

        // Fresh Juices
        MenuItem item11 = new MenuItem("Green Detox Juice", 
            "Spinach, kale, cucumber, and apple for a healthy boost", 
            new BigDecimal("149.0"), "fresh-juices");
        item11.setImageUrl("https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=400");
        menuService.saveItem(item11);
        
        MenuItem item12 = new MenuItem("Berry Blast Smoothie", 
            "Mixed berries with almond milk and chia seeds", 
            new BigDecimal("199.0"), "fresh-juices");
        item12.setImageUrl("https://images.unsplash.com/photo-1553530666-ba11a7da3888?w=400");
        menuService.saveItem(item12);
        
        MenuItem item13 = new MenuItem("Tropical Paradise Juice", 
            "Pineapple, mango, and coconut water for a tropical treat", 
            new BigDecimal("179.0"), "fresh-juices");
        item13.setImageUrl("https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=400");
        menuService.saveItem(item13);

        System.out.println("Sample menu data initialized successfully!");
    }
} 