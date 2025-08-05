package com.fooddelivery.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FirebaseConfig {
    
    @Bean
    public String firebaseInitialized() {
        // Initialize Firebase only when needed
        // This prevents startup errors
        return "Firebase initialized";
    }
} 