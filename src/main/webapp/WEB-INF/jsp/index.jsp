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

                    <!-- User Authentication -->
                    <c:choose>
                        <c:when test="${not empty user}">
                            <div class="user-menu">
                                <button class="user-btn" onclick="toggleUserMenu()">
                                    <i class="fas fa-user"></i>
                                    <span class="user-name">${user.displayName}</span>
                                </button>
                                <div class="user-dropdown" id="userDropdown">
                                    <a href="#" onclick="showPage('profile')" class="dropdown-item">
                                        <i class="fas fa-user-circle"></i> Profile
                                    </a>
                                    <a href="#" onclick="logout()" class="dropdown-item">
                                        <i class="fas fa-sign-out-alt"></i> Logout
                                    </a>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <button class="login-btn" onclick="showPage('login')">
                                <i class="fas fa-sign-in-alt"></i>
                                <span>Login</span>
                            </button>
                        </c:otherwise>
                    </c:choose>

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
            <div class="confirmation-wrapper">
                <!-- Success Animation -->
                <div class="confirmation-animation">
                    <div class="success-checkmark">
                        <div class="check-icon">
                            <span class="icon-line line-tip"></span>
                            <span class="icon-line line-long"></span>
                            <div class="icon-circle"></div>
                            <div class="icon-fix"></div>
                        </div>
                    </div>
                </div>

                <!-- Confirmation Header -->
                <div class="confirmation-header">
                    <h1 class="confirmation-title gradient-text">Order Confirmed!</h1>
                    <p class="confirmation-subtitle">Your healthy meal is being prepared with love</p>
                    <div class="confirmation-badge">
                        <i class="fas fa-clock"></i>
                        <span>Estimated Delivery: 30-40 minutes</span>
                    </div>
                </div>

                <!-- Order Details Card -->
                <div class="order-details-card">
                    <div class="order-details-header">
                        <h2 class="order-details-title">Order Details</h2>
                        <div class="order-status">
                            <span class="status-badge preparing">
                                <i class="fas fa-utensils"></i>
                                Preparing
                            </span>
                        </div>
                    </div>
                    <div class="order-details-content" id="orderDetails">
                        <!-- Order details will be populated by JavaScript -->
                    </div>
                </div>

                <!-- Delivery Progress -->
                <div class="delivery-progress">
                    <h3 class="progress-title">Order Progress</h3>
                    <div class="progress-timeline">
                        <div class="timeline-item active">
                            <div class="timeline-icon">
                                <i class="fas fa-check"></i>
                            </div>
                            <div class="timeline-content">
                                <h4>Order Placed</h4>
                                <p>Your order has been received</p>
                            </div>
                        </div>
                        <div class="timeline-item">
                            <div class="timeline-icon">
                                <i class="fas fa-utensils"></i>
                            </div>
                            <div class="timeline-content">
                                <h4>Preparing</h4>
                                <p>Our chefs are cooking your meal</p>
                            </div>
                        </div>
                        <div class="timeline-item">
                            <div class="timeline-icon">
                                <i class="fas fa-motorcycle"></i>
                            </div>
                            <div class="timeline-content">
                                <h4>On the Way</h4>
                                <p>Your food is being delivered</p>
                            </div>
                        </div>
                        <div class="timeline-item">
                            <div class="timeline-icon">
                                <i class="fas fa-home"></i>
                            </div>
                            <div class="timeline-content">
                                <h4>Delivered</h4>
                                <p>Enjoy your healthy meal!</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="confirmation-actions">
                    <button class="btn btn-primary btn-large" onclick="showPage('home')">
                        <i class="fas fa-home"></i>
                        Back to Home
                    </button>
                    <button class="btn btn-outline btn-large" onclick="showPage('menu')">
                        <i class="fas fa-plus"></i>
                        Order More
                    </button>
                </div>

                <!-- Support Section -->
                <div class="support-section">
                    <div class="support-card">
                        <div class="support-icon">
                            <i class="fas fa-headset"></i>
                        </div>
                        <div class="support-content">
                            <h3>Need Help?</h3>
                            <p>Our customer support team is here to help you</p>
                            <div class="support-actions">
                                <a href="tel:+919876543210" class="support-link">
                                    <i class="fas fa-phone"></i>
                                    Call Us
                                </a>
                                <a href="mailto:hello@purehealthyeats.com" class="support-link">
                                    <i class="fas fa-envelope"></i>
                                    Email Us
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- About Page -->
    <div id="about" class="page">
        <div class="container">
            <!-- Hero Section -->
            <div class="about-hero">
                <div class="about-hero-content">
                    <h1 class="about-hero-title gradient-text">Our Story</h1>
                    <p class="about-hero-subtitle">Nourishing lives, one healthy meal at a time</p>
                </div>
                <div class="about-hero-image">
                    <img src="https://images.unsplash.com/photo-1490645935967-10de6ba17061?w=600" alt="Healthy Food Preparation" class="about-hero-img">
                </div>
            </div>

            <!-- Mission Section -->
            <div class="about-section">
                <div class="about-section-content">
                    <div class="about-section-text">
                        <h2 class="section-title gradient-text">Our Mission</h2>
                        <p class="section-description">
                            We are passionate about healthy eating and committed to providing the best organic, nutritious meals. 
                            Our mission is to make healthy eating accessible, delicious, and convenient for everyone.
                        </p>
                        <p class="section-description">
                            We believe that good food should nourish both the body and soul. Every dish is carefully crafted 
                            by our team of nutritionists and chefs, using only the finest organic ingredients sourced from local farms.
                        </p>
                    </div>
                    <div class="about-section-image">
                        <img src="https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500" alt="Fresh Ingredients" class="section-img">
                    </div>
                </div>
            </div>

            <!-- Values Section -->
            <div class="about-section">
                <h2 class="section-title gradient-text text-center">Our Values</h2>
                <div class="values-grid">
                    <div class="value-card">
                        <div class="value-icon">
                            <i class="fas fa-leaf"></i>
                        </div>
                        <h3 class="value-title">Organic & Fresh</h3>
                        <p class="value-description">We use only the finest organic ingredients sourced from trusted local farms.</p>
                    </div>
                    <div class="value-card">
                        <div class="value-icon">
                            <i class="fas fa-heart"></i>
                        </div>
                        <h3 class="value-title">Made with Love</h3>
                        <p class="value-description">Every dish is prepared with care and attention to detail by our expert chefs.</p>
                    </div>
                    <div class="value-card">
                        <div class="value-icon">
                            <i class="fas fa-clock"></i>
                        </div>
                        <h3 class="value-title">Fast & Fresh</h3>
                        <p class="value-description">Your healthy meals are prepared fresh and delivered to your doorstep quickly.</p>
                    </div>
                    <div class="value-card">
                        <div class="value-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <h3 class="value-title">Community First</h3>
                        <p class="value-description">We support local farmers and build a sustainable food ecosystem.</p>
                    </div>
                </div>
            </div>

            <!-- Team Section -->
            <div class="about-section">
                <h2 class="section-title gradient-text text-center">Meet Our Team</h2>
                <div class="team-grid">
                    <div class="team-card">
                        <div class="team-avatar">
                            <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200" alt="Chef" class="team-img">
                        </div>
                        <h3 class="team-name">Chef Sarah</h3>
                        <p class="team-role">Head Chef</p>
                        <p class="team-description">10+ years of experience in healthy cuisine</p>
                    </div>
                    <div class="team-card">
                        <div class="team-avatar">
                            <img src="https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=200" alt="Nutritionist" class="team-img">
                        </div>
                        <h3 class="team-name">Dr. Emily</h3>
                        <p class="team-role">Nutritionist</p>
                        <p class="team-description">Certified nutrition expert with a passion for wellness</p>
                    </div>
                    <div class="team-card">
                        <div class="team-avatar">
                            <img src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=200" alt="Founder" class="team-img">
                        </div>
                        <h3 class="team-name">Alex Chen</h3>
                        <p class="team-role">Founder & CEO</p>
                        <p class="team-description">Dedicated to making healthy eating accessible to all</p>
                    </div>
                </div>
            </div>

            <!-- Stats Section -->
            <div class="about-section">
                <div class="stats-section">
                    <div class="stat-item">
                        <div class="stat-number">10K+</div>
                        <div class="stat-label">Happy Customers</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">50+</div>
                        <div class="stat-label">Healthy Dishes</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">100%</div>
                        <div class="stat-label">Organic Ingredients</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">30min</div>
                        <div class="stat-label">Average Delivery</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact Page -->
    <div id="contact" class="page">
        <div class="container">
            <!-- Hero Section -->
            <div class="contact-hero">
                <div class="contact-hero-content">
                    <h1 class="contact-hero-title gradient-text">Get in Touch</h1>
                    <p class="contact-hero-subtitle">We'd love to hear from you! Reach out to us for any questions, feedback, or just to say hello.</p>
                </div>
            </div>

            <div class="contact-content-wrapper">
                <!-- Contact Form Section -->
                <div class="contact-form-section">
                    <div class="contact-form-card">
                        <h2 class="section-title gradient-text">Send us a Message</h2>
                        <form class="contact-form">
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="contactName">Full Name</label>
                                    <input type="text" id="contactName" class="form-input" placeholder="Enter your full name">
                                </div>
                                <div class="form-group">
                                    <label for="contactEmail">Email</label>
                                    <input type="email" id="contactEmail" class="form-input" placeholder="Enter your email">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="contactSubject">Subject</label>
                                <input type="text" id="contactSubject" class="form-input" placeholder="What's this about?">
                            </div>
                            <div class="form-group">
                                <label for="contactMessage">Message</label>
                                <textarea id="contactMessage" class="form-input" rows="5" placeholder="Tell us more..."></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary btn-full">Send Message</button>
                        </form>
                    </div>
                </div>

                <!-- Contact Info Section -->
                <div class="contact-info-section">
                    <div class="contact-info-card">
                        <h2 class="section-title gradient-text">Contact Information</h2>
                        <div class="contact-info-grid">
                            <div class="contact-info-item">
                                <div class="contact-info-icon">
                                    <i class="fas fa-phone"></i>
                                </div>
                                <div class="contact-info-content">
                                    <h3 class="contact-info-title">Phone</h3>
                                    <p class="contact-info-text">+91 98765 43210</p>
                                    <p class="contact-info-subtext">Mon-Sat: 9:00 AM - 8:00 PM</p>
                                </div>
                            </div>
                            <div class="contact-info-item">
                                <div class="contact-info-icon">
                                    <i class="fas fa-envelope"></i>
                                </div>
                                <div class="contact-info-content">
                                    <h3 class="contact-info-title">Email</h3>
                                    <p class="contact-info-text">hello@purehealthyeats.com</p>
                                    <p class="contact-info-subtext">We'll respond within 24 hours</p>
                                </div>
                            </div>
                            <div class="contact-info-item">
                                <div class="contact-info-icon">
                                    <i class="fas fa-map-marker-alt"></i>
                                </div>
                                <div class="contact-info-content">
                                    <h3 class="contact-info-title">Address</h3>
                                    <p class="contact-info-text">123 Healthy Street, Wellness City, India</p>
                                    <p class="contact-info-subtext">Visit our kitchen anytime!</p>
                                </div>
                            </div>
                            <div class="contact-info-item">
                                <div class="contact-info-icon">
                                    <i class="fas fa-clock"></i>
                                </div>
                                <div class="contact-info-content">
                                    <h3 class="contact-info-title">Business Hours</h3>
                                    <p class="contact-info-text">Monday - Saturday</p>
                                    <p class="contact-info-subtext">9:00 AM - 8:00 PM</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- FAQ Section -->
            <div class="faq-section">
                <h2 class="section-title gradient-text text-center">Frequently Asked Questions</h2>
                <div class="faq-grid">
                    <div class="faq-item">
                        <div class="faq-question">
                            <h3>What are your delivery times?</h3>
                            <i class="fas fa-chevron-down"></i>
                        </div>
                        <div class="faq-answer">
                            <p>We deliver within 30-40 minutes of order placement. For larger orders, delivery may take up to 60 minutes.</p>
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="faq-question">
                            <h3>Do you offer vegetarian options?</h3>
                            <i class="fas fa-chevron-down"></i>
                        </div>
                        <div class="faq-answer">
                            <p>Yes! We have a wide variety of vegetarian and vegan options. All our salads and most main dishes are vegetarian-friendly.</p>
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="faq-question">
                            <h3>Are your ingredients organic?</h3>
                            <i class="fas fa-chevron-down"></i>
                        </div>
                        <div class="faq-answer">
                            <p>Absolutely! We source 100% organic ingredients from local farms and trusted suppliers.</p>
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="faq-question">
                            <h3>What payment methods do you accept?</h3>
                            <i class="fas fa-chevron-down"></i>
                        </div>
                        <div class="faq-answer">
                            <p>We accept cash on delivery, credit/debit cards, and all major digital payment platforms.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Login Page -->
    <div id="login" class="page">
        <div class="container">
            <div class="auth-container">
                <div class="auth-card">
                    <div class="auth-header">
                        <h1 class="auth-title gradient-text">Welcome Back</h1>
                        <p class="auth-subtitle">Sign in to your account to continue</p>
                    </div>
                    
                    <div class="auth-tabs">
                        <button class="auth-tab active" onclick="switchAuthTab('login')">Login</button>
                        <button class="auth-tab" onclick="switchAuthTab('register')">Register</button>
                    </div>
                    
                    <!-- Login Form -->
                    <div id="loginForm" class="auth-form">
                        <div class="form-group">
                            <label for="loginEmail">Email</label>
                            <input type="email" id="loginEmail" class="form-input" placeholder="Enter your email">
                        </div>
                        <div class="form-group">
                            <label for="loginPassword">Password</label>
                            <input type="password" id="loginPassword" class="form-input" placeholder="Enter your password">
                        </div>
                        <button class="btn btn-primary btn-full" onclick="loginWithEmail()">Login</button>
                        
                        <div class="auth-divider">
                            <span>or</span>
                        </div>
                        
                        <button class="btn btn-google btn-full" onclick="loginWithGoogle()">
                            <i class="fab fa-google"></i>
                            Continue with Google
                        </button>
                    </div>
                    
                    <!-- Register Form -->
                    <div id="registerForm" class="auth-form" style="display: none;">
                        <div class="form-group">
                            <label for="registerName">Full Name</label>
                            <input type="text" id="registerName" class="form-input" placeholder="Enter your full name">
                        </div>
                        <div class="form-group">
                            <label for="registerEmail">Email</label>
                            <input type="email" id="registerEmail" class="form-input" placeholder="Enter your email">
                        </div>
                        <div class="form-group">
                            <label for="registerPassword">Password</label>
                            <input type="password" id="registerPassword" class="form-input" placeholder="Enter your password">
                        </div>
                        <button class="btn btn-primary btn-full" onclick="registerWithEmail()">Register</button>
                        
                        <div class="auth-divider">
                            <span>or</span>
                        </div>
                        
                        <button class="btn btn-google btn-full" onclick="loginWithGoogle()">
                            <i class="fab fa-google"></i>
                            Continue with Google
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Profile Page -->
    <div id="profile" class="page">
        <div class="container">
            <div class="profile-container">
                <div class="profile-card">
                    <div class="profile-header">
                        <div class="profile-avatar">
                            <i class="fas fa-user-circle"></i>
                        </div>
                        <h1 class="profile-title gradient-text">My Profile</h1>
                    </div>
                    
                    <div class="profile-content">
                        <div class="profile-section">
                            <h3 class="section-title">Personal Information</h3>
                            <form id="profileForm" class="profile-form">
                                <div class="form-group">
                                    <label for="profileName">Full Name</label>
                                    <input type="text" id="profileName" class="form-input" value="${user.displayName}">
                                </div>
                                <div class="form-group">
                                    <label for="profileEmail">Email</label>
                                    <input type="email" id="profileEmail" class="form-input" value="${user.email}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="profilePhone">Phone Number</label>
                                    <input type="tel" id="profilePhone" class="form-input" value="${user.phoneNumber}">
                                </div>
                                <div class="form-group">
                                    <label for="profileAddress">Default Address</label>
                                    <textarea id="profileAddress" class="form-input" rows="3">${user.defaultAddress}</textarea>
                                </div>
                                <button type="button" class="btn btn-primary" onclick="updateProfile()">Update Profile</button>
                            </form>
                        </div>
                        
                        <div class="profile-section">
                            <h3 class="section-title">Order Statistics</h3>
                            <div class="stats-grid">
                                <div class="stat-card">
                                    <div class="stat-number">${user.totalOrders}</div>
                                    <div class="stat-label">Total Orders</div>
                                </div>
                                <div class="stat-card">
                                    <div class="stat-number">₹${user.totalSpent}</div>
                                    <div class="stat-label">Total Spent</div>
                                </div>
                                <div class="stat-card">
                                    <div class="stat-number">${user.lastLogin}</div>
                                    <div class="stat-label">Last Login</div>
                                </div>
                            </div>
                        </div>
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

    <!-- Firebase SDK -->
    <script src="https://www.gstatic.com/firebasejs/9.1.1/firebase-app-compat.js"></script>
    <script src="https://www.gstatic.com/firebasejs/9.1.1/firebase-auth-compat.js"></script>

    <!-- JavaScript with Spring context -->
    <script src="<c:url value='/js/script.js'/>"></script>
    
    <!-- Initialize Firebase -->
    <script>
        firebase.initializeApp({
            apiKey: "AIzaSyBYqZaHP4-DmzPp7LG046BPRdTPz4_aXhU",
            authDomain: "pure-healthy-eats.firebaseapp.com",
            projectId: "pure-healthy-eats",
            storageBucket: "pure-healthy-eats.firebasestorage.app",
            messagingSenderId: "762868384506",
            appId: "1:762868384506:web:bf8c239a75760fc625ff43",
            measurementId: "G-HTKJ99PTVV"
        });
    </script>
    
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