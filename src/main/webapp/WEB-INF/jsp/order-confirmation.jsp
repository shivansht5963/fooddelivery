<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Delivery - Order Confirmation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .confirmation-header {
            background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
            color: white;
            border-radius: 15px;
        }
        .order-details {
            background: #f8f9fa;
            border-radius: 15px;
        }
        .navbar-brand {
            font-weight: bold;
            color: #2c3e50 !important;
        }
        .success-icon {
            font-size: 4rem;
            color: #2ecc71;
        }
        .order-item {
            border-left: 4px solid #2ecc71;
            padding-left: 15px;
            margin-bottom: 10px;
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
        <!-- Order Confirmation Header -->
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card confirmation-header shadow text-center">
                    <div class="card-body py-5">
                        <i class="fas fa-check-circle success-icon mb-3"></i>
                        <h2 class="mb-3">Order Confirmed!</h2>
                        <p class="mb-0 fs-5">Thank you for your order. We're preparing your delicious food!</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <!-- Order Details -->
            <div class="col-lg-8">
                <div class="card order-details shadow">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">
                            <i class="fas fa-receipt me-2"></i>Order Details
                        </h5>
                    </div>
                    <div class="card-body">
                        <!-- Customer Information -->
                        <div class="row mb-4">
                            <div class="col-md-6">
                                <h6 class="text-muted">Customer Information</h6>
                                <p class="mb-1"><strong>Name:</strong> ${cart.customerName}</p>
                                <p class="mb-1"><strong>Phone:</strong> ${cart.customerPhone}</p>
                                <p class="mb-0"><strong>Address:</strong> ${cart.deliveryAddress}</p>
                            </div>
                            <div class="col-md-6">
                                <h6 class="text-muted">Order Information</h6>
                                <p class="mb-1"><strong>Order ID:</strong> #${cart.id}</p>
                                <p class="mb-1"><strong>Date:</strong> <fmt:formatDate value="<%= new java.util.Date() %>" pattern="dd/MM/yyyy HH:mm"/></p>
                                <p class="mb-0"><strong>Status:</strong> <span class="badge bg-warning">Preparing</span></p>
                            </div>
                        </div>

                        <!-- Order Items -->
                        <h6 class="text-muted mb-3">Order Items</h6>
                        <c:forEach items="${cartItems}" var="item">
                            <div class="order-item">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <span class="fw-bold">${item.menuItem.name}</span>
                                        <br>
                                        <small class="text-muted">${item.menuItem.description}</small>
                                    </div>
                                    <div class="text-end">
                                        <span class="fw-bold">₹${item.menuItem.price} × ${item.quantity}</span>
                                        <br>
                                        <span class="text-success fw-bold">₹${item.subtotal}</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- Order Summary -->
            <div class="col-lg-4">
                <div class="card shadow">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">
                            <i class="fas fa-calculator me-2"></i>Order Summary
                        </h5>
                    </div>
                    <div class="card-body">
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
                    </div>
                </div>

                <!-- Delivery Information -->
                <div class="card shadow mt-3">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">
                            <i class="fas fa-truck me-2"></i>Delivery Information
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="d-flex align-items-center mb-2">
                            <i class="fas fa-clock text-warning me-2"></i>
                            <span><strong>Estimated Delivery:</strong> 30-45 minutes</span>
                        </div>
                        <div class="d-flex align-items-center mb-2">
                            <i class="fas fa-map-marker-alt text-danger me-2"></i>
                            <span><strong>Delivery Address:</strong></span>
                        </div>
                        <p class="text-muted small ms-4">${cart.deliveryAddress}</p>
                        
                        <div class="alert alert-info small">
                            <i class="fas fa-info-circle me-1"></i>
                            We'll send you SMS updates about your order status.
                        </div>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="card shadow mt-3">
                    <div class="card-body">
                        <form action="/cart/order-confirmation" method="POST">
                            <button type="submit" class="btn btn-success w-100 mb-2">
                                <i class="fas fa-check me-2"></i>Confirm Order
                            </button>
                        </form>
                        <a href="/cart" class="btn btn-outline-secondary w-100">
                            <i class="fas fa-edit me-2"></i>Modify Order
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 