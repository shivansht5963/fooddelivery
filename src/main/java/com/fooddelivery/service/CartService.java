package com.fooddelivery.service;

import com.fooddelivery.model.Cart;
import com.fooddelivery.model.CartItem;
import com.fooddelivery.model.MenuItem;
import com.fooddelivery.repository.CartItemRepository;
import com.fooddelivery.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CartService {
    
    @Autowired
    private CartRepository cartRepository;
    
    @Autowired
    private CartItemRepository cartItemRepository;
    
    @Autowired
    private MenuService menuService;
    
    public Cart getOrCreateCart(String sessionId) {
        Optional<Cart> existingCart = cartRepository.findBySessionId(sessionId);
        if (existingCart.isPresent()) {
            return existingCart.get();
        } else {
            Cart newCart = new Cart(sessionId);
            return cartRepository.save(newCart);
        }
    }
    
    public void addItemToCart(String sessionId, Long menuItemId, Integer quantity) {
        Optional<MenuItem> menuItem = menuService.getItemById(menuItemId);
        if (menuItem.isPresent()) {
            Optional<CartItem> existingItem = cartItemRepository.findBySessionIdAndMenuItemId(sessionId, menuItemId);
            
            if (existingItem.isPresent()) {
                // Update quantity
                CartItem item = existingItem.get();
                item.setQuantity(item.getQuantity() + quantity);
                cartItemRepository.save(item);
            } else {
                // Create new cart item
                CartItem newItem = new CartItem(menuItem.get(), quantity, sessionId);
                cartItemRepository.save(newItem);
            }
        }
    }
    
    public void updateItemQuantity(String sessionId, Long menuItemId, Integer quantity) {
        Optional<CartItem> existingItem = cartItemRepository.findBySessionIdAndMenuItemId(sessionId, menuItemId);
        if (existingItem.isPresent()) {
            CartItem item = existingItem.get();
            if (quantity <= 0) {
                cartItemRepository.delete(item);
            } else {
                item.setQuantity(quantity);
                cartItemRepository.save(item);
            }
        }
    }
    
    public void removeItemFromCart(String sessionId, Long menuItemId) {
        cartItemRepository.deleteBySessionIdAndMenuItemId(sessionId, menuItemId);
    }
    
    public void clearCart(String sessionId) {
        cartItemRepository.deleteBySessionId(sessionId);
    }
    
    public List<CartItem> getCartItems(String sessionId) {
        return cartItemRepository.findBySessionId(sessionId);
    }
    
    public Cart getCart(String sessionId) {
        return getOrCreateCart(sessionId);
    }
    
    public void updateCustomerInfo(String sessionId, String customerName, String customerPhone, String deliveryAddress) {
        Cart cart = getOrCreateCart(sessionId);
        cart.setCustomerName(customerName);
        cart.setCustomerPhone(customerPhone);
        cart.setDeliveryAddress(deliveryAddress);
        cartRepository.save(cart);
    }
    
    public void deleteCart(String sessionId) {
        cartRepository.deleteBySessionId(sessionId);
    }
} 