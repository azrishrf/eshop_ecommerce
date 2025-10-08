import 'package:eshop_ecommerce/pages/cart/cart_provider.dart';
import 'package:eshop_ecommerce/pages/widgets/custom_button.dart';
import 'package:eshop_ecommerce/pages/widgets/text_field_address.dart';
import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});
  static String routeName = "/addaddress";

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postcodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
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
            Column(children: [
              TextFieldAddress(
                labelText: "Street Address",
                controller: streetController,
              ),
              TextFieldAddress(
                labelText: "City",
                controller: cityController,
              ),
              TextFieldAddress(
                labelText: "Postcode",
                controller: postcodeController,
                keyboardType: TextInputType.number,
              ),
              TextFieldAddress(
                labelText: "State",
                controller: stateController,
              ),
            ]),
            CustomButton(
              labelText: "CONFIRM",
              onPressed: () async {
                Provider.of<CartProvider>(context, listen: false).addAddress(
                  streetController.text,
                  cityController.text,
                  postcodeController.text,
                  stateController.text,
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
