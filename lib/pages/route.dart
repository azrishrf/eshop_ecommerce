import 'package:eshop_ecommerce/pages/cart/add_address.dart';
import 'package:eshop_ecommerce/pages/cart/address.dart';
import 'package:eshop_ecommerce/pages/home/product.dart';
import 'package:eshop_ecommerce/pages/home/product_detail.dart';
import 'package:eshop_ecommerce/pages/init_screen.dart';
import 'package:eshop_ecommerce/pages/cart/shopping_cart.dart';
import 'package:eshop_ecommerce/pages/orders/order_details.dart';
import 'package:flutter/material.dart';
import 'package:eshop_ecommerce/pages/home/home.dart';
import 'package:eshop_ecommerce/pages/login.dart';
import 'package:eshop_ecommerce/pages/orders/orders.dart';
import 'package:eshop_ecommerce/pages/profile.dart';

final Map<String, WidgetBuilder> routes = {
  InitScreen.routeName: (context) => const InitScreen(),
  Login.routeName: (context) => const Login(),
  Home.routeName: (context) => const Home(),
  Orders.routeName: (context) => const Orders(),
  Profile.routeName: (context) => const Profile(),
  ShoppingCart.routeName: (context) => const ShoppingCart(),
  Address.routeName: (context) => const Address(),
  AddAddress.routeName: (context) => const AddAddress(),
  ProductDetail.routeName: (context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return ProductDetail(product: args as Product);
  },
};
