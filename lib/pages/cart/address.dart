import 'package:eshop_ecommerce/pages/cart/add_address.dart';
import 'package:eshop_ecommerce/pages/widgets/custom_button.dart';
import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';

class Address extends StatefulWidget {
  const Address({super.key});
  static String routeName = "/address";

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address Selection",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 20)),
        centerTitle: true,
        titleSpacing: 30,
        backgroundColor: Palette.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.place),
                const SizedBox(width: 10),
                Text(
                  "Delivery Address",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                children: [
                  const Icon(
                    Icons.radio_button_checked,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "No.8 Jln SP 3/2 Seri  Pristana, 47000 Sungai Buloh, Selangor",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  // const Icon(Icons.navigate_next)
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                children: [
                  const Icon(
                    Icons.radio_button_unchecked,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "No.8 Jln SP 3/2 Seri  Pristana, 47000 Sungai Buloh, Selangor",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  // const Icon(Icons.navigate_next)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Color(0xffF0F0F0),
              thickness: 2, // Adjust thickness as needed
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              labelText: "Add New Address",
              onPressed: () {
                Navigator.pushNamed(context, AddAddress.routeName);
              },
              showIcon: true,
            ),
          ],
        ),
      ),
    );
  }
}
