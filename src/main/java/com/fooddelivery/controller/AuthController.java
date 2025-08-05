package com.fooddelivery.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fooddelivery.model.User;
import com.fooddelivery.service.UserService;

@Controller
@RequestMapping("/auth")
public class AuthController {
    
    @Autowired
    private UserService userService;
    
    @GetMapping("/login")
    public String loginPage() {
        return "index";
    }
    
    @GetMapping("/profile")
    public String profilePage() {
        return "index";
    }
    
    @PostMapping("/register")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> register(@RequestBody Map<String, String> request, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            String firebaseUid = request.get("firebaseUid");
            String displayName = request.get("displayName");
            String email = request.get("email");
            
            if (firebaseUid == null || displayName == null || email == null) {
                response.put("success", false);
                response.put("message", "Missing required fields");
                return ResponseEntity.badRequest().body(response);
            }
            
            // Check if user already exists
            if (userService.existsByFirebaseUid(firebaseUid)) {
                response.put("success", false);
                response.put("message", "User already exists");
                return ResponseEntity.badRequest().body(response);
            }
            
            // Create new user
            User user = userService.createUser(firebaseUid, displayName, email);
            
            // Store in session
            session.setAttribute("firebaseUid", firebaseUid);
            
            response.put("success", true);
            response.put("message", "Registration successful");
            response.put("user", user);
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Registration failed: " + e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }
    
    @PostMapping("/login")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> login(@RequestBody Map<String, String> request, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            String firebaseUid = request.get("firebaseUid");
            String displayName = request.get("displayName");
            String email = request.get("email");
            
            if (firebaseUid == null) {
                response.put("success", false);
                response.put("message", "Missing Firebase UID");
                return ResponseEntity.badRequest().body(response);
            }
            
            // Find existing user
            Optional<User> userOpt = userService.findByFirebaseUid(firebaseUid);
            
            User user;
            if (userOpt.isPresent()) {
                // User exists, update last login
                user = userOpt.get();
                userService.updateLastLogin(user);
            } else {
                // Create new user if doesn't exist
                user = userService.createUser(firebaseUid, displayName, email);
            }
            
            // Store in session
            session.setAttribute("firebaseUid", firebaseUid);
            
            response.put("success", true);
            response.put("message", "Login successful");
            response.put("user", user);
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Login failed: " + e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }
    
    @PostMapping("/logout")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> logout(HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            // Clear session
            session.removeAttribute("firebaseUid");
            session.invalidate();
            
            response.put("success", true);
            response.put("message", "Logout successful");
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Logout failed: " + e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }
    
    @PostMapping("/update-profile")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateProfile(@RequestBody Map<String, String> request, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            String firebaseUid = (String) session.getAttribute("firebaseUid");
            if (firebaseUid == null) {
                response.put("success", false);
                response.put("message", "User not authenticated");
                return ResponseEntity.status(401).body(response);
            }
            
            Optional<User> userOpt = userService.findByFirebaseUid(firebaseUid);
            if (!userOpt.isPresent()) {
                response.put("success", false);
                response.put("message", "User not found");
                return ResponseEntity.status(404).body(response);
            }
            
            User user = userOpt.get();
            String displayName = request.get("displayName");
            String phoneNumber = request.get("phoneNumber");
            String defaultAddress = request.get("defaultAddress");
            
            user = userService.updateProfile(user, displayName, phoneNumber, defaultAddress);
            
            response.put("success", true);
            response.put("message", "Profile updated successfully");
            response.put("user", user);
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Profile update failed: " + e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }
    
    @GetMapping("/user-info")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getUserInfo(HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            String firebaseUid = (String) session.getAttribute("firebaseUid");
            if (firebaseUid == null) {
                response.put("success", false);
                response.put("message", "User not authenticated");
                return ResponseEntity.status(401).body(response);
            }
            
            Optional<User> userOpt = userService.findByFirebaseUid(firebaseUid);
            if (!userOpt.isPresent()) {
                response.put("success", false);
                response.put("message", "User not found");
                return ResponseEntity.status(404).body(response);
            }
            
            User user = userOpt.get();
            
            response.put("success", true);
            response.put("user", user);
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Failed to get user info: " + e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }
} 