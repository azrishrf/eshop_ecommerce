import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;

  const TextFieldLogin({
    super.key,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(labelText,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Palette.white))),
        const SizedBox(height: 5),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: Palette.blue,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Palette.white, width: 3),
                borderRadius: BorderRadius.all(Radius.circular(40))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Palette.white, width: 3),
                borderRadius: BorderRadius.all(Radius.circular(40))),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            suffixIcon: Padding(
              padding:
                  const EdgeInsets.only(right: 20), // Adjust the padding here
              child: Icon(
                icon,
                color: Palette.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
