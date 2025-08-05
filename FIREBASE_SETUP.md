# Firebase Authentication Setup Guide

This guide will help you set up Firebase authentication for your food delivery application.

## Prerequisites

1. A Google account
2. Access to Firebase Console
3. Your Spring Boot application running

## Step 1: Create a Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project" or "Add project"
3. Enter your project name (e.g., "food-delivery-app")
4. Choose whether to enable Google Analytics (optional)
5. Click "Create project"

## Step 2: Enable Authentication

1. In your Firebase project console, go to "Authentication" in the left sidebar
2. Click "Get started"
3. Go to the "Sign-in method" tab
4. Enable the following providers:
   - **Email/Password**: Click "Enable" and save
   - **Google**: Click "Enable", add your support email, and save

## Step 3: Get Firebase Configuration

1. In your Firebase project console, go to "Project settings" (gear icon)
2. Scroll down to "Your apps" section
3. Click "Add app" and select "Web" (</>)
4. Register your app with a nickname (e.g., "food-delivery-web")
5. Copy the Firebase configuration object

## Step 4: Update Application Configuration

### Update Firebase Config in JavaScript

1. Open `src/main/resources/static/js/script.js`
2. Find the `firebaseConfig` object (around line 8)
3. Replace the placeholder values with your actual Firebase configuration:

```javascript
const firebaseConfig = {
    apiKey: "your-actual-api-key",
    authDomain: "your-project-id.firebaseapp.com",
    projectId: "your-project-id",
    storageBucket: "your-project-id.appspot.com",
    messagingSenderId: "your-sender-id",
    appId: "your-app-id"
};
```

### Update Application Properties

1. Open `src/main/resources/application.properties`
2. Update the Firebase project ID:

```properties
firebase.project.id=your-actual-project-id
```

## Step 5: Get Service Account Key

1. In Firebase project console, go to "Project settings"
2. Go to the "Service accounts" tab
3. Click "Generate new private key"
4. Download the JSON file
5. Rename it to `firebase-service-account.json`
6. Place it in `src/main/resources/`

## Step 6: Update Firebase Configuration Class

1. Open `src/main/java/com/fooddelivery/config/FirebaseConfig.java`
2. Uncomment the Firebase initialization code:

```java
@PostConstruct
public void initializeFirebase() {
    try {
        if (FirebaseApp.getApps().isEmpty()) {
            InputStream serviceAccount = new ClassPathResource(serviceAccountKeyPath).getInputStream();
            
            FirebaseOptions options = FirebaseOptions.builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .setProjectId(projectId)
                    .build();
            
            FirebaseApp.initializeApp(options);
        }
    } catch (IOException e) {
        throw new RuntimeException("Failed to initialize Firebase", e);
    }
}
```

## Step 7: Add Firebase SDK to HTML

1. Open `src/main/webapp/WEB-INF/jsp/index.jsp`
2. Add Firebase SDK before the closing `</body>` tag:

```html
<!-- Firebase SDK -->
<script src="https://www.gstatic.com/firebasejs/9.1.1/firebase-app-compat.js"></script>
<script src="https://www.gstatic.com/firebasejs/9.1.1/firebase-auth-compat.js"></script>

<!-- Initialize Firebase -->
<script>
    firebase.initializeApp({
        apiKey: "your-api-key",
        authDomain: "your-project-id.firebaseapp.com",
        projectId: "your-project-id",
        storageBucket: "your-project-id.appspot.com",
        messagingSenderId: "your-sender-id",
        appId: "your-app-id"
    });
</script>
```

## Step 8: Update JavaScript Authentication

1. Open `src/main/resources/static/js/script.js`
2. Uncomment the Firebase initialization line:
   ```javascript
   firebase.initializeApp(firebaseConfig);
   ```

3. Replace the demo authentication functions with real Firebase auth:

```javascript
function loginWithEmail() {
    const email = document.getElementById('loginEmail').value;
    const password = document.getElementById('loginPassword').value;
    
    firebase.auth().signInWithEmailAndPassword(email, password)
        .then((userCredential) => {
            const user = userCredential.user;
            return fetch('/auth/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    firebaseUid: user.uid,
                    displayName: user.displayName || user.email.split('@')[0],
                    email: user.email
                })
            });
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                currentUser = data.user;
                updateAuthUI();
                showToast('Success', 'Login successful!');
                showPage('home');
            }
        })
        .catch((error) => {
            showToast('Error', error.message);
        });
}

function loginWithGoogle() {
    const provider = new firebase.auth.GoogleAuthProvider();
    
    firebase.auth().signInWithPopup(provider)
        .then((result) => {
            const user = result.user;
            return fetch('/auth/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    firebaseUid: user.uid,
                    displayName: user.displayName,
                    email: user.email
                })
            });
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                currentUser = data.user;
                updateAuthUI();
                showToast('Success', 'Google login successful!');
                showPage('home');
            }
        })
        .catch((error) => {
            showToast('Error', error.message);
        });
}
```

## Step 9: Test the Application

1. Start your Spring Boot application
2. Navigate to `http://localhost:8080`
3. Click the "Login" button
4. Try both email/password and Google authentication

## Features Available

With Firebase authentication integrated, your application now supports:

### User Management
- ✅ User registration with email/password
- ✅ Google OAuth authentication
- ✅ User profile management
- ✅ Session management
- ✅ User-specific cart data

### User Profile Features
- ✅ Personal information (name, email, phone, address)
- ✅ Order history tracking
- ✅ Total spent statistics
- ✅ Last login tracking

### Cart Integration
- ✅ User-specific shopping carts
- ✅ Persistent cart data across sessions
- ✅ Order completion tracking

## Security Features

- ✅ Firebase UID-based authentication
- ✅ Session-based server-side validation
- ✅ Secure API endpoints with authentication checks
- ✅ User data isolation

## Database Schema

The application now includes a `users` table with:
- `id` (Primary Key)
- `firebase_uid` (Unique Firebase User ID)
- `display_name` (User's display name)
- `email` (User's email address)
- `phone_number` (Optional phone number)
- `profile_image_url` (Optional profile image)
- `default_address` (Default delivery address)
- `preferred_payment_method` (Payment preference)
- `total_orders` (Order count)
- `total_spent` (Total amount spent)
- `created_at` (Account creation date)
- `last_login` (Last login timestamp)
- `is_active` (Account status)
- `email_verified` (Email verification status)

## API Endpoints

### Authentication
- `POST /auth/register` - User registration
- `POST /auth/login` - User login
- `POST /auth/logout` - User logout
- `GET /auth/user-info` - Get current user info
- `POST /auth/update-profile` - Update user profile

### User Profile
- `GET /auth/profile` - Profile page
- `GET /auth/login` - Login page

## Troubleshooting

### Common Issues

1. **Firebase not initialized**: Check that your service account JSON is in the correct location
2. **Authentication fails**: Verify your Firebase project ID and API keys
3. **CORS errors**: Ensure your Firebase project allows your domain
4. **Database errors**: Check that the User entity is properly configured

### Debug Steps

1. Check browser console for JavaScript errors
2. Check application logs for server-side errors
3. Verify Firebase configuration in browser console
4. Test Firebase authentication in Firebase console

## Next Steps

1. **Customize UI**: Modify the authentication forms to match your brand
2. **Add more providers**: Enable Facebook, Twitter, or other OAuth providers
3. **Email verification**: Implement email verification flow
4. **Password reset**: Add password reset functionality
5. **User roles**: Implement admin/user role system
6. **Push notifications**: Add Firebase Cloud Messaging for order updates

## Support

If you encounter any issues:
1. Check the Firebase console for authentication logs
2. Review the application logs for server-side errors
3. Verify all configuration files are properly set up
4. Ensure all dependencies are correctly installed

Your food delivery application now has a complete user authentication system with Firebase! 