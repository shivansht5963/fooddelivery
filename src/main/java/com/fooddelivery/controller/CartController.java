package com.fooddelivery.controller;

import com.fooddelivery.service.CartService;
import com.fooddelivery.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.UUID;

@Controller
@RequestMapping("/cart")
public class CartController {
    
    @Autowired
    private CartService cartService;
    
    @Autowired
    private MenuService menuService;
    
    @GetMapping
    public String showCart(Model model, HttpSession session) {
        String sessionId = getSessionId(session);
        model.addAttribute("cart", cartService.getCart(sessionId));
        model.addAttribute("cartItems", cartService.getCartItems(sessionId));
        return "cart";
    }
    
    @PostMapping("/add")
    public String addToCart(@RequestParam Long menuItemId, 
                           @RequestParam(defaultValue = "1") Integer quantity,
                           HttpSession session) {
        String sessionId = getSessionId(session);
        cartService.addItemToCart(sessionId, menuItemId, quantity);
        return "redirect:/cart";
    }
    
    @PostMapping("/update")
    public String updateQuantity(@RequestParam Long menuItemId,
                                @RequestParam Integer quantity,
                                HttpSession session) {
        String sessionId = getSessionId(session);
        cartService.updateItemQuantity(sessionId, menuItemId, quantity);
        return "redirect:/cart";
    }
    
    @PostMapping("/remove")
    public String removeItem(@RequestParam Long menuItemId, HttpSession session) {
        String sessionId = getSessionId(session);
        cartService.removeItemFromCart(sessionId, menuItemId);
        return "redirect:/cart";
    }
    
    @PostMapping("/clear")
    public String clearCart(HttpSession session) {
        String sessionId = getSessionId(session);
        cartService.clearCart(sessionId);
        return "redirect:/cart";
    }
    
    @GetMapping("/checkout")
    public String showCheckout(Model model, HttpSession session) {
        String sessionId = getSessionId(session);
        model.addAttribute("cart", cartService.getCart(sessionId));
        model.addAttribute("cartItems", cartService.getCartItems(sessionId));
        return "checkout";
    }
    
    @PostMapping("/checkout")
    public String processCheckout(@RequestParam String customerName,
                                 @RequestParam String customerPhone,
                                 @RequestParam String deliveryAddress,
                                 HttpSession session) {
        String sessionId = getSessionId(session);
        cartService.updateCustomerInfo(sessionId, customerName, customerPhone, deliveryAddress);
        return "redirect:/cart/order-confirmation";
    }
    
    @GetMapping("/order-confirmation")
    public String showOrderConfirmation(Model model, HttpSession session) {
        String sessionId = getSessionId(session);
        model.addAttribute("cart", cartService.getCart(sessionId));
        model.addAttribute("cartItems", cartService.getCartItems(sessionId));
        return "order-confirmation";
    }
    
    @PostMapping("/order-confirmation")
    public String confirmOrder(HttpSession session) {
        String sessionId = getSessionId(session);
        cartService.deleteCart(sessionId);
        session.invalidate();
        return "redirect:/menu?order=success";
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