import 'package:eshop_ecommerce/pages/home/product_detail.dart';
import 'package:eshop_ecommerce/pages/init_screen.dart';
import 'package:eshop_ecommerce/pages/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:eshop_ecommerce/pages/home/home.dart';
import 'package:eshop_ecommerce/pages/login.dart';
import 'package:eshop_ecommerce/pages/orders.dart';
import 'package:eshop_ecommerce/pages/profile.dart';

final Map<String, WidgetBuilder> routes = {
  InitScreen.routeName: (context) => const InitScreen(),
  Login.routeName: (context) => const Login(),
  Home.routeName: (context) => const Home(),
  ProductDetail.routeName: (context) => const ProductDetail(),
  Orders.routeName: (context) => const Orders(),
  Profile.routeName: (context) => const Profile(),
  ShoppingCart.routeName: (context) => const ShoppingCart(),
};
