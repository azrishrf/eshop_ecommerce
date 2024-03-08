import 'dart:convert';

import 'package:eshop_ecommerce/pages/cart/cart_item.dart';
import 'package:eshop_ecommerce/pages/orders/order_items.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderProvider with ChangeNotifier {
  List<Order> _orderHistory = [];

  List<Order> get orderHistory => _orderHistory;

  Future<void> addOrder(List<Map<String, dynamic>> cartItems,
      FullAddress? address, double totalPrice) async {
    Order order = Order(
      orderId: _orderHistory.length + 1,
      orderItem: [
        for (var order in cartItems)
          OrderItem(
              productId: order['productId'],
              quantity: order['quantity'],
              totalPrice: order['totalPrice'],
              image: order['image'],
              title: order['title'])
      ],
      date: DateTime.now().toIso8601String().split('T')[0],
      time: DateTime.now().toIso8601String().split('T')[1].split('.')[0],
      address: address,
      totalPrice: totalPrice,
    );
    _orderHistory.add(order);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String orderHistory = jsonEncode(_orderHistory);
    await prefs.setString('order_history', orderHistory);

    notifyListeners();
  }

  Future<List<Order>> loadOrder() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonOrderString = prefs.getString('order_history');

    if (jsonOrderString != null) {
      List<dynamic> jsonOrder = jsonDecode(jsonOrderString) as List<dynamic>;
      List<Order> order =
          jsonOrder.map((jsonOrder) => Order.fromJson(jsonOrder)).toList();
      _orderHistory = order;

      return order;
    } else {
      return [];
    }
  }
}
