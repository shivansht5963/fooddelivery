package com.fooddelivery.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fooddelivery.model.MenuItem;
import com.fooddelivery.model.User;
import com.fooddelivery.service.MenuService;
import com.fooddelivery.service.UserService;

@Controller
public class MenuController {

    @Autowired
    private MenuService menuService;
    
    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String home(Model model, HttpSession session) {
        // Add current year for footer
        model.addAttribute("currentYear", java.time.Year.now().getValue());
        
        // Add menu items as JSON for JavaScript
        List<MenuItem> menuItems = menuService.getAllAvailableItems();
        String menuItemsJson = convertToJson(menuItems);
        model.addAttribute("menuItemsJson", menuItemsJson);
        
        // Add user information
        User user = getCurrentUser(session);
        model.addAttribute("user", user);
        
        return "index";
    }

    @GetMapping("/menu")
    public String menu(Model model, HttpSession session) {
        List<MenuItem> menuItems = menuService.getAllAvailableItems();
        List<String> categories = menuService.getAllCategories();
        
        model.addAttribute("menuItems", menuItems);
        model.addAttribute("categories", categories);
        model.addAttribute("currentYear", java.time.Year.now().getValue());
        
        // Add menu items as JSON for JavaScript
        String menuItemsJson = convertToJson(menuItems);
        model.addAttribute("menuItemsJson", menuItemsJson);
        
        // Add user information
        User user = getCurrentUser(session);
        model.addAttribute("user", user);
        
        return "index";
    }

    @GetMapping("/menu/category")
    public String menuByCategory(@RequestParam String category, Model model, HttpSession session) {
        List<MenuItem> menuItems = menuService.getItemsByCategory(category);
        List<String> categories = menuService.getAllCategories();
        
        model.addAttribute("menuItems", menuItems);
        model.addAttribute("categories", categories);
        model.addAttribute("selectedCategory", category);
        model.addAttribute("currentYear", java.time.Year.now().getValue());
        
        // Add menu items as JSON for JavaScript
        String menuItemsJson = convertToJson(menuItems);
        model.addAttribute("menuItemsJson", menuItemsJson);
        
        // Add user information
        User user = getCurrentUser(session);
        model.addAttribute("user", user);
        
        return "index";
    }

    // Helper method to convert menu items to JSON
    private String convertToJson(List<MenuItem> menuItems) {
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < menuItems.size(); i++) {
            MenuItem item = menuItems.get(i);
            json.append("{");
            json.append("\"id\":").append(item.getId()).append(",");
            json.append("\"name\":\"").append(escapeJson(item.getName())).append("\",");
            json.append("\"description\":\"").append(escapeJson(item.getDescription())).append("\",");
            json.append("\"price\":").append(item.getPrice()).append(",");
            json.append("\"imageUrl\":\"").append(escapeJson(item.getImageUrl())).append("\",");
            json.append("\"category\":\"").append(escapeJson(item.getCategory())).append("\",");
            json.append("\"available\":").append(item.isAvailable());
            json.append("}");
            if (i < menuItems.size() - 1) {
                json.append(",");
            }
        }
        json.append("]");
        return json.toString();
    }

    // Helper method to escape JSON strings
    private String escapeJson(String str) {
        if (str == null) return "";
        return str.replace("\\", "\\\\")
                 .replace("\"", "\\\"")
                 .replace("\n", "\\n")
                 .replace("\r", "\\r")
                 .replace("\t", "\\t");
    }
    
    private User getCurrentUser(HttpSession session) {
        String firebaseUid = (String) session.getAttribute("firebaseUid");
        if (firebaseUid != null) {
            Optional<User> userOpt = userService.findByFirebaseUid(firebaseUid);
            return userOpt.orElse(null);
        }
        return null;
    }
} 