<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Delivery - Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .cart-item {
            transition: all 0.3s ease;
        }
        .cart-item:hover {
            background-color: #f8f9fa;
        }
        .quantity-control {
            width: 120px;
        }
        .order-summary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
        }
        .navbar-brand {
            font-weight: bold;
            color: #2c3e50 !important;
        }
        .empty-cart {
            text-align: center;
            padding: 60px 20px;
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
                <a class="nav-link active" href="/cart">
                    <i class="fas fa-shopping-cart me-1"></i>Cart
                    <span class="badge bg-primary" id="cart-count">${cart.totalItems}</span>
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2 class="mb-4">
            <i class="fas fa-shopping-cart me-2"></i>Shopping Cart
        </h2>

        <c:choose>
            <c:when test="${empty cartItems}">
                <div class="empty-cart">
                    <i class="fas fa-shopping-cart fa-4x text-muted mb-3"></i>
                    <h3 class="text-muted">Your cart is empty</h3>
                    <p class="text-muted">Add some delicious items to your cart to get started!</p>
                    <a href="/menu" class="btn btn-primary btn-lg">
                        <i class="fas fa-utensils me-2"></i>Browse Menu
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="row">
                    <!-- Cart Items -->
                    <div class="col-lg-8">
                        <div class="card shadow-sm">
                            <div class="card-header bg-white">
                                <h5 class="mb-0">
                                    <i class="fas fa-list me-2"></i>Cart Items (${cart.totalItems})
                                </h5>
                            </div>
                            <div class="card-body p-0">
                                <c:forEach items="${cartItems}" var="item">
                                    <div class="cart-item p-3 border-bottom">
                                        <div class="row align-items-center">
                                            <div class="col-md-6">
                                                <h6 class="mb-1">${item.menuItem.name}</h6>
                                                <p class="text-muted mb-0 small">${item.menuItem.description}</p>
                                                <span class="badge bg-secondary">${item.menuItem.category}</span>
                                            </div>
                                            <div class="col-md-2 text-center">
                                                <span class="fw-bold text-success">₹${item.menuItem.price}</span>
                                            </div>
                                            <div class="col-md-2">
                                                <form action="/cart/update" method="POST" class="d-flex align-items-center">
                                                    <input type="hidden" name="menuItemId" value="${item.menuItem.id}">
                                                    <input type="number" name="quantity" value="${item.quantity}" 
                                                           min="1" max="10" class="form-control quantity-control">
                                                    <button type="submit" class="btn btn-sm btn-outline-primary ms-2">
                                                        <i class="fas fa-sync-alt"></i>
                                                    </button>
                                                </form>
                                            </div>
                                            <div class="col-md-1 text-center">
                                                <span class="fw-bold">₹${item.subtotal}</span>
                                            </div>
                                            <div class="col-md-1 text-center">
                                                <form action="/cart/remove" method="POST" style="display: inline;">
                                                    <input type="hidden" name="menuItemId" value="${item.menuItem.id}">
                                                    <button type="submit" class="btn btn-sm btn-outline-danger" 
                                                            onclick="return confirm('Remove this item from cart?')">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="card-footer bg-white">
                                <form action="/cart/clear" method="POST" class="d-inline">
                                    <button type="submit" class="btn btn-outline-danger" 
                                            onclick="return confirm('Clear all items from cart?')">
                                        <i class="fas fa-trash me-2"></i>Clear Cart
                                    </button>
                                </form>
                                <a href="/menu" class="btn btn-outline-primary float-end">
                                    <i class="fas fa-plus me-2"></i>Add More Items
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Order Summary -->
                    <div class="col-lg-4">
                        <div class="card order-summary shadow">
                            <div class="card-header bg-transparent border-0">
                                <h5 class="mb-0 text-white">
                                    <i class="fas fa-receipt me-2"></i>Order Summary
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
                                <div class="d-flex justify-content-between mb-2">
                                    <span>Packaging:</span>
                                    <span>₹${cart.packagingCharge}</span>
                                </div>
                                <hr class="border-white">
                                <div class="d-flex justify-content-between mb-3">
                                    <span class="fw-bold fs-5">Total:</span>
                                    <span class="fw-bold fs-5">₹${cart.total}</span>
                                </div>
                                
                                <c:if test="${cart.deliveryCharge > 0}">
                                    <div class="alert alert-info small">
                                        <i class="fas fa-info-circle me-1"></i>
                                        Add ₹${500 - cart.subtotal} more for FREE delivery!
                                    </div>
                                </c:if>
                                
                                <a href="/cart/checkout" class="btn btn-light btn-lg w-100">
                                    <i class="fas fa-credit-card me-2"></i>Proceed to Checkout
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 