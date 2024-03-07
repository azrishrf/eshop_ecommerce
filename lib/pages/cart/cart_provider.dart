import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:eshop_ecommerce/pages/cart/cart_item.dart';
import 'package:eshop_ecommerce/pages/home/product.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart with ChangeNotifier {
  List<CartItem> _cartItems = [];
  double _totalPrice = 0.0;

  List<CartItem> get cartItem => _cartItems;
  double get totalPrice => _totalPrice;

  void addToCart(Product product, int quantity) {
    var logger = Logger();

    int index =
        _cartItems.indexWhere((cartItem) => cartItem.productId == product.id);
    if (index != -1) {
      _cartItems[index] = CartItem(
        productId: product.id,
        title: product.title,
        quantity: _cartItems[index].quantity + quantity,
        totalPrice: _cartItems[index].totalPrice + (product.price * quantity),
        image: product.thumbnail,
      );
    } else {
      _cartItems.add(CartItem(
          productId: product.id,
          title: product.title,
          quantity: quantity,
          image: product.thumbnail,
          totalPrice: product.price * quantity));
    }
    // Logging _cartItems
    // logger.i('Cart Items:');
    // _cartItems.forEach(
    //   (cartItem) {
    //     logger.i(
    //         'ProductId: ${cartItem.productId}, Title: ${cartItem.title}, Quantity: ${cartItem.quantity}, Total Price: ${cartItem.totalPrice}');
    //   },
    // );

    // _totalPrice += product.price;
    notifyListeners();
  }

  void removeFromCart(int index) {
    // _totalPrice -= _cartItems[index].totalPrice;
    _cartItems.removeAt(index);
    notifyListeners();
  }

  Future<void> saveCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartItemsJson = jsonEncode(_cartItems);
    await prefs.setString('cart_items', cartItemsJson);
  }
}
