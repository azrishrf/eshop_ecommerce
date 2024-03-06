import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop_ecommerce/pages/widgets/custom_button.dart';
import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});
  static String routeName = "/shoppingcart";

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart",
            style: Theme.of(context).textTheme.displayLarge),
        centerTitle: true,
        titleSpacing: 30,
        backgroundColor: Palette.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.07),
                      spreadRadius: 2,
                      blurRadius: 13,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // CachedNetworkImage(
                    //   imageUrl:
                    //       'https://cdn.dummyjson.com/product-images/3/thumbnail.jpg',
                    //   fit: BoxFit.fill,
                    //   width: 100,
                    // ),
                    Image.network(
                      "https://cdn.dummyjson.com/product-images/3/thumbnail.jpg",
                      fit: BoxFit.fill,
                      width: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Samsung Universe 9",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton(
                              onPressed: _decrementCount,
                              mini: true,
                              shape: const CircleBorder(),
                              backgroundColor: Palette.blue,
                              child: const Icon(
                                Icons.remove,
                                color: Palette.white,
                              ),
                            ),
                            const SizedBox(width: 15),
                            SizedBox(
                                width: 18,
                                child: Text(
                                  "${_count}",
                                  textAlign: TextAlign.center,
                                )),
                            const SizedBox(width: 15),
                            FloatingActionButton(
                              onPressed: _incrementCount,
                              mini: true,
                              shape: const CircleBorder(),
                              backgroundColor: Palette.blue,
                              child: const Icon(
                                Icons.add,
                                color: Palette.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "RM 1200",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Palette.green, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Palette.greyHome,
                thickness: 2, // Adjust thickness as needed
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.07),
                      spreadRadius: 2,
                      blurRadius: 13,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.place),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivery Address",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            "Street name, City Name, 40303 Selangor Darul Ehsan",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const Column(children: [
                      SizedBox(
                        height: 20,
                      ),
                      Icon(Icons.navigate_next)
                    ])
                  ],
                ),
              ),
            ]),
          ),

          Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.07),
                      spreadRadius: 2,
                      blurRadius: 13,
                      offset: const Offset(0, 0), // changes position of shadow
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
                    Text("RM 1200",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Palette.green, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              SizedBox(height: 20),
              CustomButton(labelText: "CHECK OUT", onPressed: () {})
            ]),
          )
          // Total Price
        ],
      ),
    );
  }
}
