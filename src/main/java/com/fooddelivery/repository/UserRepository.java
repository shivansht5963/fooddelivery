package com.fooddelivery.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fooddelivery.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    
    Optional<User> findByFirebaseUid(String firebaseUid);
    
    Optional<User> findByEmail(String email);
    
    boolean existsByFirebaseUid(String firebaseUid);
    
    boolean existsByEmail(String email);
} 