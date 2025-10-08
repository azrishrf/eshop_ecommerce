import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String labelText;
  final void Function()? onPressed;
  final bool showIcon;
  final IconData icon;

  const CustomButton({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.showIcon = false,
    this.icon = Icons.add,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Palette.primary),
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 15)),
        fixedSize: MaterialStatePropertyAll(Size.fromWidth(300)),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        )),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showIcon) ...[
            Icon(
              icon,
              color: Palette.white,
              size: 20,
            ),
            const SizedBox(width: 8.0), // Add spacing between icon and text
          ],
          Text(labelText,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Palette.white)),
        ],
      ),
    );
  }
}
