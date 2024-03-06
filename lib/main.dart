import 'package:eshop_ecommerce/pages/login.dart';
import 'package:eshop_ecommerce/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: const Login(),
    );
  }
}
