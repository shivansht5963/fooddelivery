package com.fooddelivery.model;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@Entity
@Table(name = "cart_items")
public class CartItem {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "menu_item_id", nullable = false)
    private MenuItem menuItem;
    
    @NotNull(message = "Quantity is required")
    @Min(value = 1, message = "Quantity must be at least 1")
    @Column(nullable = false)
    private Integer quantity;
    
    @Column(name = "session_id")
    private String sessionId;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cart_id")
    private Cart cart;
    
    // Constructors
    public CartItem() {}
    
    public CartItem(MenuItem menuItem, Integer quantity, String sessionId) {
        this.menuItem = menuItem;
        this.quantity = quantity;
        this.sessionId = sessionId;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public MenuItem getMenuItem() {
        return menuItem;
    }
    
    public void setMenuItem(MenuItem menuItem) {
        this.menuItem = menuItem;
    }
    
    public Integer getQuantity() {
        return quantity;
    }
    
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
    
    public String getSessionId() {
        return sessionId;
    }
    
    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }
    
    public Cart getCart() {
        return cart;
    }
    
    public void setCart(Cart cart) {
        this.cart = cart;
    }
    
    // Business methods
    public BigDecimal getSubtotal() {
        if (menuItem != null && quantity != null) {
            return menuItem.getPrice().multiply(BigDecimal.valueOf(quantity));
        }
        return BigDecimal.ZERO;
    }
    
    @Override
    public String toString() {
        return "CartItem{" +
                "id=" + id +
                ", menuItem=" + (menuItem != null ? menuItem.getName() : "null") +
                ", quantity=" + quantity +
                ", sessionId='" + sessionId + '\'' +
                '}';
    }
} 