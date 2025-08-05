package com.fooddelivery.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "firebase_uid", unique = true, nullable = false)
    private String firebaseUid;
    
    @Column(name = "display_name")
    private String displayName;
    
    @Column(name = "email", unique = true, nullable = false)
    private String email;
    
    @Column(name = "phone_number")
    private String phoneNumber;
    
    @Column(name = "profile_image_url")
    private String profileImageUrl;
    
    @Column(name = "default_address")
    private String defaultAddress;
    
    @Column(name = "preferred_payment_method")
    private String preferredPaymentMethod;
    
    @Column(name = "total_orders")
    private Integer totalOrders = 0;
    
    @Column(name = "total_spent")
    private BigDecimal totalSpent = BigDecimal.ZERO;
    
    @Column(name = "created_at")
    private LocalDateTime createdAt;
    
    @Column(name = "last_login")
    private LocalDateTime lastLogin;
    
    @Column(name = "is_active")
    private Boolean isActive = true;
    
    @Column(name = "email_verified")
    private Boolean emailVerified = false;
    
    @OneToMany(mappedBy = "user")
    private List<Cart> carts = new ArrayList<>();
    
    // Constructors
    public User() {
        this.createdAt = LocalDateTime.now();
        this.lastLogin = LocalDateTime.now();
    }
    
    public User(String firebaseUid, String displayName, String email) {
        this();
        this.firebaseUid = firebaseUid;
        this.displayName = displayName;
        this.email = email;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getFirebaseUid() {
        return firebaseUid;
    }
    
    public void setFirebaseUid(String firebaseUid) {
        this.firebaseUid = firebaseUid;
    }
    
    public String getDisplayName() {
        return displayName;
    }
    
    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPhoneNumber() {
        return phoneNumber;
    }
    
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    
    public String getProfileImageUrl() {
        return profileImageUrl;
    }
    
    public void setProfileImageUrl(String profileImageUrl) {
        this.profileImageUrl = profileImageUrl;
    }
    
    public String getDefaultAddress() {
        return defaultAddress;
    }
    
    public void setDefaultAddress(String defaultAddress) {
        this.defaultAddress = defaultAddress;
    }
    
    public String getPreferredPaymentMethod() {
        return preferredPaymentMethod;
    }
    
    public void setPreferredPaymentMethod(String preferredPaymentMethod) {
        this.preferredPaymentMethod = preferredPaymentMethod;
    }
    
    public Integer getTotalOrders() {
        return totalOrders;
    }
    
    public void setTotalOrders(Integer totalOrders) {
        this.totalOrders = totalOrders;
    }
    
    public BigDecimal getTotalSpent() {
        return totalSpent;
    }
    
    public void setTotalSpent(BigDecimal totalSpent) {
        this.totalSpent = totalSpent;
    }
    
    public LocalDateTime getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
    
    public LocalDateTime getLastLogin() {
        return lastLogin;
    }
    
    public void setLastLogin(LocalDateTime lastLogin) {
        this.lastLogin = lastLogin;
    }
    
    public Boolean getIsActive() {
        return isActive;
    }
    
    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }
    
    public Boolean getEmailVerified() {
        return emailVerified;
    }
    
    public void setEmailVerified(Boolean emailVerified) {
        this.emailVerified = emailVerified;
    }
    
    public List<Cart> getCarts() {
        return carts;
    }
    
    public void setCarts(List<Cart> carts) {
        this.carts = carts;
    }
    
    // Business methods
    public void incrementOrderCount() {
        this.totalOrders++;
    }
    
    public void addToTotalSpent(BigDecimal amount) {
        this.totalSpent = this.totalSpent.add(amount);
    }
    
    public void updateLastLogin() {
        this.lastLogin = LocalDateTime.now();
    }
    
    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", firebaseUid='" + firebaseUid + '\'' +
                ", displayName='" + displayName + '\'' +
                ", email='" + email + '\'' +
                ", totalOrders=" + totalOrders +
                ", totalSpent=" + totalSpent +
                '}';
    }
} 