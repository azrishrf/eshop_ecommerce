import 'package:eshop_ecommerce/pages/cart/cart_item.dart';

class Order {
  final int orderId;
  final List<OrderItem> orderItem;
  final String date;
  final String time;
  final FullAddress address;

  Order({
    required this.orderId,
    required this.orderItem,
    required this.date,
    required this.time,
    required this.address,
  });
}

class OrderItem {
  final String productId;
  final int quantity;
  final double totalPrice;

  OrderItem(
      {required this.productId,
      required this.quantity,
      required this.totalPrice});
}
