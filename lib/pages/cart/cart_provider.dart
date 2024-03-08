import 'dart:convert';
import 'package:eshop_ecommerce/pages/cart/cart_item.dart';
import 'package:eshop_ecommerce/pages/home/product.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];
  List<FullAddress> _addresses = [];

  double _totalPrice = 0.0;

  List<CartItem> get cartItems => _cartItems;
  List<FullAddress> get addresses => _addresses;

  double get totalPrice => _totalPrice;

  Future<List<CartItem>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonCartString = prefs.getString('cart_items');

    if (jsonCartString != null) {
      List<dynamic> jsonCart = jsonDecode(jsonCartString) as List<dynamic>;
      List<CartItem> cart = jsonCart
          .map((jsonProduct) => CartItem.fromJson(jsonProduct))
          .toList();
      _cartItems = cart;

      return cart;
    } else {
      return [];
    }
  }

  Future<void> addToCart(Product product, int quantity) async {
    _cartItems = await loadCart();

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
    _totalPrice = calculateTotalPrice(_cartItems);

    saveCartItems();
    notifyListeners();
  }

  double calculateTotalPrice(List<CartItem> cartItems) {
    double totalPrice = 0.0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.totalPrice;
    }
    return totalPrice;
  }

  Future<void> saveCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartItemsJson = jsonEncode(_cartItems);
    await prefs.setString('cart_items', cartItemsJson);
  }

  Future<void> saveAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String addressJson = jsonEncode(_addresses);
    await prefs.setString('address', addressJson);
  }

  void removeFromCart(int productId) {
    int index =
        _cartItems.indexWhere((cartItem) => cartItem.productId == productId);
    _cartItems.removeAt(index);
    _totalPrice = calculateTotalPrice(_cartItems);

    saveCartItems();
    notifyListeners();
  }

  void addQuantity(int productId) {
    int index =
        _cartItems.indexWhere((cartItem) => cartItem.productId == productId);

    _cartItems[index] = CartItem(
      productId: _cartItems[index].productId,
      title: _cartItems[index].title,
      quantity: _cartItems[index].quantity + 1,
      totalPrice: _cartItems[index].totalPrice +
          (_cartItems[index].totalPrice / _cartItems[index].quantity),
      image: _cartItems[index].image,
    );

    _totalPrice = calculateTotalPrice(_cartItems);
    saveCartItems();
    notifyListeners();
  }

  void subtractQuantity(int productId) {
    int index =
        _cartItems.indexWhere((cartItem) => cartItem.productId == productId);

    if (_cartItems[index].quantity > 1) {
      _cartItems[index] = CartItem(
        productId: _cartItems[index].productId,
        title: _cartItems[index].title,
        quantity: _cartItems[index].quantity - 1,
        totalPrice: _cartItems[index].totalPrice -
            (_cartItems[index].totalPrice / _cartItems[index].quantity),
        image: _cartItems[index].image,
      );
      _totalPrice = calculateTotalPrice(_cartItems);
      saveCartItems();
      notifyListeners();
    }
  }

  Future<List<FullAddress>> loadAddress() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonAddressString = prefs.getString('address');

    if (jsonAddressString != null) {
      List<dynamic> jsonAddress =
          jsonDecode(jsonAddressString) as List<dynamic>;
      List<FullAddress> address = jsonAddress
          .map((jsonAddress) => FullAddress.fromJson(jsonAddress))
          .toList();
      _addresses = address;

      return address;
    } else {
      return [];
    }
  }

  Future<void> addAddress(
      String street, String city, String postcode, String state) async {
    _addresses.add(
      FullAddress(
          addressId: _addresses.length + 1,
          street: street,
          city: city,
          postcode: postcode,
          state: state,
          isSelected: _addresses.length + 1 == 1 ? true : false),
    );

    saveAddress();
    notifyListeners();
  }

  void setSelectedAddress(Map<String, dynamic> address) {
    for (var element in _addresses) {
      element.isSelected = false;
    }

    int index = _addresses
        .indexWhere((element) => element.addressId == address['addressId']);
    _addresses[index].isSelected = true;

    saveAddress();
    notifyListeners();
  }
}
