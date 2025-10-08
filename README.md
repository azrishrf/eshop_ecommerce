# eShop - Flutter E-commerce Application

E-commerce mobile application built with Flutter, featuring a clean and intuitive user interface with essential e-commerce functionalities.

## Features

- User Authentication

  - Login functionality
  - Profile management

- Product Management

  - Browse products
  - View product details
  - Product image gallery
  - Product search and filtering

- Shopping Cart

  - Add/remove items
  - Update quantities
  - Address management
  - Cart total calculation

- Order Management
  - Place orders
  - View order history
  - Order details tracking

## Technologies Used

- **Flutter** - UI framework for building natively compiled applications
- **Provider** - State management solution
- **HTTP** - API integration for product and order management
- **Shared Preferences** - Local storage for user data
- **Cached Network Image** - Efficient image loading and caching
- **Google Fonts** - Custom typography
- **Carousel Slider** - Interactive image galleries

## Project Structure

```
lib/
├── main.dart          # Application entry point
├── palette.dart       # Color definitions
├── theme.dart         # Theme configuration
├── pages/
│   ├── cart/         # Shopping cart functionality
│   ├── home/         # Home screen and product listings
│   ├── orders/       # Order management
│   └── widgets/      # Reusable UI components
```

## Getting Started

### Prerequisites

- Flutter SDK (>=3.2.3)
- Dart SDK
- Android Studio / VS Code with Flutter extension

### Installation

1. Clone the repository:

```bash
git clone https://github.com/azrishrf/eshop_ecommerce.git
```

2. Navigate to project directory:

```bash
cd eshop_ecommerce
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the application:

```bash
flutter run
```

## Screenshots

The application includes custom designed screens for:

- Login interface
- Product catalog
- Product details
- Shopping cart
- Order management
- User profile

## Architecture

The application follows a clean architecture pattern with:

- Provider for state management
- Separate data models and UI components
- API integration for backend communication
- Local storage for user preferences

