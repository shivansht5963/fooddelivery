// Menu Data
const menuItems = [
    // Salads
    {
        id: 'sal-1',
        name: 'Mediterranean Quinoa Bowl',
        description: 'Fresh quinoa with cucumber, tomatoes, olives, and feta cheese',
        price: 299,
        image: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400',
        category: 'salads',
        rating: 4.8,
        isVeg: true
    },
    {
        id: 'sal-2',
        name: 'Kale Caesar Salad',
        description: 'Nutrient-rich kale with parmesan, croutons, and light caesar dressing',
        price: 249,
        image: 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=400',
        category: 'salads',
        rating: 4.6,
        isVeg: true
    },
    {
        id: 'sal-3',
        name: 'Rainbow Power Bowl',
        description: 'Mixed greens, roasted vegetables, avocado, and tahini dressing',
        price: 329,
        image: 'https://images.unsplash.com/photo-1511690743698-d9d85f2fbf38?w=400',
        category: 'salads',
        rating: 4.7,
        isVeg: true
    },

    // Healthy Mains
    {
        id: 'main-1',
        name: 'Grilled Salmon Bowl',
        description: 'Omega-3 rich salmon with brown rice, steamed broccoli, and lemon',
        price: 449,
        image: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=400',
        category: 'healthy-mains',
        rating: 4.9,
        isVeg: false
    },
    {
        id: 'main-2',
        name: 'Chickpea Buddha Bowl',
        description: 'Protein-packed chickpeas with roasted sweet potato and tahini',
        price: 349,
        image: 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400',
        category: 'healthy-mains',
        rating: 4.7,
        isVeg: true
    },
    {
        id: 'main-3',
        name: 'Zucchini Noodle Pasta',
        description: 'Spiralized zucchini with cherry tomatoes and basil pesto',
        price: 279,
        image: 'https://images.unsplash.com/photo-1594756202469-d0d29ca1bdb1?w=400',
        category: 'healthy-mains',
        rating: 4.5,
        isVeg: true
    },
    {
        id: 'main-4',
        name: 'Quinoa Stuffed Bell Peppers',
        description: 'Colorful bell peppers stuffed with quinoa, vegetables, and herbs',
        price: 329,
        image: 'https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400',
        category: 'healthy-mains',
        rating: 4.6,
        isVeg: true
    },

    // Healthy Desserts
    {
        id: 'dess-1',
        name: 'Chia Pudding Bowl',
        description: 'Vanilla chia pudding with fresh berries and coconut flakes',
        price: 179,
        image: 'https://images.unsplash.com/photo-1511690656952-34342bb7c2f2?w=400',
        category: 'healthy-desserts',
        rating: 4.4,
        isVeg: true
    },
    {
        id: 'dess-2',
        name: 'Acai Bowl',
        description: 'Antioxidant-rich acai bowl topped with granola and fresh fruit',
        price: 229,
        image: 'https://images.unsplash.com/photo-1511690743698-d9d85f2fbf38?w=400',
        category: 'healthy-desserts',
        rating: 4.8,
        isVeg: true
    },
    {
        id: 'dess-3',
        name: 'Raw Energy Balls',
        description: 'No-bake energy balls made with dates, nuts, and cacao',
        price: 149,
        image: 'https://images.unsplash.com/photo-1569058242271-88659d5f6d42?w=400',
        category: 'healthy-desserts',
        rating: 4.3,
        isVeg: true
    },

    // Fresh Juices
    {
        id: 'juice-1',
        name: 'Green Detox Juice',
        description: 'Spinach, cucumber, celery, apple, and lemon juice',
        price: 149,
        image: 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=400',
        category: 'fresh-juices',
        rating: 4.5,
        isVeg: true
    },
    {
        id: 'juice-2',
        name: 'Carrot Ginger Shot',
        description: 'Immune-boosting carrot and ginger juice blend',
        price: 99,
        image: 'https://images.unsplash.com/photo-1623065422902-30a2d299bbe4?w=400',
        category: 'fresh-juices',
        rating: 4.2,
        isVeg: true
    },
    {
        id: 'juice-3',
        name: 'Tropical Smoothie',
        description: 'Mango, pineapple, coconut water, and a touch of lime',
        price: 179,
        image: 'https://images.unsplash.com/photo-1553530979-67ffcf7c6bde?w=400',
        category: 'fresh-juices',
        rating: 4.6,
        isVeg: true
    },
    {
        id: 'juice-4',
        name: 'Beetroot Power Juice',
        description: 'Nutrient-dense beetroot with apple and ginger',
        price: 159,
        image: 'https://images.unsplash.com/photo-1628525078737-b7b56b22a7b6?w=400',
        category: 'fresh-juices',
        rating: 4.4,
        isVeg: true
    }
];

const categories = [
    { id: 'salads', name: 'Fresh Salads', icon: '🥗' },
    { id: 'healthy-mains', name: 'Healthy Mains', icon: '🥙' },
    { id: 'healthy-desserts', name: 'Guilt-Free Desserts', icon: '🫐' },
    { id: 'fresh-juices', name: 'Fresh Juices', icon: '🥤' }
];

// Cart State
let cart = {
    items: [],
    total: 0
};

// Current page state
let currentPage = 'home';
let selectedCategory = 'all';
let searchQuery = '';

// DOM Elements
const cartBadge = document.getElementById('cartBadge');
const menuGrid = document.getElementById('menuGrid');
const cartContent = document.getElementById('cartContent');
const checkoutSummary = document.getElementById('checkoutSummary');
const orderDetails = document.getElementById('orderDetails');
const searchInput = document.getElementById('searchInput');
const checkoutForm = document.getElementById('checkoutForm');

// Initialize the app
document.addEventListener('DOMContentLoaded', function() {
    initializeApp();
});

function initializeApp() {
    // Load cart from localStorage
    loadCart();
    
    // Set up event listeners
    setupEventListeners();
    
    // Render initial content
    renderMenu();
    updateCartBadge();
    
    // Show home page by default
    showPage('home');
}

function setupEventListeners() {
    // Search functionality
    if (searchInput) {
        searchInput.addEventListener('input', function(e) {
            searchQuery = e.target.value.toLowerCase();
            renderMenu();
        });
    }

    // Category filter buttons
    document.querySelectorAll('.category-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            selectedCategory = this.dataset.category;
            
            // Update active state
            document.querySelectorAll('.category-btn').forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            
            renderMenu();
        });
    });

    // Checkout form
    if (checkoutForm) {
        checkoutForm.addEventListener('submit', function(e) {
            e.preventDefault();
            handleCheckout();
        });
    }
}

// Navigation Functions
function showPage(pageName) {
    // Hide all pages
    document.querySelectorAll('.page').forEach(page => {
        page.classList.remove('active');
    });
    
    // Show selected page
    const targetPage = document.getElementById(pageName);
    if (targetPage) {
        targetPage.classList.add('active');
        currentPage = pageName;
        
        // Update navigation active states
        updateNavigationActiveState(pageName);
        
        // Render page-specific content
        if (pageName === 'menu') {
            renderMenu();
        } else if (pageName === 'cart') {
            renderCart();
        } else if (pageName === 'checkout') {
            renderCheckout();
        }
    }
}

function updateNavigationActiveState(pageName) {
    // Update desktop nav links
    document.querySelectorAll('.nav-link').forEach(link => {
        link.classList.remove('active');
    });
    
    // Update mobile nav links
    document.querySelectorAll('.mobile-nav-link').forEach(link => {
        link.classList.remove('active');
    });
}

function toggleMobileMenu() {
    const mobileNav = document.getElementById('mobileNav');
    mobileNav.classList.toggle('active');
}

// Menu Functions
function renderMenu() {
    if (!menuGrid) return;
    
    const filteredItems = getFilteredMenuItems();
    
    if (filteredItems.length === 0) {
        menuGrid.innerHTML = `
            <div class="menu-card" style="grid-column: 1 / -1; text-align: center; padding: 2rem;">
                <h3 style="font-size: 1.25rem; font-weight: 600; margin-bottom: 0.5rem;">No items found</h3>
                <p style="color: var(--muted-foreground);">Try adjusting your search or category filter</p>
            </div>
        `;
        return;
    }
    
    menuGrid.innerHTML = filteredItems.map(item => createMenuCardHTML(item)).join('');
    
    // Add event listeners to add to cart buttons
    document.querySelectorAll('.add-to-cart-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const itemId = this.dataset.itemId;
            addToCart(itemId);
        });
    });
}

function getFilteredMenuItems() {
    let items = menuItems;
    
    // Filter by category
    if (selectedCategory !== 'all') {
        items = items.filter(item => item.category === selectedCategory);
    }
    
    // Filter by search query
    if (searchQuery) {
        items = items.filter(item =>
            item.name.toLowerCase().includes(searchQuery) ||
            item.description.toLowerCase().includes(searchQuery)
        );
    }
    
    return items;
}

function createMenuCardHTML(item) {
    const badges = [];
    if (item.isVeg) badges.push('<span class="menu-card-badge veg">VEG</span>');
    if (item.isSpicy) badges.push('<span class="menu-card-badge spicy">🌶️ SPICY</span>');
    
    return `
        <div class="menu-card">
            <div class="menu-card-image">
                <img src="${item.image}" alt="${item.name}" class="menu-card-img">
                <div class="menu-card-badges">
                    ${badges.join('')}
                </div>
                <div class="menu-card-rating">
                    <i class="fas fa-star" style="color: #fbbf24;"></i>
                    <span>${item.rating}</span>
                </div>
            </div>
            <div class="menu-card-content">
                <h3 class="menu-card-title">${item.name}</h3>
                <p class="menu-card-description">${item.description}</p>
                <div class="menu-card-footer">
                    <span class="menu-card-price">₹${item.price}</span>
                    <button class="menu-card-btn add-to-cart-btn" data-item-id="${item.id}">
                        <i class="fas fa-plus"></i>
                        Add
                    </button>
                </div>
            </div>
        </div>
    `;
}

// Cart Functions
function addToCart(itemId) {
    const item = menuItems.find(item => item.id === itemId);
    if (!item) return;
    
    const existingItem = cart.items.find(cartItem => cartItem.id === itemId);
    
    if (existingItem) {
        existingItem.quantity += 1;
    } else {
        cart.items.push({
            id: item.id,
            name: item.name,
            price: item.price,
            quantity: 1,
            image: item.image,
            category: item.category
        });
    }
    
    updateCartTotal();
    saveCart();
    updateCartBadge();
    showToast('Added to cart!', `${item.name} has been added to your cart.`);
}

function removeFromCart(itemId) {
    cart.items = cart.items.filter(item => item.id !== itemId);
    updateCartTotal();
    saveCart();
    updateCartBadge();
    
    if (currentPage === 'cart') {
        renderCart();
    }
}

function updateQuantity(itemId, newQuantity) {
    if (newQuantity <= 0) {
        removeFromCart(itemId);
        return;
    }
    
    const item = cart.items.find(item => item.id === itemId);
    if (item) {
        item.quantity = newQuantity;
        updateCartTotal();
        saveCart();
        updateCartBadge();
        
        if (currentPage === 'cart') {
            renderCart();
        }
    }
}

function updateCartTotal() {
    cart.total = cart.items.reduce((sum, item) => sum + (item.price * item.quantity), 0);
}

function renderCart() {
    if (!cartContent) return;
    
    if (cart.items.length === 0) {
        cartContent.innerHTML = `
            <div class="empty-cart">
                <div class="empty-cart-icon">
                    <i class="fas fa-shopping-bag"></i>
                </div>
                <h2 class="empty-cart-title">Your cart is empty</h2>
                <p class="empty-cart-description">Add some delicious items from our menu</p>
                <button class="btn btn-primary" onclick="showPage('menu')">Browse Menu</button>
            </div>
        `;
        return;
    }
    
    const subtotal = cart.total;
    const gst = subtotal * 0.18;
    const deliveryFee = subtotal > 500 ? 0 : 49;
    const packagingFee = 15;
    const totalAmount = subtotal + gst + deliveryFee + packagingFee;
    
    cartContent.innerHTML = `
        <div class="cart-items">
            ${cart.items.map(item => createCartItemHTML(item)).join('')}
        </div>
        <div class="order-summary">
            <h2 class="order-summary-title">Order Summary</h2>
            <div class="order-summary-item">
                <span>Subtotal</span>
                <span>₹${subtotal.toFixed(2)}</span>
            </div>
            <div class="order-summary-item">
                <span>GST (18%)</span>
                <span>₹${gst.toFixed(2)}</span>
            </div>
            <div class="order-summary-item">
                <span>Delivery Fee</span>
                <span class="${deliveryFee === 0 ? 'text-accent font-semibold' : ''}">
                    ${deliveryFee === 0 ? 'FREE' : `₹${deliveryFee}`}
                </span>
            </div>
            <div class="order-summary-item">
                <span>Packaging Fee</span>
                <span>₹${packagingFee}</span>
            </div>
            ${subtotal < 500 ? `
                <div class="free-delivery-notice">
                    Add ₹${(500 - subtotal).toFixed(2)} more for free delivery!
                </div>
            ` : ''}
            <div class="order-summary-total">
                <span>Total</span>
                <span style="color: var(--primary);">₹${totalAmount.toFixed(2)}</span>
            </div>
            <button class="btn btn-primary" onclick="showPage('checkout')" style="width: 100%; margin-top: 1rem;">
                Proceed to Checkout
            </button>
            <button class="btn btn-outline" onclick="showPage('menu')" style="width: 100%; margin-top: 0.5rem;">
                Continue Shopping
            </button>
        </div>
    `;
    
    // Add event listeners to cart item buttons
    document.querySelectorAll('.quantity-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const itemId = this.dataset.itemId;
            const action = this.dataset.action;
            const currentQuantity = parseInt(this.dataset.quantity);
            
            if (action === 'decrease') {
                updateQuantity(itemId, currentQuantity - 1);
            } else if (action === 'increase') {
                updateQuantity(itemId, currentQuantity + 1);
            }
        });
    });
    
    document.querySelectorAll('.remove-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const itemId = this.dataset.itemId;
            removeFromCart(itemId);
        });
    });
}

function createCartItemHTML(item) {
    return `
        <div class="cart-item">
            <div class="cart-item-content">
                <img src="${item.image}" alt="${item.name}" class="cart-item-image">
                <div class="cart-item-details">
                    <h3 class="cart-item-title">${item.name}</h3>
                    <p class="cart-item-price">₹${item.price}</p>
                </div>
                <div class="cart-item-controls">
                    <div class="cart-item-quantity">
                        <button class="quantity-btn" data-item-id="${item.id}" data-action="decrease" data-quantity="${item.quantity}">
                            <i class="fas fa-minus"></i>
                        </button>
                        <span class="quantity-display">${item.quantity}</span>
                        <button class="quantity-btn" data-item-id="${item.id}" data-action="increase" data-quantity="${item.quantity}">
                            <i class="fas fa-plus"></i>
                        </button>
                    </div>
                </div>
                <div class="cart-item-total">
                    <p class="cart-item-total-price">₹${item.price * item.quantity}</p>
                    <button class="remove-btn" data-item-id="${item.id}">
                        <i class="fas fa-trash"></i>
                    </button>
                </div>
            </div>
        </div>
    `;
}

function renderCheckout() {
    if (!checkoutSummary) return;
    
    const subtotal = cart.total;
    const gst = subtotal * 0.18;
    const deliveryFee = subtotal > 500 ? 0 : 49;
    const packagingFee = 15;
    const totalAmount = subtotal + gst + deliveryFee + packagingFee;
    
    checkoutSummary.innerHTML = `
        <div class="order-summary-item">
            <span>Subtotal</span>
            <span>₹${subtotal.toFixed(2)}</span>
        </div>
        <div class="order-summary-item">
            <span>GST (18%)</span>
            <span>₹${gst.toFixed(2)}</span>
        </div>
        <div class="order-summary-item">
            <span>Delivery Fee</span>
            <span>${deliveryFee === 0 ? 'FREE' : `₹${deliveryFee}`}</span>
        </div>
        <div class="order-summary-item">
            <span>Packaging Fee</span>
            <span>₹${packagingFee}</span>
        </div>
        <div class="order-summary-total">
            <span>Total</span>
            <span style="color: var(--primary);">₹${totalAmount.toFixed(2)}</span>
        </div>
    `;
}

function handleCheckout() {
    const formData = new FormData(checkoutForm);
    const orderData = {
        customer: {
            name: formData.get('name') || document.getElementById('name').value,
            email: formData.get('email') || document.getElementById('email').value,
            phone: formData.get('phone') || document.getElementById('phone').value,
            address: formData.get('address') || document.getElementById('address').value,
            payment: formData.get('payment') || document.getElementById('payment').value
        },
        items: cart.items,
        total: cart.total,
        orderId: generateOrderId(),
        orderDate: new Date().toISOString()
    };
    
    // Store order data for confirmation page
    localStorage.setItem('lastOrder', JSON.stringify(orderData));
    
    // Clear cart
    cart = { items: [], total: 0 };
    saveCart();
    updateCartBadge();
    
    // Show confirmation page
    showPage('orderConfirmation');
    renderOrderConfirmation(orderData);
}

function renderOrderConfirmation(orderData) {
    if (!orderDetails) return;
    
    const subtotal = orderData.total;
    const gst = subtotal * 0.18;
    const deliveryFee = subtotal > 500 ? 0 : 49;
    const packagingFee = 15;
    const totalAmount = subtotal + gst + deliveryFee + packagingFee;
    
    orderDetails.innerHTML = `
        <div style="margin-bottom: 1rem;">
            <strong>Order ID:</strong> ${orderData.orderId}
        </div>
        <div style="margin-bottom: 1rem;">
            <strong>Customer:</strong> ${orderData.customer.name}
        </div>
        <div style="margin-bottom: 1rem;">
            <strong>Delivery Address:</strong> ${orderData.customer.address}
        </div>
        <div style="margin-bottom: 1rem;">
            <strong>Payment Method:</strong> ${orderData.customer.payment}
        </div>
        <div style="margin-bottom: 1rem;">
            <strong>Items:</strong>
            <ul style="margin-top: 0.5rem; margin-left: 1rem;">
                ${orderData.items.map(item => `
                    <li>${item.name} x${item.quantity} - ₹${item.price * item.quantity}</li>
                `).join('')}
            </ul>
        </div>
        <div style="border-top: 1px solid var(--border); padding-top: 1rem;">
            <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
                <span>Subtotal:</span>
                <span>₹${subtotal.toFixed(2)}</span>
            </div>
            <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
                <span>GST (18%):</span>
                <span>₹${gst.toFixed(2)}</span>
            </div>
            <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
                <span>Delivery Fee:</span>
                <span>${deliveryFee === 0 ? 'FREE' : `₹${deliveryFee}`}</span>
            </div>
            <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
                <span>Packaging Fee:</span>
                <span>₹${packagingFee}</span>
            </div>
            <div style="display: flex; justify-content: space-between; font-weight: bold; font-size: 1.125rem;">
                <span>Total:</span>
                <span style="color: var(--primary);">₹${totalAmount.toFixed(2)}</span>
            </div>
        </div>
    `;
}

function generateOrderId() {
    return 'ORD-' + Date.now().toString().slice(-8) + Math.random().toString(36).substr(2, 4).toUpperCase();
}

// Utility Functions
function updateCartBadge() {
    if (cartBadge) {
        const totalItems = cart.items.reduce((sum, item) => sum + item.quantity, 0);
        cartBadge.textContent = totalItems;
        cartBadge.style.display = totalItems > 0 ? 'flex' : 'none';
    }
}

function showToast(title, description) {
    const toastContainer = document.getElementById('toastContainer');
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

function saveCart() {
    localStorage.setItem('cart', JSON.stringify(cart));
}

function loadCart() {
    const savedCart = localStorage.getItem('cart');
    if (savedCart) {
        cart = JSON.parse(savedCart);
    }
}

// Close mobile menu when clicking outside
document.addEventListener('click', function(e) {
    const mobileNav = document.getElementById('mobileNav');
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    
    if (mobileNav && mobileNav.classList.contains('active') && 
        !mobileNav.contains(e.target) && 
        !mobileMenuBtn.contains(e.target)) {
        mobileNav.classList.remove('active');
    }
}); 