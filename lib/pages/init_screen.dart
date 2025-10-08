import 'package:eshop_ecommerce/pages/cart/shopping_cart.dart';
import 'package:eshop_ecommerce/pages/home/home.dart';
import 'package:eshop_ecommerce/pages/orders/orders.dart';
import 'package:eshop_ecommerce/pages/profile.dart';
import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  static String routeName = "/";

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int currentSelectedIndex = 0;

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  final pages = [const Home(), const Orders(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Row(
          children: [
            Image.asset('assets/images/todak_appbar_logo.png'),
            const SizedBox(width: 8),
            Text("TODAK eShop",
                style: Theme.of(context).textTheme.displayLarge),
          ],
        ),
        titleSpacing: 30,
        automaticallyImplyLeading: false,
        backgroundColor: Palette.primary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ShoppingCart.routeName);
              },
              child: Container(
                padding: const EdgeInsets.all(9.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Palette.white),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Palette.greyDark,
                ),
              ),
            ),
          ),
        ],
      ),
      body: pages[currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updateCurrentIndex,
        currentIndex: currentSelectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Palette.primary,
        unselectedItemColor: Palette.greyDark2,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: "Fav",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Chat",
          ),
        ],
      ),
    );
  }
}
