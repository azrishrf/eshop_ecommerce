import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop_ecommerce/pages/orders/order_details.dart';
import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  static String routeName = "/orders";

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              "Orders History",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, OrderDetails.routeName);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            'https://cdn.dummyjson.com/product-images/3/thumbnail.jpg',
                        fit: BoxFit.fill,
                        width: 70,
                      ),
                      const SizedBox(width: 10),
                      CachedNetworkImage(
                        imageUrl:
                            'https://cdn.dummyjson.com/product-images/3/thumbnail.jpg',
                        fit: BoxFit.fill,
                        width: 70,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "RM 1200",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Palette.green, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "13 Jan 2022",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          const Divider(
            color: Color(0xffF0F0F0),
            thickness: 2, // Adjust thickness as needed
          ),
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://cdn.dummyjson.com/product-images/3/thumbnail.jpg',
                      fit: BoxFit.fill,
                      width: 70,
                    ),
                    const SizedBox(width: 10),
                    CachedNetworkImage(
                      imageUrl:
                          'https://cdn.dummyjson.com/product-images/3/thumbnail.jpg',
                      fit: BoxFit.fill,
                      width: 70,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "RM 1200",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Palette.green, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "13 Jan 2022",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
