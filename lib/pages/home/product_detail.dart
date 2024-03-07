import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshop_ecommerce/pages/cart/shopping_cart.dart';
import 'package:eshop_ecommerce/pages/home/modal_product.dart';
import 'package:eshop_ecommerce/pages/home/product.dart';
import 'package:eshop_ecommerce/pages/widgets/custom_button.dart';
import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  static String routeName = "/productdetail";

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 30,
        backgroundColor: Palette.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ShoppingCart.routeName);
              },
              child: Container(
                padding: const EdgeInsets.all(9.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Palette.white),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Palette.greyDark,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          decoration: const BoxDecoration(color: Palette.primary),
          child: Column(
            children: [
              Center(
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: 200.0,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  carouselController: _controller,
                  items: widget.product.images.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl: image,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              if (widget.product.images.length > 1)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.product.images.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Palette.greyLight).withOpacity(
                                _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.title,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'RM ${widget.product.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Palette.green, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.product.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                  CustomButton(
                    labelText: "SELECT ITEM",
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return ModalProduct(
                            product: widget.product,
                          );
                        },
                      );
                    },
                  ),
                ],
              )),
        )
      ]),
    );
  }
}
