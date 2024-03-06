import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop_ecommerce/pages/widgets/custom_button.dart';
import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';

class ModalProduct extends StatefulWidget {
  const ModalProduct({
    super.key,
  });

  @override
  State<ModalProduct> createState() => _ModalProductState();
}

class _ModalProductState extends State<ModalProduct> {
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
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://cdn.dummyjson.com/product-images/3/thumbnail.jpg',
                  fit: BoxFit.fill,
                  width: 100,
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Samsung",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Row(
                      children: [
                        Text(
                          "Quantity",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(width: 20),
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
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            CustomButton(labelText: "ADD TO CART", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
