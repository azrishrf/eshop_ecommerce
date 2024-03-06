import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop_ecommerce/pages/home/modal_product.dart';
import 'package:eshop_ecommerce/pages/widgets/custom_button.dart';
import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  static String routeName = "/productdetail";

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 30,
        backgroundColor: Palette.primary,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
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
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(color: Palette.primary),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl:
                    'https://cdn.dummyjson.com/product-images/3/thumbnail.jpg',
                fit: BoxFit.fill,
                width: 300,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Samsung",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        "RM 1200",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Palette.green, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Samsung's new variant which goes beyond Galaxy to the Universe",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  CustomButton(
                    labelText: "SELECT ITEM",
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const ModalProduct();
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
