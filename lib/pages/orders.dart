import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});
  static String routeName = "/orders";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(children: [
          Text("ORDERS")
          // List Item
        ]),
      )),

      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
