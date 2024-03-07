import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';

class TextFieldAddress extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const TextFieldAddress({
    super.key,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child:
                Text(labelText, style: Theme.of(context).textTheme.bodyMedium)),
        const SizedBox(height: 5),
        TextField(
          style: Theme.of(context).textTheme.bodyMedium,
          controller: controller,
          keyboardType: keyboardType,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Palette.white,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.greyDark, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.greyDark, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
