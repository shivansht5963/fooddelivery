package com.fooddelivery.service;

import java.math.BigDecimal;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fooddelivery.model.User;
import com.fooddelivery.repository.UserRepository;

@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    public User createUser(String firebaseUid, String displayName, String email) {
        User user = new User(firebaseUid, displayName, email);
        return userRepository.save(user);
    }
    
    public Optional<User> findByFirebaseUid(String firebaseUid) {
        return userRepository.findByFirebaseUid(firebaseUid);
    }
    
    public Optional<User> findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    
    public User saveUser(User user) {
        return userRepository.save(user);
    }
    
    public boolean existsByFirebaseUid(String firebaseUid) {
        return userRepository.existsByFirebaseUid(firebaseUid);
    }
    
    public boolean existsByEmail(String email) {
        return userRepository.existsByEmail(email);
    }
    
    public void updateLastLogin(User user) {
        user.updateLastLogin();
        userRepository.save(user);
    }
    
    public User updateProfile(User user, String displayName, String phoneNumber, String defaultAddress) {
        user.setDisplayName(displayName);
        user.setPhoneNumber(phoneNumber);
        user.setDefaultAddress(defaultAddress);
        return userRepository.save(user);
    }
    
    public void incrementOrderCount(User user) {
        user.incrementOrderCount();
        userRepository.save(user);
    }
    
    public void addToTotalSpent(User user, BigDecimal amount) {
        user.addToTotalSpent(amount);
        userRepository.save(user);
    }
} 