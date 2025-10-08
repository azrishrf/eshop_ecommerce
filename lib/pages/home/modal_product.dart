import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop_ecommerce/pages/cart/cart_provider.dart';
import 'package:eshop_ecommerce/pages/home/product.dart';
import 'package:eshop_ecommerce/pages/widgets/custom_button.dart';
import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModalProduct extends StatefulWidget {
  final Product product;

  const ModalProduct({super.key, required this.product});

  @override
  State<ModalProduct> createState() => _ModalProductState();
}

class _ModalProductState extends State<ModalProduct> {
  int _count = 1;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    if (_count > 1) {
      setState(() {
        _count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.product.thumbnail,
                  fit: BoxFit.cover,
                  width: 100,
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.title,
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
                                    "$_count",
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
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            CustomButton(
                labelText: "ADD TO CART",
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .addToCart(widget.product, _count);
                  Provider.of<CartProvider>(context, listen: false)
                      .saveCartItems();
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
