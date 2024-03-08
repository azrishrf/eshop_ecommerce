import 'package:eshop_ecommerce/pages/cart/cart_item.dart';

class Order {
  final int orderId;
  final List<OrderItem> orderItem;
  final String date;
  final String time;
  final FullAddress? address;
  final double totalPrice;

  Order({
    required this.orderId,
    required this.orderItem,
    required this.date,
    required this.time,
    required this.address,
    required this.totalPrice,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['orderId'],
      orderItem: json['orderItem']
          .map<OrderItem>((jsonOrderItem) => OrderItem.fromJson(jsonOrderItem))
          .toList(),
      date: json['date'],
      time: json['time'],
      address: FullAddress.fromJson(json['address']),
      totalPrice: json['totalPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'orderItem': orderItem.map((orderItem) => orderItem.toJson()).toList(),
      'date': date,
      'time': time,
      'address': address?.toJson(),
      'totalPrice': totalPrice,
    };
  }
}

class OrderItem {
  final int productId;
  final String title;
  final int quantity;
  final double totalPrice;
  final String image;

  OrderItem(
      {required this.productId,
      required this.quantity,
      required this.totalPrice,
      required this.image,
      required this.title});

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['productId'],
      quantity: json['quantity'],
      totalPrice: json['totalPrice'],
      image: json['image'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'image': image,
      'title': title,
    };
  }
}
