import 'dart:convert';

import 'package:eshop_ecommerce/pages/cart/address.dart';
import 'package:eshop_ecommerce/pages/cart/cart_item.dart';
import 'package:eshop_ecommerce/pages/cart/cart_provider.dart';
import 'package:eshop_ecommerce/pages/orders/order_provider.dart';
import 'package:eshop_ecommerce/pages/widgets/custom_button.dart';
import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});
  static String routeName = "/shoppingcart";

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false).loadCart();
    Provider.of<CartProvider>(context, listen: false).loadAddress();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> cartItems = Provider.of<CartProvider>(context)
        .cartItems
        .map((item) => item.toJson())
        .toList();

    List<Map<String, dynamic>> addresses = Provider.of<CartProvider>(context)
        .addresses
        .map((item) => item.toJson())
        .toList();
    FullAddress? selectedAddress;
    for (var address in addresses) {
      if (address['isSelected'] == true) {
        selectedAddress = FullAddress.fromJson(address);
      }
    }

    String combinedAddress =
        '${selectedAddress?.street}, ${selectedAddress?.city}, ${selectedAddress?.state}';

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 20)),
        centerTitle: true,
        titleSpacing: 30,
        backgroundColor: Palette.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (cartItems.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'No Items in Cart. Please add some items to cart.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            else ...[
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  for (var item in cartItems) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 13,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 70,
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Image.network(
                              item['image'],
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 150,
                                child: Text(
                                  item['title'],
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 24,
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        Provider.of<CartProvider>(context,
                                                listen: false)
                                            .subtractQuantity(
                                                item['productId']);
                                      },
                                      mini: true,
                                      shape: const CircleBorder(),
                                      backgroundColor: Palette.blue,
                                      child: const Icon(
                                        Icons.remove,
                                        color: Palette.white,
                                        size: 14,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  SizedBox(
                                      width: 18,
                                      child: Text(
                                        item['quantity'].toString(),
                                        textAlign: TextAlign.center,
                                      )),
                                  const SizedBox(width: 15),
                                  SizedBox(
                                    width: 24,
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        setState(() {
                                          item['quantity']++;
                                        });
                                        Provider.of<CartProvider>(context,
                                                listen: false)
                                            .addQuantity(item['productId']);
                                      },
                                      mini: true,
                                      shape: const CircleBorder(),
                                      backgroundColor: Palette.blue,
                                      child: const Icon(
                                        Icons.add,
                                        color: Palette.white,
                                        size: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .removeFromCart(item['productId']);
                                },
                                child: const Icon(Icons.delete,
                                    color: Palette.red, size: 20),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 90,
                                child: Text(
                                  'RM ${item['totalPrice'].toStringAsFixed(2)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Palette.green,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const Divider(
                      color: Color(0xffF0F0F0),
                      thickness: 2, // Adjust thickness as needed
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Address.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 13,
                            offset: const Offset(
                                0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.place),
                        title: Text("Delivery Address",
                            style: Theme.of(context).textTheme.bodyMedium),
                        subtitle: Text(combinedAddress,
                            style: Theme.of(context).textTheme.bodyMedium),
                        trailing: const Icon(Icons.navigate_next),
                        onTap: () {
                          Navigator.pushNamed(context, Address.routeName);
                        },
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 13,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold)),
                        Text(
                            "RM ${Provider.of<CartProvider>(context).totalPrice.toStringAsFixed(2)} ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Palette.green,
                                    fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                      labelText: "CHECK OUT",
                      onPressed: () async {
                        Provider.of<OrderProvider>(context, listen: false)
                            .addOrder(
                                cartItems,
                                selectedAddress,
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .totalPrice);

                        // final prefs = await SharedPreferences.getInstance();
                        // prefs.remove("order_history");

                        // String? orderHistory = prefs.getString('order_history');
                        // print(orderHistory);
                      })
                ]),
              ),
            ],
            // Total Price
          ],
        ),
      ),
    );
  }
}
