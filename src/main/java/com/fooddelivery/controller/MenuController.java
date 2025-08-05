package com.fooddelivery.controller;

import com.fooddelivery.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MenuController {
    
    @Autowired
    private MenuService menuService;
    
    @GetMapping("/")
    public String home() {
        return "redirect:/menu";
    }
    
    @GetMapping("/menu")
    public String showMenu(Model model, @RequestParam(required = false) String category,
                          @RequestParam(required = false) String search) {
        
        if (search != null && !search.trim().isEmpty()) {
            model.addAttribute("menuItems", menuService.searchItems(search.trim()));
            model.addAttribute("searchTerm", search);
        } else if (category != null && !category.trim().isEmpty()) {
            model.addAttribute("menuItems", menuService.getItemsByCategory(category));
            model.addAttribute("selectedCategory", category);
        } else {
            model.addAttribute("menuItems", menuService.getAllAvailableItems());
        }
        
        model.addAttribute("categories", menuService.getAllCategories());
        return "menu";
    }
    
    @GetMapping("/menu/category")
    public String showMenuByCategory(@RequestParam String category, Model model) {
        model.addAttribute("menuItems", menuService.getItemsByCategory(category));
        model.addAttribute("categories", menuService.getAllCategories());
        model.addAttribute("selectedCategory", category);
        return "menu";
    }
} 