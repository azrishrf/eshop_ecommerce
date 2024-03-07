class CartItem {
  final int productId;
  final String title;
  final String image;
  final int quantity;
  final double totalPrice;

  CartItem({
    this.productId = 0,
    this.title = "",
    this.image = "",
    required this.quantity,
    this.totalPrice = 0,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'],
      title: json['title'],
      quantity: json['quantity'],
      totalPrice: json['totalPrice'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'image': image,
    };
  }
}

class FullAddress {
  final int addressId;
  final String street;
  final String city;
  final String postcode;
  final String state;
  bool isSelected;

  FullAddress({
    required this.addressId,
    required this.street,
    required this.city,
    required this.postcode,
    required this.state,
    required this.isSelected,
  });

  factory FullAddress.fromJson(Map<String, dynamic> json) {
    return FullAddress(
      addressId: json['addressId'],
      street: json['street'],
      city: json['city'],
      postcode: json['postcode'],
      state: json['state'],
      isSelected: json['isSelected'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addressId': addressId,
      'street': street,
      'city': city,
      'postcode': postcode,
      'state': state,
      'isSelected': isSelected,
    };
  }
}
