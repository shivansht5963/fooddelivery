package com.fooddelivery.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fooddelivery.model.Cart;
import com.fooddelivery.model.CartItem;
import com.fooddelivery.model.MenuItem;
import com.fooddelivery.model.User;
import com.fooddelivery.repository.CartItemRepository;
import com.fooddelivery.repository.CartRepository;

@Service
public class CartService {
    
    @Autowired
    private CartRepository cartRepository;
    
    @Autowired
    private CartItemRepository cartItemRepository;
    
    @Autowired
    private MenuService menuService;
    
    @Autowired
    private UserService userService;
    
    public Cart getOrCreateCart(String sessionId) {
        Optional<Cart> existingCart = cartRepository.findBySessionId(sessionId);
        if (existingCart.isPresent()) {
            return existingCart.get();
        } else {
            Cart newCart = new Cart(sessionId);
            return cartRepository.save(newCart);
        }
    }
    
    public Cart getOrCreateUserCart(String sessionId, User user) {
        Optional<Cart> existingCart = cartRepository.findBySessionId(sessionId);
        if (existingCart.isPresent()) {
            Cart cart = existingCart.get();
            // Link cart to user if not already linked
            if (cart.getUser() == null) {
                cart.setUser(user);
                cartRepository.save(cart);
            }
            return cart;
        } else {
            Cart newCart = new Cart(sessionId, user);
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
    
    public void addItemToUserCart(String sessionId, Long menuItemId, Integer quantity, User user) {
        Cart cart = getOrCreateUserCart(sessionId, user);
        addItemToCart(sessionId, menuItemId, quantity);
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
    
    public Cart getUserCart(String sessionId, User user) {
        return getOrCreateUserCart(sessionId, user);
    }
    
    public void updateCustomerInfo(String sessionId, String customerName, String customerPhone, String deliveryAddress) {
        Cart cart = getOrCreateCart(sessionId);
        cart.setCustomerName(customerName);
        cart.setCustomerPhone(customerPhone);
        cart.setDeliveryAddress(deliveryAddress);
        cartRepository.save(cart);
    }
    
    public void updateUserCartInfo(String sessionId, String customerName, String customerPhone, String deliveryAddress, User user) {
        Cart cart = getOrCreateUserCart(sessionId, user);
        cart.setCustomerName(customerName);
        cart.setCustomerPhone(customerPhone);
        cart.setDeliveryAddress(deliveryAddress);
        cartRepository.save(cart);
    }
    
    public void deleteCart(String sessionId) {
        cartRepository.deleteBySessionId(sessionId);
    }
    
    public void processOrderCompletion(Cart cart) {
        if (cart.getUser() != null) {
            User user = cart.getUser();
            userService.incrementOrderCount(user);
            userService.addToTotalSpent(user, cart.getTotal());
        }
    }
} 