# Pure Healthy Eats - Vanilla Version

A beautiful, modern food delivery website built with vanilla HTML, CSS, and JavaScript. This is a conversion of the original React project to a static website that maintains all functionality and visual appeal.

## 🌟 Features

- **Responsive Design** - Works perfectly on desktop, tablet, and mobile devices
- **Interactive Menu** - Browse, search, and filter menu items by category
- **Shopping Cart** - Add items, adjust quantities, and manage your order
- **Checkout Process** - Complete order flow with delivery information
- **Order Confirmation** - Detailed order summary and confirmation
- **Modern UI/UX** - Beautiful gradients, animations, and smooth transitions
- **Local Storage** - Cart persists between sessions
- **Toast Notifications** - User feedback for actions
- **Mobile-First** - Optimized for mobile devices with hamburger menu

## 🍽️ Menu Categories

- **Fresh Salads** - Healthy and nutritious salad options
- **Healthy Mains** - Protein-rich main course dishes
- **Guilt-Free Desserts** - Sweet treats that are good for you
- **Fresh Juices** - Nutrient-packed beverages

## 🚀 Getting Started

### Prerequisites
- A modern web browser (Chrome, Firefox, Safari, Edge)
- No build tools or dependencies required!

### Installation
1. Download or clone this repository
2. Open `index.html` in your web browser
3. That's it! The website is ready to use

### File Structure
```
vanilla-feast-hub/
├── index.html          # Main HTML file with all pages
├── styles.css          # Complete CSS styling
├── script.js           # JavaScript functionality
└── README.md           # This file
```

## 🎨 Design Features

- **Color Scheme**: Fresh green palette inspired by nature and health
- **Typography**: Modern, clean fonts for excellent readability
- **Animations**: Smooth hover effects and transitions
- **Gradients**: Beautiful gradient backgrounds and buttons
- **Shadows**: Subtle shadows for depth and modern feel
- **Icons**: Font Awesome icons throughout the interface

## 📱 Responsive Breakpoints

- **Desktop**: 1200px and above
- **Tablet**: 768px - 1199px
- **Mobile**: Below 768px

## 🛒 Shopping Cart Features

- Add/remove items
- Adjust quantities
- Real-time total calculation
- GST calculation (18%)
- Delivery fee calculation
- Free delivery on orders above ₹500
- Persistent cart (saved in localStorage)

## 🔧 Technical Details

### Technologies Used
- **HTML5** - Semantic markup and structure
- **CSS3** - Modern styling with CSS Grid, Flexbox, and custom properties
- **Vanilla JavaScript** - No frameworks or libraries
- **Font Awesome** - Icons (loaded via CDN)
- **Local Storage** - Data persistence

### Browser Support
- Chrome 60+
- Firefox 55+
- Safari 12+
- Edge 79+

## 🎯 Key Functions

### Navigation
- `showPage(pageName)` - Switch between pages
- `toggleMobileMenu()` - Mobile menu toggle

### Cart Management
- `addToCart(itemId)` - Add item to cart
- `removeFromCart(itemId)` - Remove item from cart
- `updateQuantity(itemId, quantity)` - Update item quantity
- `saveCart()` / `loadCart()` - Persist cart data

### Menu Features
- `renderMenu()` - Display menu items
- `getFilteredMenuItems()` - Filter by category and search
- `createMenuCardHTML(item)` - Generate menu card HTML

### Checkout Process
- `handleCheckout()` - Process order
- `renderOrderConfirmation(orderData)` - Show order details
- `generateOrderId()` - Create unique order IDs

## 🌐 Deployment

This is a static website that can be deployed to any web hosting service:

- **GitHub Pages** - Free hosting for public repositories
- **Netlify** - Drag and drop deployment
- **Vercel** - Automatic deployment from Git
- **Traditional Web Hosting** - Upload files via FTP

## 🔄 Conversion Notes

This vanilla version maintains feature parity with the original React project:

✅ **Converted Features:**
- All React components → HTML sections
- React Router → JavaScript page switching
- React Context → Local Storage + JavaScript state
- Tailwind CSS → Custom CSS with CSS variables
- React hooks → Vanilla JavaScript functions
- Event handlers → DOM event listeners
- Responsive design maintained
- All animations and transitions preserved

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Feel free to contribute to this project by:
- Reporting bugs
- Suggesting new features
- Improving documentation
- Submitting pull requests

## 📞 Support

If you have any questions or need help, please open an issue in the repository.

---

**Enjoy your healthy eating journey! 🌱**
