package com.fooddelivery.controller;

import com.fooddelivery.model.Cart;
import com.fooddelivery.model.CartItem;
import com.fooddelivery.model.MenuItem;
import com.fooddelivery.service.CartService;
import com.fooddelivery.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/api")
public class ApiController {
    
    @Autowired
    private MenuService menuService;
    
    @Autowired
    private CartService cartService;
    
    @GetMapping("/menu")
    public ResponseEntity<List<MenuItem>> getAllMenuItems() {
        return ResponseEntity.ok(menuService.getAllAvailableItems());
    }
    
    @GetMapping("/menu/category/{category}")
    public ResponseEntity<List<MenuItem>> getMenuItemsByCategory(@PathVariable String category) {
        return ResponseEntity.ok(menuService.getItemsByCategory(category));
    }
    
    @GetMapping("/menu/search")
    public ResponseEntity<List<MenuItem>> searchMenuItems(@RequestParam String query) {
        return ResponseEntity.ok(menuService.searchItems(query));
    }
    
    @GetMapping("/cart")
    public ResponseEntity<Map<String, Object>> getCart(HttpSession session) {
        String sessionId = getSessionId(session);
        Cart cart = cartService.getCart(sessionId);
        List<CartItem> cartItems = cartService.getCartItems(sessionId);
        
        Map<String, Object> response = new HashMap<>();
        response.put("cart", cart);
        response.put("cartItems", cartItems);
        response.put("totalItems", cart.getTotalItems());
        response.put("subtotal", cart.getSubtotal());
        response.put("gst", cart.getGst());
        response.put("deliveryCharge", cart.getDeliveryCharge());
        response.put("packagingCharge", cart.getPackagingCharge());
        response.put("total", cart.getTotal());
        
        return ResponseEntity.ok(response);
    }
    
    @PostMapping("/cart/add")
    public ResponseEntity<Map<String, Object>> addToCart(@RequestParam Long menuItemId,
                                                        @RequestParam(defaultValue = "1") Integer quantity,
                                                        HttpSession session) {
        String sessionId = getSessionId(session);
        cartService.addItemToCart(sessionId, menuItemId, quantity);
        
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Item added to cart successfully");
        
        return ResponseEntity.ok(response);
    }
    
    @PutMapping("/cart/update")
    public ResponseEntity<Map<String, Object>> updateCartItem(@RequestParam Long menuItemId,
                                                             @RequestParam Integer quantity,
                                                             HttpSession session) {
        String sessionId = getSessionId(session);
        cartService.updateItemQuantity(sessionId, menuItemId, quantity);
        
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Cart updated successfully");
        
        return ResponseEntity.ok(response);
    }
    
    @DeleteMapping("/cart/remove")
    public ResponseEntity<Map<String, Object>> removeFromCart(@RequestParam Long menuItemId,
                                                             HttpSession session) {
        String sessionId = getSessionId(session);
        cartService.removeItemFromCart(sessionId, menuItemId);
        
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Item removed from cart successfully");
        
        return ResponseEntity.ok(response);
    }
    
    @DeleteMapping("/cart/clear")
    public ResponseEntity<Map<String, Object>> clearCart(HttpSession session) {
        String sessionId = getSessionId(session);
        cartService.clearCart(sessionId);
        
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Cart cleared successfully");
        
        return ResponseEntity.ok(response);
    }
    
    private String getSessionId(HttpSession session) {
        String sessionId = (String) session.getAttribute("sessionId");
        if (sessionId == null) {
            sessionId = UUID.randomUUID().toString();
            session.setAttribute("sessionId", sessionId);
        }
        return sessionId;
    }
} 