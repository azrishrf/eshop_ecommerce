import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop_ecommerce/pages/orders/order_details.dart';
import 'package:eshop_ecommerce/pages/orders/order_provider.dart';
import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  static String routeName = "/orders";

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  void initState() {
    super.initState();
    Provider.of<OrderProvider>(context, listen: false).loadOrder();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> orderHistory =
        Provider.of<OrderProvider>(context)
            .orderHistory
            .map((item) => item.toJson())
            .toList();

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
          for (var order in orderHistory) ...[
            GestureDetector(
              // onTap: () {
              //   Navigator.pushNamed(context, OrderDetails.routeName,
              //       arguments: orderHistory.indexOf(order));
              // },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetails(
                      orderHistory: order,
                    ),
                  ),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                        for (var i = 0; i < order['orderItem'].length; i++) ...[
                          if (i < 3)
                            CachedNetworkImage(
                              imageUrl: order['orderItem'][i]['image'],
                              fit: BoxFit.fill,
                              width: 60,
                            )
                          else if (i == 3) ...[
                            const SizedBox(width: 20),
                            const Icon(
                              Icons.pending,
                              color: Palette.greyDark2,
                              size: 30,
                            ),
                          ]
                        ],
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'RM ${order['totalPrice'].toStringAsFixed(2)}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Palette.green,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          order['date'],
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
          const SizedBox(height: 10),
          const Divider(
            color: Color(0xffF0F0F0),
            thickness: 2, // Adjust thickness as needed
          ),
          const SizedBox(height: 10),
        ]),
      )),
    );
  }
}
