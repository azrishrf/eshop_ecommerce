class Cart {
  final List<CartItem> cartItem;
  final double totalPrice;

  Cart({required this.cartItem, required this.totalPrice});
}

class CartItem {
  final int productId;
  final String title;
  final String image;
  final int quantity;
  final double totalPrice;

  CartItem(
      {required this.productId,
      required this.title,
      required this.image,
      required this.quantity,
      required this.totalPrice});

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'image': image,
    };
  }

  static fromJson(json) {}
}

class FullAddress {
  final String street;
  final String city;
  final String postcode;
  final String state;

  FullAddress(
      {required this.street,
      required this.city,
      required this.postcode,
      required this.state});
}
