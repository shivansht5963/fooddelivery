package com.fooddelivery.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fooddelivery.model.Cart;
import com.fooddelivery.model.CartItem;
import com.fooddelivery.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @GetMapping
    public String showCart(Model model, HttpSession session) {
        String sessionId = getSessionId(session);
        Cart cart = cartService.getOrCreateCart(sessionId);
        List<CartItem> cartItems = cartService.getCartItems(sessionId);
        
        model.addAttribute("cart", cart);
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("currentYear", java.time.Year.now().getValue());
        
        return "index";
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam Long menuItemId, 
                           @RequestParam(defaultValue = "1") int quantity,
                           HttpSession session, 
                           RedirectAttributes redirectAttributes) {
        String sessionId = getSessionId(session);
        cartService.addItemToCart(sessionId, menuItemId, quantity);
        
        redirectAttributes.addFlashAttribute("message", "Item added to cart successfully!");
        return "redirect:/menu";
    }

    @PostMapping("/update")
    public String updateQuantity(@RequestParam Long cartItemId,
                                @RequestParam int quantity,
                                HttpSession session) {
        String sessionId = getSessionId(session);
        cartService.updateItemQuantity(sessionId, cartItemId, quantity);
        return "redirect:/cart";
    }

    @PostMapping("/remove")
    public String removeFromCart(@RequestParam Long cartItemId,
                                HttpSession session) {
        String sessionId = getSessionId(session);
        cartService.removeItemFromCart(sessionId, cartItemId);
        return "redirect:/cart";
    }

    @PostMapping("/clear")
    public String clearCart(HttpSession session) {
        String sessionId = getSessionId(session);
        cartService.clearCart(sessionId);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String checkout(Model model, HttpSession session) {
        String sessionId = getSessionId(session);
        Cart cart = cartService.getCart(sessionId);
        List<CartItem> cartItems = cartService.getCartItems(sessionId);
        
        if (cartItems.isEmpty()) {
            return "redirect:/cart";
        }
        
        model.addAttribute("cart", cart);
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("currentYear", java.time.Year.now().getValue());
        
        return "index";
    }

    @PostMapping("/order-confirmation")
    public String orderConfirmation(@RequestParam String customerName,
                                   @RequestParam String customerPhone,
                                   @RequestParam String deliveryAddress,
                                   Model model, 
                                   HttpSession session) {
        String sessionId = getSessionId(session);
        Cart cart = cartService.getCart(sessionId);
        
        // Update customer information
        cartService.updateCustomerInfo(sessionId, customerName, customerPhone, deliveryAddress);
        
        // Clear cart after order confirmation
        cartService.clearCart(sessionId);
        
        model.addAttribute("orderDetails", cart);
        model.addAttribute("currentYear", java.time.Year.now().getValue());
        
        return "index";
    }

    private String getSessionId(HttpSession session) {
        String sessionId = (String) session.getAttribute("cartSessionId");
        if (sessionId == null) {
            sessionId = java.util.UUID.randomUUID().toString();
            session.setAttribute("cartSessionId", sessionId);
        }
        return sessionId;
    }
} 