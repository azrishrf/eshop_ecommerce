import 'package:eshop_ecommerce/pages/login.dart';
import 'package:eshop_ecommerce/pages/route.dart';
import 'package:eshop_ecommerce/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/cart/cart_provider.dart';
import 'pages/orders/order_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todak_eShop',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      // home: const Login(),
      initialRoute: Login.routeName,
      routes: routes,
    );
  }
}
