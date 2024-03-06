import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop_ecommerce/pages/home/product_detail.dart';
import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static String routeName = "/home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Palette.primary,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Palette.primary),
                child: Text("All",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Palette.white)),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Palette.greyLight),
                child: Text("Smartphones",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Palette.primary)),
              ),
            ],
          ),

          // List Item
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
              border: Border.all(color: Palette.greyLight),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  onTap: () {
                    Navigator.pushNamed(context, ProductDetail.routeName);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Palette.white,
                        height: 140,
                        padding: EdgeInsets.symmetric(
                          // horizontal: 16,
                          vertical: 10,
                        ),
                        alignment: Alignment.center,
                        // child: (itemsZakatBodies.node?.image?.files?.isNotEmpty ??
                        //         false)
                        //     ? CachedNetworkImage(
                        //         imageUrl: itemsZakatBodies
                        //                 .node?.image?.files?[0].node?.url ??
                        //             "",
                        //         fit: BoxFit.fill,
                        //       )
                        //     : null,
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://cdn.dummyjson.com/product-images/3/thumbnail.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        color: Palette.greyLight,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Samsung",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              // SpacerV(value: 4),
                              Text(
                                "RM120",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Palette.green),
                              ),
                              Text(
                                "Samsung's new variant which goes beyond Galaxy to the Universe",
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      )),
    );
  }
}
