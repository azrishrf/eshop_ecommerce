import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop_ecommerce/pages/home/product.dart';
import 'package:eshop_ecommerce/pages/home/product_api.dart';
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
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ProductAPI().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product> products = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.7,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ProductDetail.routeName,
                              arguments: products[index],
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Palette.white,
                                // height: 140,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
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
                                  imageUrl: products[index].thumbnail,
                                  fit: BoxFit.fitWidth,
                                  height: 100,
                                ),
                              ),
                              Container(
                                color: Palette.greyLight,
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 40,
                                        child: Text(
                                          products[index].title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                      // SpacerV(value: 4),
                                      Text(
                                        'RM ${products[index].price.toStringAsFixed(2)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Palette.green),
                                      ),
                                      Text(
                                        products[index].description,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
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
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          // By default, show a loading spinner
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
