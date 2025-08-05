# Food Delivery Application

A modern food delivery web application built with **Spring Boot** and **JSP** for the frontend. This application provides a complete food ordering experience with menu browsing, cart management, and order processing.

## 🚀 Features

### Core Features
- **Menu Browsing**: Browse food items by categories (Appetizers, Main Course, Desserts, Beverages)
- **Search Functionality**: Search for specific food items
- **Shopping Cart**: Add, remove, and update items in cart
- **Order Summary**: Complete order breakdown with subtotal, GST, delivery, and packaging charges
- **Checkout Process**: Customer information collection and order confirmation
- **Responsive Design**: Modern, mobile-friendly UI using Bootstrap 5

### Technical Features
- **Spring Boot 3.2.0**: Latest Spring Boot framework
- **JSP Views**: Server-side rendering with JSP templates
- **H2 Database**: In-memory database for development
- **JPA/Hibernate**: Object-relational mapping
- **RESTful API**: Additional REST endpoints for AJAX operations
- **Session Management**: User session handling for cart persistence

## 🛠️ Technology Stack

- **Backend**: Java 17, Spring Boot 3.2.0, Spring Data JPA
- **Frontend**: JSP, Bootstrap 5, Font Awesome, JavaScript
- **Database**: H2 (In-Memory)
- **Build Tool**: Maven
- **Server**: Embedded Tomcat

## 📋 Prerequisites

- Java 17 or higher
- Maven 3.6 or higher
- Any modern web browser

## 🚀 Quick Start

### 1. Clone the Repository
```bash
git clone <repository-url>
cd fooddelivery
```

### 2. Build the Application
```bash
mvn clean install
```

### 3. Run the Application
```bash
mvn spring-boot:run
```

### 4. Access the Application
Open your browser and navigate to:
- **Main Application**: http://localhost:8080
- **H2 Database Console**: http://localhost:8080/h2-console
  - JDBC URL: `jdbc:h2:mem:fooddeliverydb`
  - Username: `sa`
  - Password: `password`

## 📁 Project Structure

```
fooddelivery/
├── src/
│   ├── main/
│   │   ├── java/com/fooddelivery/
│   │   │   ├── controller/          # HTTP request handlers
│   │   │   ├── model/              # JPA entities
│   │   │   ├── repository/         # Data access layer
│   │   │   ├── service/            # Business logic
│   │   │   ├── config/             # Configuration classes
│   │   │   └── FoodDeliveryApplication.java
│   │   ├── resources/
│   │   │   └── application.properties
│   │   └── webapp/WEB-INF/jsp/     # JSP view templates
│   └── test/                       # Test files
├── pom.xml                         # Maven dependencies
└── README.md
```

## 🎯 Application Flow

1. **Menu Page** (`/menu`): Browse food items, search, and add to cart
2. **Cart Page** (`/cart`): Review cart items, update quantities, proceed to checkout
3. **Checkout Page** (`/cart/checkout`): Enter customer information
4. **Order Confirmation** (`/cart/order-confirmation`): Review and confirm order

## 🍽️ Sample Menu Items

The application comes pre-loaded with sample menu items:

### Appetizers
- Chicken Wings (₹299)
- Spring Rolls (₹199)
- Onion Rings (₹149)

### Main Course
- Butter Chicken (₹399)
- Biryani (₹499)
- Paneer Tikka (₹349)
- Fish Curry (₹449)

### Desserts
- Gulab Jamun (₹99)
- Ice Cream (₹149)
- Chocolate Cake (₹199)

### Beverages
- Masala Chai (₹49)
- Lassi (₹79)
- Coca Cola (₹59)

## 💰 Pricing Structure

- **GST**: 18% on subtotal
- **Delivery Charge**: ₹50 (FREE for orders above ₹500)
- **Packaging Charge**: ₹20

## 🔧 Configuration

### Application Properties
Key configuration options in `application.properties`:

```properties
# Server Configuration
server.port=8080

# Database Configuration
spring.datasource.url=jdbc:h2:mem:fooddeliverydb
spring.h2.console.enabled=true

# JSP Configuration
spring.mvc.view.prefix=/WEB-INF/jsp/
spring.mvc.view.suffix=.jsp
```

## 🛣️ API Endpoints

### Web Pages
- `GET /` - Redirects to menu
- `GET /menu` - Display menu page
- `GET /cart` - Display cart page
- `GET /cart/checkout` - Display checkout page
- `GET /cart/order-confirmation` - Display order confirmation

### REST API
- `GET /api/menu` - Get all menu items
- `GET /api/menu/category/{category}` - Get items by category
- `GET /api/menu/search?query={searchTerm}` - Search menu items
- `GET /api/cart` - Get cart details
- `POST /api/cart/add` - Add item to cart
- `PUT /api/cart/update` - Update cart item quantity
- `DELETE /api/cart/remove` - Remove item from cart
- `DELETE /api/cart/clear` - Clear cart

## 🎨 UI Features

- **Responsive Design**: Works on desktop, tablet, and mobile
- **Modern UI**: Clean, professional design with gradients and shadows
- **Interactive Elements**: Hover effects, smooth transitions
- **Real-time Updates**: Cart count updates via AJAX
- **Form Validation**: Client-side and server-side validation

## 🔍 Database Schema

### Tables
- `menu_items`: Food items with name, description, price, category
- `carts`: Shopping carts with session ID and customer info
- `cart_items`: Individual items in carts with quantities

## 🚀 Deployment

### Local Development
```bash
mvn spring-boot:run
```

### Production Build
```bash
mvn clean package
java -jar target/food-delivery-app-0.0.1-SNAPSHOT.jar
```

## 🧪 Testing

Run tests with:
```bash
mvn test
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📝 License

This project is licensed under the MIT License.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Check the application logs for debugging
- Review the H2 console for database inspection

## 🔄 Future Enhancements

- User authentication and registration
- Payment gateway integration
- Order tracking system
- Admin panel for menu management
- Email notifications
- Real-time order status updates
- Multiple restaurant support
- Reviews and ratings system

---

**Happy Coding! 🍕🍔🍜** 