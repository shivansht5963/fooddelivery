<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pure Healthy Eats - Fresh, Nutritious & Delicious</title>
    
    <!-- Static resources with Spring context -->
    <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar">
        <div class="container">
            <div class="nav-content">
                <!-- Logo -->
                <a href="<c:url value='/'/>" class="nav-logo" onclick="showPage('home')">
                    <img src="https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=80" alt="Pure Healthy Eats Logo" class="logo-img">
                </a>

                <!-- Desktop Navigation -->
                <div class="nav-links desktop-nav">
                    <a href="<c:url value='/menu'/>" class="nav-link" onclick="showPage('menu')">Menu</a>
                    <a href="#about" class="nav-link" onclick="showPage('about')">About</a>
                    <a href="#contact" class="nav-link" onclick="showPage('contact')">Contact</a>
                </div>

                <!-- Actions -->
                <div class="nav-actions">
                    <button class="search-btn">
                        <i class="fas fa-search"></i>
                    </button>
                    
                    <button class="cart-btn" onclick="showPage('cart')">
                        <i class="fas fa-shopping-cart"></i>
                        <span class="cart-badge" id="cartBadge">0</span>
                    </button>

                    <!-- Mobile menu button -->
                    <button class="mobile-menu-btn" onclick="toggleMobileMenu()">
                        <i class="fas fa-bars"></i>
                    </button>
                </div>
            </div>

            <!-- Mobile Navigation -->
            <div class="mobile-nav" id="mobileNav">
                <div class="mobile-nav-content">
                    <a href="<c:url value='/menu'/>" class="mobile-nav-link" onclick="showPage('menu'); toggleMobileMenu()">Menu</a>
                    <a href="#about" class="mobile-nav-link" onclick="showPage('about'); toggleMobileMenu()">About</a>
                    <a href="#contact" class="mobile-nav-link" onclick="showPage('contact'); toggleMobileMenu()">Contact</a>
                    <div class="mobile-search">
                        <button class="search-btn">
                            <i class="fas fa-search"></i>
                            <span>Search</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <!-- Home Page -->
    <div id="home" class="page active">
        <section class="hero">
            <div class="container">
                <div class="hero-content">
                    <div class="hero-text">
                        <h1 class="hero-title">
                            <span class="gradient-text">Pure Healthy Eats</span>
                            <br>
                            <span class="hero-subtitle">Fresh, Nutritious & Delicious</span>
                        </h1>
                        <p class="hero-description">
                            Nourish your body with our farm-fresh salads, organic juices, and wholesome meals. 
                            Every bite is packed with nutrients and love for your wellbeing.
                        </p>
                        <div class="hero-buttons">
                            <button class="btn btn-primary" onclick="showPage('menu')">Order Now</button>
                            <button class="btn btn-outline">View Menu</button>
                        </div>
                    </div>
                    
                    <div class="hero-image">
                        <div class="image-container">
                            <img src="https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=600" alt="Fresh healthy salad bowl" class="hero-img">
                            <div class="image-overlay"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="features">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title gradient-text">Why Choose Pure Healthy Eats?</h2>
                    <p class="section-description">
                        We're committed to nourishing your body with the purest, most nutritious ingredients
                    </p>
                </div>

                <div class="features-grid">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-utensils"></i>
                        </div>
                        <h3 class="feature-title">Farm-Fresh Organic</h3>
                        <p class="feature-description">We source only the finest organic ingredients from local farms for maximum nutrition</p>
                    </div>
                    
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-clock"></i>
                        </div>
                        <h3 class="feature-title">Quick & Fresh</h3>
                        <p class="feature-description">Get your healthy meals delivered fresh in 30-40 minutes</p>
                    </div>
                    
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-truck"></i>
                        </div>
                        <h3 class="feature-title">Free Healthy Delivery</h3>
                        <p class="feature-description">Free delivery on orders above ₹400. Supporting your healthy lifestyle!</p>
                    </div>
                    
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-star"></i>
                        </div>
                        <h3 class="feature-title">Nutritionist Approved</h3>
                        <p class="feature-description">All our recipes are crafted and approved by certified nutritionists</p>
                    </div>
                </div>
            </div>
        </section>

        <section class="cta">
            <div class="container">
                <div class="cta-content">
                    <h2 class="cta-title">Ready to Order?</h2>
                    <p class="cta-description">
                        Explore our nutritious menu and start your healthy eating journey today
                    </p>
                    <button class="btn btn-secondary" onclick="showPage('menu')">Explore Menu</button>
                </div>
            </div>
        </section>
    </div>

    <!-- Menu Page -->
    <div id="menu" class="page">
        <div class="container">
            <div class="page-header">
                <h1 class="page-title gradient-text">Our Menu</h1>
                <p class="page-description">
                    Discover our delicious selection of appetizers, main courses, desserts, and beverages
                </p>
            </div>

            <!-- Search Bar -->
            <div class="search-container">
                <div class="search-box">
                    <i class="fas fa-search search-icon"></i>
                    <input type="text" id="searchInput" placeholder="Search for dishes..." class="search-input">
                </div>
            </div>

            <!-- Category Filters -->
            <div class="category-filters">
                <button class="category-btn active" data-category="all">All Items</button>
                <button class="category-btn" data-category="salads">
                    <span class="category-icon">🥗</span>
                    Fresh Salads
                </button>
                <button class="category-btn" data-category="healthy-mains">
                    <span class="category-icon">🥙</span>
                    Healthy Mains
                </button>
                <button class="category-btn" data-category="healthy-desserts">
                    <span class="category-icon">🫐</span>
                    Guilt-Free Desserts
                </button>
                <button class="category-btn" data-category="fresh-juices">
                    <span class="category-icon">🥤</span>
                    Fresh Juices
                </button>
            </div>

            <!-- Menu Items Grid -->
            <div class="menu-grid" id="menuGrid">
                <!-- Menu items will be populated by JavaScript -->
            </div>
        </div>
    </div>

    <!-- Cart Page -->
    <div id="cart" class="page">
        <div class="container">
            <h1 class="page-title gradient-text">Your Cart</h1>
            
            <div class="cart-content" id="cartContent">
                <!-- Cart content will be populated by JavaScript -->
            </div>
        </div>
    </div>

    <!-- Checkout Page -->
    <div id="checkout" class="page">
        <div class="container">
            <h1 class="page-title gradient-text">Checkout</h1>
            
            <div class="checkout-content">
                <div class="checkout-form">
                    <h2>Delivery Information</h2>
                    <form id="checkoutForm">
                        <div class="form-group">
                            <label for="name">Full Name</label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <input type="tel" id="phone" name="phone" required>
                        </div>
                        <div class="form-group">
                            <label for="address">Delivery Address</label>
                            <textarea id="address" name="address" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="payment">Payment Method</label>
                            <select id="payment" name="payment" required>
                                <option value="">Select payment method</option>
                                <option value="cod">Cash on Delivery</option>
                                <option value="card">Credit/Debit Card</option>
                                <option value="upi">UPI</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Place Order</button>
                    </form>
                </div>
                
                <div class="order-summary">
                    <h2>Order Summary</h2>
                    <div id="checkoutSummary">
                        <!-- Order summary will be populated by JavaScript -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Order Confirmation Page -->
    <div id="orderConfirmation" class="page">
        <div class="container">
            <div class="confirmation-content">
                <div class="confirmation-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <h1 class="confirmation-title">Order Confirmed!</h1>
                <p class="confirmation-message">
                    Thank you for your order. We're preparing your healthy meal with love!
                </p>
                <div class="order-details" id="orderDetails">
                    <!-- Order details will be populated by JavaScript -->
                </div>
                <div class="confirmation-buttons">
                    <button class="btn btn-primary" onclick="showPage('home')">Back to Home</button>
                    <button class="btn btn-outline" onclick="showPage('menu')">Order More</button>
                </div>
            </div>
        </div>
    </div>

    <!-- About Page -->
    <div id="about" class="page">
        <div class="container">
            <h1 class="page-title gradient-text">About Us</h1>
            <div class="about-content">
                <p>We are passionate about healthy eating and committed to providing the best organic, nutritious meals.</p>
                <p>Our mission is to make healthy eating accessible, delicious, and convenient for everyone. We believe that good food should nourish both the body and soul.</p>
                <p>Every dish is carefully crafted by our team of nutritionists and chefs, using only the finest organic ingredients sourced from local farms.</p>
            </div>
        </div>
    </div>

    <!-- Contact Page -->
    <div id="contact" class="page">
        <div class="container">
            <h1 class="page-title gradient-text">Contact Us</h1>
            <div class="contact-content">
                <p>Get in touch with us for any questions or feedback.</p>
                <div class="contact-info">
                    <div class="contact-item">
                        <i class="fas fa-phone"></i>
                        <span>+91 98765 43210</span>
                    </div>
                    <div class="contact-item">
                        <i class="fas fa-envelope"></i>
                        <span>hello@purehealthyeats.com</span>
                    </div>
                    <div class="contact-item">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>123 Healthy Street, Wellness City, India</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-logo">
                    <img src="https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=80" alt="Pure Healthy Eats Logo" class="footer-logo-img">
                </div>
                <p class="footer-text">
                    © ${currentYear} Pure Healthy Eats. All rights reserved. Made with 🌱 for health enthusiasts.
                </p>
            </div>
        </div>
    </footer>

    <!-- Toast Notifications -->
    <div id="toastContainer" class="toast-container"></div>

    <!-- JavaScript with Spring context -->
    <script src="<c:url value='/js/script.js'/>"></script>
    
    <!-- Pass server-side data to JavaScript -->
    <script>
        // Pass server-side data to JavaScript
        const serverMenuItems = ${menuItemsJson != null ? menuItemsJson : '[]'};
        const currentYear = ${currentYear != null ? currentYear : 'new Date().getFullYear()'};
        
        // Initialize with server data
        window.serverData = {
            menuItems: serverMenuItems,
            currentYear: currentYear
        };
        
        // Override menu items if server data is available
        if (serverMenuItems && serverMenuItems.length > 0) {
            menuItems = serverMenuItems;
        }
    </script>
</body>
</html> 