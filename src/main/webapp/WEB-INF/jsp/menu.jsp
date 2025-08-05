<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Delivery - Menu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .menu-item {
            transition: transform 0.2s;
        }
        .menu-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .category-badge {
            background: linear-gradient(45deg, #ff6b6b, #ee5a24);
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.8em;
        }
        .price {
            color: #2ecc71;
            font-weight: bold;
            font-size: 1.2em;
        }
        .search-box {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 30px 0;
            margin-bottom: 30px;
        }
        .navbar-brand {
            font-weight: bold;
            color: #2c3e50 !important;
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
                    <span class="badge bg-primary" id="cart-count">0</span>
                </a>
            </div>
        </div>
    </nav>

    <!-- Search Section -->
    <div class="search-box">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <form action="/menu" method="GET" class="d-flex">
                        <input type="text" name="search" class="form-control form-control-lg me-2" 
                               placeholder="Search for food items..." value="${searchTerm}">
                        <button type="submit" class="btn btn-light btn-lg">
                            <i class="fas fa-search"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Success Message -->
    <c:if test="${param.order == 'success'}">
        <div class="container mt-3">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="fas fa-check-circle me-2"></i>
                Order placed successfully! Thank you for your order.
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </div>
    </c:if>

    <div class="container">
        <!-- Categories -->
        <div class="row mb-4">
            <div class="col-12">
                <h5 class="mb-3">Categories:</h5>
                <div class="d-flex flex-wrap gap-2">
                    <a href="/menu" class="btn btn-outline-primary ${empty selectedCategory ? 'active' : ''}">
                        All Items
                    </a>
                    <c:forEach items="${categories}" var="category">
                        <a href="/menu?category=${category}" 
                           class="btn btn-outline-primary ${selectedCategory == category ? 'active' : ''}">
                            ${category}
                        </a>
                    </c:forEach>
                </div>
            </div>
        </div>

        <!-- Menu Items -->
        <div class="row">
            <c:forEach items="${menuItems}" var="item">
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card menu-item h-100 border-0 shadow-sm">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <span class="category-badge">${item.category}</span>
                                <span class="price">₹${item.price}</span>
                            </div>
                            <h5 class="card-title">${item.name}</h5>
                            <p class="card-text text-muted">${item.description}</p>
                            
                            <form action="/cart/add" method="POST" class="mt-3">
                                <input type="hidden" name="menuItemId" value="${item.id}">
                                <div class="d-flex align-items-center gap-2">
                                    <input type="number" name="quantity" value="1" min="1" max="10" 
                                           class="form-control" style="width: 80px;">
                                    <button type="submit" class="btn btn-primary flex-fill">
                                        <i class="fas fa-plus me-1"></i>Add to Cart
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- No Items Found -->
        <c:if test="${empty menuItems}">
            <div class="text-center py-5">
                <i class="fas fa-search fa-3x text-muted mb-3"></i>
                <h4 class="text-muted">No items found</h4>
                <p class="text-muted">Try adjusting your search or browse all categories.</p>
                <a href="/menu" class="btn btn-primary">View All Items</a>
            </div>
        </c:if>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Update cart count
        function updateCartCount() {
            fetch('/api/cart')
                .then(response => response.json())
                .then(data => {
                    document.getElementById('cart-count').textContent = data.totalItems || 0;
                })
                .catch(error => console.error('Error updating cart count:', error));
        }

        // Update cart count on page load
        updateCartCount();
    </script>
</body>
</html> 