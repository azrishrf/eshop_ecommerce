import 'package:eshop_ecommerce/pages/widgets/custom_button.dart';
import 'package:eshop_ecommerce/pages/widgets/text_field_address.dart';
import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});
  static String routeName = "/addaddress";

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add  Address",
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(children: [
              TextFieldAddress(
                labelText: "Address",
              ),
              TextFieldAddress(
                labelText: "City",
              ),
              TextFieldAddress(
                labelText: "Postcode",
              ),
              TextFieldAddress(
                labelText: "State",
              ),
            ]),
            CustomButton(
                labelText: "CONFIRM",
                onPressed: () {
                  Navigator.pushNamed(context, AddAddress.routeName);
                }),
          ],
        ),
      ),
    );
  }
}
