// Menu Data - This will be populated from server-side
let menuItems = [];

// Cart data
let cart = [];

// Current page
let currentPage = 'home';

// Initialize the application
function initializeApp() {
    // Load cart from localStorage
    loadCart();
    
    // Setup event listeners
    setupEventListeners();
    
    // Show home page by default
    showPage('home');
    
    // Update cart badge
    updateCartBadge();
    
    // Load menu items from server
    loadMenuItems();
}

// Setup event listeners
function setupEventListeners() {
    // Search functionality
    const searchInput = document.getElementById('searchInput');
    if (searchInput) {
        searchInput.addEventListener('input', function() {
            renderMenu();
        });
    }

    // Category filter buttons
    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('category-btn')) {
            // Remove active class from all buttons
            document.querySelectorAll('.category-btn').forEach(btn => {
                btn.classList.remove('active');
            });
            
            // Add active class to clicked button
            e.target.classList.add('active');
            
            // Render menu with filter
            renderMenu();
        }
    });

    // Checkout form
    const checkoutForm = document.getElementById('checkoutForm');
    if (checkoutForm) {
        checkoutForm.addEventListener('submit', function(e) {
            e.preventDefault();
            handleCheckout();
        });
    }
}

// Load menu items from server
function loadMenuItems() {
    fetch('/api/menu')
        .then(response => response.json())
        .then(data => {
            menuItems = data;
            renderMenu();
        })
        .catch(error => {
            console.error('Error loading menu items:', error);
            // Fallback to sample data if server is not available
            menuItems = getSampleMenuItems();
            renderMenu();
        });
}

// Sample menu items for fallback
function getSampleMenuItems() {
    return [
        // Salads
        {
            id: 1,
            name: 'Mediterranean Quinoa Bowl',
            description: 'Fresh quinoa with cucumber, tomatoes, olives, and feta cheese',
            price: 299,
            imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400',
            category: 'salads',
            rating: 4.8,
            available: true
        },
        {
            id: 2,
            name: 'Kale Caesar Salad',
            description: 'Nutrient-rich kale with parmesan, croutons, and light caesar dressing',
            price: 249,
            imageUrl: 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=400',
            category: 'salads',
            rating: 4.6,
            available: true
        },
        {
            id: 3,
            name: 'Rainbow Power Bowl',
            description: 'Mixed greens, roasted vegetables, avocado, and tahini dressing',
            price: 329,
            imageUrl: 'https://images.unsplash.com/photo-1511690743698-d9d85f2fbf38?w=400',
            category: 'salads',
            rating: 4.7,
            available: true
        },
        // Healthy Mains
        {
            id: 4,
            name: 'Grilled Salmon Bowl',
            description: 'Omega-3 rich salmon with brown rice, steamed broccoli, and lemon',
            price: 449,
            imageUrl: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=400',
            category: 'healthy-mains',
            rating: 4.9,
            available: true
        },
        {
            id: 5,
            name: 'Chickpea Buddha Bowl',
            description: 'Protein-packed chickpeas with roasted sweet potato and tahini',
            price: 349,
            imageUrl: 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400',
            category: 'healthy-mains',
            rating: 4.7,
            available: true
        },
        {
            id: 6,
            name: 'Zucchini Noodle Pasta',
            description: 'Spiralized zucchini with cherry tomatoes and basil pesto',
            price: 279,
            imageUrl: 'https://images.unsplash.com/photo-1594756202469-d0d29ca1bdb1?w=400',
            category: 'healthy-mains',
            rating: 4.5,
            available: true
        },
        // Healthy Desserts
        {
            id: 7,
            name: 'Chia Pudding Bowl',
            description: 'Vanilla chia pudding with fresh berries and coconut flakes',
            price: 179,
            imageUrl: 'https://images.unsplash.com/photo-1511690656952-34342bb7c2f2?w=400',
            category: 'healthy-desserts',
            rating: 4.4,
            available: true
        },
        {
            id: 8,
            name: 'Acai Bowl',
            description: 'Antioxidant-rich acai bowl topped with granola and fresh fruit',
            price: 229,
            imageUrl: 'https://images.unsplash.com/photo-1511690743698-d9d85f2fbf38?w=400',
            category: 'healthy-desserts',
            rating: 4.8,
            available: true
        },
        // Fresh Juices
        {
            id: 9,
            name: 'Green Detox Juice',
            description: 'Spinach, kale, cucumber, and apple for a healthy boost',
            price: 149,
            imageUrl: 'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=400',
            category: 'fresh-juices',
            rating: 4.6,
            available: true
        },
        {
            id: 10,
            name: 'Berry Blast Smoothie',
            description: 'Mixed berries with almond milk and chia seeds',
            price: 199,
            imageUrl: 'https://images.unsplash.com/photo-1553530666-ba11a7da3888?w=400',
            category: 'fresh-juices',
            rating: 4.7,
            available: true
        }
    ];
}

// Show page function
function showPage(pageName) {
    // Hide all pages
    document.querySelectorAll('.page').forEach(page => {
        page.classList.remove('active');
    });
    
    // Show selected page
    const selectedPage = document.getElementById(pageName);
    if (selectedPage) {
        selectedPage.classList.add('active');
        currentPage = pageName;
        
        // Update navigation active state
        updateNavigationActiveState(pageName);
        
        // Render page-specific content
        switch(pageName) {
            case 'menu':
                renderMenu();
                break;
            case 'cart':
                renderCart();
                break;
            case 'checkout':
                renderCheckout();
                break;
        }
    }
}

// Update navigation active state
function updateNavigationActiveState(pageName) {
    // Remove active class from all nav links
    document.querySelectorAll('.nav-link').forEach(link => {
        link.classList.remove('active');
    });
    
    // Add active class to current page link
    const activeLink = document.querySelector(`[onclick="showPage('${pageName}')"]`);
    if (activeLink) {
        activeLink.classList.add('active');
    }
}

// Toggle mobile menu
function toggleMobileMenu() {
    const mobileNav = document.getElementById('mobileNav');
    if (mobileNav) {
        mobileNav.classList.toggle('active');
    }
}

// Render menu
function renderMenu() {
    const menuGrid = document.getElementById('menuGrid');
    if (!menuGrid) return;
    
    const filteredItems = getFilteredMenuItems();
    const menuHTML = filteredItems.map(item => createMenuCardHTML(item)).join('');
    
    menuGrid.innerHTML = menuHTML;
}

// Get filtered menu items
function getFilteredMenuItems() {
    const searchTerm = document.getElementById('searchInput')?.value.toLowerCase() || '';
    const activeCategory = document.querySelector('.category-btn.active')?.dataset.category || 'all';
    
    return menuItems.filter(item => {
        const matchesSearch = item.name.toLowerCase().includes(searchTerm) || 
                            item.description.toLowerCase().includes(searchTerm);
        const matchesCategory = activeCategory === 'all' || item.category === activeCategory;
        
        return matchesSearch && matchesCategory && item.available;
    });
}

// Create menu card HTML
function createMenuCardHTML(item) {
    const stars = generateStars(item.rating);
    const isVeg = item.category === 'salads' || item.category === 'healthy-desserts' || 
                  item.category === 'fresh-juices' || item.name.toLowerCase().includes('chickpea');
    
    return `
        <div class="menu-card" data-id="${item.id}" data-category="${item.category}">
            <div class="menu-card-image">
                <img src="${item.imageUrl}" alt="${item.name}" class="menu-card-img">
                <div class="menu-card-badges">
                    ${isVeg ? '<span class="menu-card-badge veg">🥬 Veg</span>' : ''}
                </div>
                <div class="menu-card-rating">
                    <span class="rating-stars">
                        ${stars}
                    </span>
                    <span class="rating-value">${item.rating}</span>
                </div>
            </div>
            <div class="menu-card-content">
                <h3 class="menu-card-title">${item.name}</h3>
                <p class="menu-card-description">${item.description}</p>
                <div class="menu-card-footer">
                    <span class="menu-card-price">₹${item.price}</span>
                    <button class="menu-card-btn" onclick="addToCart(${item.id})">
                        Add to Cart
                    </button>
                </div>
            </div>
        </div>
    `;
}

// Generate stars HTML
function generateStars(rating) {
    let stars = '';
    for (let i = 1; i <= 5; i++) {
        const filled = i <= rating ? 'filled' : '';
        stars += `<i class="fas fa-star ${filled}"></i>`;
    }
    return stars;
}

// Add item to cart
function addToCart(itemId) {
    const item = menuItems.find(item => item.id === itemId);
    if (!item) return;
    
    const existingItem = cart.find(cartItem => cartItem.id === itemId);
    
    if (existingItem) {
        existingItem.quantity += 1;
    } else {
        cart.push({
            id: item.id,
            name: item.name,
            price: item.price,
            imageUrl: item.imageUrl,
            quantity: 1
        });
    }
    
    saveCart();
    updateCartBadge();
    showToast('Added to Cart', `${item.name} has been added to your cart`);
    
    // If on cart page, re-render cart
    if (currentPage === 'cart') {
        renderCart();
    }
}

// Remove item from cart
function removeFromCart(itemId) {
    cart = cart.filter(item => item.id !== itemId);
    saveCart();
    updateCartBadge();
    renderCart();
    showToast('Removed from Cart', 'Item has been removed from your cart');
}

// Update item quantity
function updateQuantity(itemId, newQuantity) {
    if (newQuantity <= 0) {
        removeFromCart(itemId);
        return;
    }
    
    const item = cart.find(item => item.id === itemId);
    if (item) {
        item.quantity = newQuantity;
        saveCart();
        updateCartBadge();
        renderCart();
    }
}

// Update cart total
function updateCartTotal() {
    return cart.reduce((total, item) => total + (item.price * item.quantity), 0);
}

// Render cart
function renderCart() {
    const cartContent = document.getElementById('cartContent');
    if (!cartContent) return;
    
    if (cart.length === 0) {
        cartContent.innerHTML = `
            <div class="empty-cart">
                <div class="empty-cart-icon">
                    <i class="fas fa-shopping-cart"></i>
                </div>
                <h3 class="empty-cart-title">Your cart is empty</h3>
                <p class="empty-cart-description">Add some delicious items to get started!</p>
                <button class="btn btn-primary" onclick="showPage('menu')">Browse Menu</button>
            </div>
        `;
        return;
    }
    
    const cartItemsHTML = cart.map(item => createCartItemHTML(item)).join('');
    const subtotal = updateCartTotal();
    const deliveryCharge = subtotal >= 400 ? 0 : 70;
    const total = subtotal + deliveryCharge;
    
    cartContent.innerHTML = `
        <div class="cart-items">
            ${cartItemsHTML}
        </div>
        <div class="order-summary">
            <h3 class="order-summary-title">Order Summary</h3>
            <div class="order-summary-item">
                <span>Subtotal (${cart.reduce((sum, item) => sum + item.quantity, 0)} items)</span>
                <span>₹${subtotal}</span>
            </div>
            <div class="order-summary-item">
                <span>Delivery Charge</span>
                <span>${deliveryCharge === 0 ? 'FREE' : '₹' + deliveryCharge}</span>
            </div>
            <div class="order-summary-total">
                <span>Total</span>
                <span>₹${total}</span>
            </div>
            ${deliveryCharge === 0 ? '<div class="free-delivery-notice">🎉 Free delivery on orders above ₹400!</div>' : ''}
            <button class="btn btn-primary" onclick="showPage('checkout')" style="width: 100%; margin-top: 1rem;">
                Proceed to Checkout
            </button>
        </div>
    `;
}

// Create cart item HTML
function createCartItemHTML(item) {
    return `
        <div class="cart-item" data-id="${item.id}">
            <div class="cart-item-content">
                <div class="cart-item-image">
                    <img src="${item.imageUrl}" alt="${item.name}">
                </div>
                <div class="cart-item-details">
                    <h3 class="cart-item-title">${item.name}</h3>
                    <span class="cart-item-price">₹${item.price}</span>
                </div>
                <div class="cart-item-controls">
                    <div class="cart-item-quantity">
                        <button class="quantity-btn" onclick="updateQuantity(${item.id}, ${item.quantity - 1})">-</button>
                        <span class="quantity-display">${item.quantity}</span>
                        <button class="quantity-btn" onclick="updateQuantity(${item.id}, ${item.quantity + 1})">+</button>
                    </div>
                    <div class="cart-item-total">
                        <span class="cart-item-total-price">₹${item.price * item.quantity}</span>
                        <button class="remove-btn" onclick="removeFromCart(${item.id})">
                            <i class="fas fa-trash"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    `;
}

// Render checkout
function renderCheckout() {
    const checkoutSummary = document.getElementById('checkoutSummary');
    if (!checkoutSummary) return;
    
    const subtotal = updateCartTotal();
    const deliveryCharge = subtotal >= 400 ? 0 : 70;
    const total = subtotal + deliveryCharge;
    
    const summaryHTML = cart.map(item => `
        <div class="order-summary-item">
            <span>${item.name} x ${item.quantity}</span>
            <span>₹${item.price * item.quantity}</span>
        </div>
    `).join('');
    
    checkoutSummary.innerHTML = `
        ${summaryHTML}
        <div class="order-summary-item">
            <span>Subtotal</span>
            <span>₹${subtotal}</span>
        </div>
        <div class="order-summary-item">
            <span>Delivery Charge</span>
            <span>${deliveryCharge === 0 ? 'FREE' : '₹' + deliveryCharge}</span>
        </div>
        <div class="order-summary-total">
            <span>Total</span>
            <span>₹${total}</span>
        </div>
    `;
}

// Handle checkout
function handleCheckout() {
    const formData = new FormData(document.getElementById('checkoutForm'));
    const orderData = {
        customerName: formData.get('name') || document.getElementById('name')?.value,
        email: formData.get('email') || document.getElementById('email')?.value,
        phone: formData.get('phone') || document.getElementById('phone')?.value,
        deliveryAddress: formData.get('address') || document.getElementById('address')?.value,
        paymentMethod: formData.get('payment') || document.getElementById('payment')?.value,
        items: cart,
        total: updateCartTotal() + (updateCartTotal() >= 400 ? 0 : 70)
    };
    
    // Send order to server
    fetch('/api/orders', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(orderData)
    })
    .then(response => response.json())
    .then(data => {
        // Clear cart
        cart = [];
        saveCart();
        updateCartBadge();
        
        // Show confirmation
        renderOrderConfirmation(orderData);
        showPage('orderConfirmation');
    })
    .catch(error => {
        console.error('Error placing order:', error);
        // Show confirmation anyway (for demo purposes)
        renderOrderConfirmation(orderData);
        showPage('orderConfirmation');
    });
}

// Render order confirmation
function renderOrderConfirmation(orderData) {
    const orderDetails = document.getElementById('orderDetails');
    if (!orderDetails) return;
    
    const orderId = generateOrderId();
    const estimatedDelivery = new Date(Date.now() + 40 * 60000).toLocaleTimeString('en-US', {
        hour: '2-digit',
        minute: '2-digit'
    });
    
    orderDetails.innerHTML = `
        <div class="order-info">
            <p><strong>Order ID:</strong> ${orderId}</p>
            <p><strong>Customer:</strong> ${orderData.customerName}</p>
            <p><strong>Phone:</strong> ${orderData.phone}</p>
            <p><strong>Delivery Address:</strong> ${orderData.deliveryAddress}</p>
            <p><strong>Payment Method:</strong> ${orderData.paymentMethod}</p>
            <p><strong>Estimated Delivery:</strong> ${estimatedDelivery}</p>
            <p><strong>Total Amount:</strong> ₹${orderData.total}</p>
        </div>
    `;
}

// Generate order ID
function generateOrderId() {
    return 'ORD-' + Date.now().toString().slice(-6);
}

// Update cart badge
function updateCartBadge() {
    const cartBadge = document.getElementById('cartBadge');
    if (cartBadge) {
        const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);
        cartBadge.textContent = totalItems;
        cartBadge.style.display = totalItems > 0 ? 'block' : 'none';
    }
}

// Show toast notification
function showToast(title, description) {
    const toastContainer = document.getElementById('toastContainer');
    if (!toastContainer) return;
    
    const toast = document.createElement('div');
    toast.className = 'toast';
    toast.innerHTML = `
        <div class="toast-title">${title}</div>
        <div class="toast-description">${description}</div>
    `;
    
    toastContainer.appendChild(toast);
    
    // Remove toast after 3 seconds
    setTimeout(() => {
        toast.remove();
    }, 3000);
}

// Save cart to localStorage
function saveCart() {
    localStorage.setItem('cart', JSON.stringify(cart));
}

// Load cart from localStorage
function loadCart() {
    const savedCart = localStorage.getItem('cart');
    if (savedCart) {
        cart = JSON.parse(savedCart);
    }
}

// Initialize app when DOM is loaded
document.addEventListener('DOMContentLoaded', initializeApp); 