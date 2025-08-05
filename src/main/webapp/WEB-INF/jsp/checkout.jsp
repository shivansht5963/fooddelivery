<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Delivery - Checkout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .checkout-form {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 15px;
            color: white;
        }
        .order-summary {
            background: #f8f9fa;
            border-radius: 15px;
        }
        .navbar-brand {
            font-weight: bold;
            color: #2c3e50 !important;
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="/menu">
                <i class="fas fa-utensils me-2"></i>FoodDelivery
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="/menu">
                    <i class="fas fa-home me-1"></i>Menu
                </a>
                <a class="nav-link" href="/cart">
                    <i class="fas fa-shopping-cart me-1"></i>Cart
                    <span class="badge bg-primary">${cart.totalItems}</span>
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2 class="mb-4">
            <i class="fas fa-credit-card me-2"></i>Checkout
        </h2>

        <div class="row">
            <!-- Customer Information Form -->
            <div class="col-lg-8">
                <div class="card checkout-form shadow">
                    <div class="card-header bg-transparent border-0">
                        <h5 class="mb-0 text-white">
                            <i class="fas fa-user me-2"></i>Customer Information
                        </h5>
                    </div>
                    <div class="card-body">
                        <form action="/cart/checkout" method="POST">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="customerName" class="form-label">Full Name *</label>
                                    <input type="text" class="form-control" id="customerName" name="customerName" 
                                           value="${cart.customerName}" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="customerPhone" class="form-label">Phone Number *</label>
                                    <input type="tel" class="form-control" id="customerPhone" name="customerPhone" 
                                           value="${cart.customerPhone}" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="deliveryAddress" class="form-label">Delivery Address *</label>
                                <textarea class="form-control" id="deliveryAddress" name="deliveryAddress" 
                                          rows="3" required>${cart.deliveryAddress}</textarea>
                                <div class="form-text text-white-50">
                                    Please provide complete address including street, city, and postal code.
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="specialInstructions" class="form-label">Special Instructions (Optional)</label>
                                <textarea class="form-control" id="specialInstructions" name="specialInstructions" 
                                          rows="2" placeholder="Any special delivery instructions..."></textarea>
                            </div>
                            <div class="d-flex justify-content-between">
                                <a href="/cart" class="btn btn-outline-light">
                                    <i class="fas fa-arrow-left me-2"></i>Back to Cart
                                </a>
                                <button type="submit" class="btn btn-light">
                                    <i class="fas fa-check me-2"></i>Continue to Review
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Order Summary -->
            <div class="col-lg-4">
                <div class="card order-summary shadow">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">
                            <i class="fas fa-receipt me-2"></i>Order Summary
                        </h5>
                    </div>
                    <div class="card-body">
                        <!-- Cart Items -->
                        <div class="mb-3">
                            <h6>Items:</h6>
                            <c:forEach items="${cartItems}" var="item">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <div>
                                        <span class="fw-bold">${item.menuItem.name}</span>
                                        <br>
                                        <small class="text-muted">Qty: ${item.quantity}</small>
                                    </div>
                                    <span class="text-success">₹${item.subtotal}</span>
                                </div>
                            </c:forEach>
                        </div>
                        
                        <hr>
                        
                        <!-- Price Breakdown -->
                        <div class="d-flex justify-content-between mb-2">
                            <span>Subtotal:</span>
                            <span>₹${cart.subtotal}</span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span>GST (18%):</span>
                            <span>₹${cart.gst}</span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span>Delivery Charge:</span>
                            <span>
                                <c:choose>
                                    <c:when test="${cart.deliveryCharge == 0}">
                                        <span class="text-success">FREE</span>
                                    </c:when>
                                    <c:otherwise>
                                        ₹${cart.deliveryCharge}
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                        <div class="d-flex justify-content-between mb-3">
                            <span>Packaging:</span>
                            <span>₹${cart.packagingCharge}</span>
                        </div>
                        
                        <hr>
                        
                        <div class="d-flex justify-content-between mb-3">
                            <span class="fw-bold fs-5">Total:</span>
                            <span class="fw-bold fs-5 text-primary">₹${cart.total}</span>
                        </div>
                        
                        <div class="alert alert-info small">
                            <i class="fas fa-info-circle me-1"></i>
                            Estimated delivery time: 30-45 minutes
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Form validation
        document.querySelector('form').addEventListener('submit', function(e) {
            const name = document.getElementById('customerName').value.trim();
            const phone = document.getElementById('customerPhone').value.trim();
            const address = document.getElementById('deliveryAddress').value.trim();
            
            if (!name || !phone || !address) {
                e.preventDefault();
                alert('Please fill in all required fields.');
                return false;
            }
            
            // Basic phone validation
            const phoneRegex = /^[0-9]{10}$/;
            if (!phoneRegex.test(phone)) {
                e.preventDefault();
                alert('Please enter a valid 10-digit phone number.');
                return false;
            }
        });
    </script>
</body>
</html> 