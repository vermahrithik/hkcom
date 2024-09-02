import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hkcom/controller/productcontroller.dart';
import 'package:hkcom/model/productmodel.dart';
import 'package:hkcom/routing/app_route_constants.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  /// ---------------------------------
  final productsController = Get.find<ProductsController>();
  final GetStorage storage = GetStorage();

  final List<ProductModel> products = [
    ProductModel(
      title: "Avacado",
      price: "\$599",
      shipping_type: "Free Shipping",
      availability: true,
      category: "Fruits",
      product_id: 01,
      image: "avacado.jpg",
    ),
    ProductModel(
      title: "Wall Painting",
      price: "\$899",
      shipping_type: "Express Shipping",
      availability: true,
      category: "Art",
      product_id: 02,
      image: "city.jpg",
    ),
    ProductModel(
      title: "Drone",
      price: "\$199",
      shipping_type: "Standard Shipping",
      availability: true,
      category: "Electronics",
      product_id: 03,
      image: "drone.jpg",
    ),
    ProductModel(
      title: "Luggage",
      price: "\$129",
      shipping_type: "Free Shipping",
      availability: false,
      category: "Travel Accessories",
      product_id: 04,
      image: "luggage.jpg",
    ),
    ProductModel(
      title: "Mandala Art 01",
      price: "\$299",
      shipping_type: "Standard Shipping",
      availability: true,
      category: "Art",
      product_id: 05,
      image: "mandala.jpg",
    ),
    ProductModel(
      title: "Mandala Art 02",
      price: "\$499",
      shipping_type: "Express Shipping",
      availability: true,
      category: "Art",
      product_id: 06,
      image: "mandala01.jpg",
    ),
    ProductModel(
      title: "Oversized Tshirt",
      price: "\$1200",
      shipping_type: "Free Shipping",
      availability: false,
      category: "Clothes",
      product_id: 07,
      image: "oversized.jpg",
    ),
    ProductModel(
      title: "Handmade Painting",
      price: "\$1200",
      shipping_type: "Free Shipping",
      availability: true,
      category: "Art",
      product_id: 08,
      image: "portrait.jpg",
    ),
  ];

  // productsController.products = products.map<ProductModel>((product)=>ProductModel.fromJson(product)).toList();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Obx(() {
      return Scaffold(
        backgroundColor: Color(0xff131C25),
        appBar: AppBar(
          backgroundColor: Color(0xff223243),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chevron_left,
                color: Color(0xffBC1D58),
              )),
          actions: [
            Container(
              width: 35,
              height: 35,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Stack(alignment: Alignment.center, children: [
                OutlinedButton(
                    onPressed: () {
                      debugPrint('Open Cart Page');
                      debugPrint(
                          'total products in cart : ${productsController.addedToCart.length}');
                      // debugPrint('${productsController.addedToCart.map<ProductModel>((element)=>ProductModel.fromJson(element as Map<String, dynamic>)).toList()}');
                      debugPrint(
                          '${productsController.addedToCart.map((product) => {
                                'product_id': product.product_id,
                                'title': product.title,
                                'price': product.price,
                                'category': product.category,
                                'image': product.image,
                                'availability': product.availability,
                                'shipping_type': product.shipping_type,
                              }).toList()}');
                      context.goNamed(MyAppRouteConstants.cartRouteName);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      side: BorderSide(
                        color: Color(0xffBC1D58),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                    child: Icon(
                      CupertinoIcons.cart,
                      color: Color(0xffBC1D58),
                      size: 18,
                    )),
                Transform.translate(
                  offset: const Offset(8, -7),
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: Color(0xffD7D8C9),
                    child: Text(
                      '${productsController.addedToCart.length}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 7,
                          color: Color(0xff223243)),
                    ),
                  ),
                )
              ]),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: deviceWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 4,
                        child: Text("H K C O M",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.grey)),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          child: Row(
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: OutlinedButton(
                                    child: Icon(
                                      CupertinoIcons.list_bullet,
                                      color: Color(0xffBC1D58),
                                      size: 18,
                                    ),
                                    onPressed: () {
                                      debugPrint('List Tapped!');
                                    },
                                    style: OutlinedButton.styleFrom(
                                      padding: EdgeInsets.all(0),
                                      side: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                    )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: OutlinedButton(
                                    onPressed: () {
                                      debugPrint('Open Cart Page');
                                    },
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.all(0),
                                      side: const BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                    ),
                                    child: Icon(
                                      CupertinoIcons.square_grid_2x2,
                                      color: Color(0xffBC1D58),
                                      size: 18,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                Column(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        height: 600,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            color: Colors.transparent),
                        width: deviceWidth * 0.90,
                        child: products.isNotEmpty
                            ? GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemCount: products.length,
                                itemBuilder: (BuildContext context, int index) {
                                  // final availability =
                                  //     products[index]["availability"];
                                  // print('Product ${products[index]["name"]} availability: $availability');
                                  return Container(
                                    margin: const EdgeInsets.all(2),
                                    height: deviceHeight * 0.3,
                                    // width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xffD7D8C9)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: deviceWidth * 0.25,
                                          width: deviceWidth * 0.25,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: products[index].image != null
                                                ? _buildImage(
                                                    products[index].image!)
                                                : Image.asset(
                                                    'assets/headset.jpg',
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 5),
                                            Text(
                                              '${products[index].title}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              "${products[index].price}",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey.shade500),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              "${products[index].category}",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey.shade500),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  products[index].availability!
                                                      ? "In Stock"
                                                      : "Not Available",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Colors.grey.shade500),
                                                ),
                                                productsController
                                                        .productQuantities
                                                        .isEmpty
                                                    ? Container(
                                                        width: 100,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: Colors.green,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                                flex: 1,
                                                                child:
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          productsController.productQuantities.values.isNotEmpty
                                                                              ? productsController.addedToCart.removeAt(index)
                                                                              : debugPrint('add products to remove');
                                                                        },
                                                                        icon: Icon(
                                                                            Icons.remove))),
                                                            Expanded(
                                                                flex: 1,
                                                                child: Text(
                                                                    '${productsController.productQuantities.values.isNotEmpty ? productsController.productQuantities[productsController.addedToCart[index].product_id.toString()] : 0}')),
                                                            Expanded(
                                                                flex: 1,
                                                                child:
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          productsController
                                                                              .addToCart(products[index]);
                                                                        },
                                                                        icon: Icon(
                                                                            Icons.add)))
                                                          ],
                                                        ),
                                                      )
                                                    : SizedBox(
                                                        height: 30,
                                                        width: 30,
                                                        child: OutlinedButton(
                                                          onPressed: () {
                                                            debugPrint(
                                                                'add to cart');
                                                            productsController
                                                                .addToCart(
                                                                    products[
                                                                        index]);
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .add_shopping_cart_rounded,
                                                            color: Colors.white,
                                                            size: 20,
                                                          ),
                                                          style: OutlinedButton.styleFrom(
                                                              backgroundColor:
                                                                  Colors.yellow,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(0),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4))),
                                                        ),
                                                      ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                })
                            : const Center(
                                child: Text('No Product Found'),
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () {
              debugPrint('route to add product page');
            },
            backgroundColor: Color(0xff0065fe),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      );
    });
  }

  Widget _buildImage(String image) {
    try {
      return Image.asset(
        'images/$image',
        // width: MediaQuery.of(context).size.width * 0.85,
        // height: MediaQuery.of(context).size.width * 0.85,
        fit: BoxFit.cover,
      );
    } catch (e) {
      print('Exception: Invalid Image Data: $e');
      return Image.asset(
        'assets/headset.jpg',
        // width: MediaQuery.of(context).size.width * 0.85,
        // height: MediaQuery.of(context).size.width * 0.85,
        fit: BoxFit.cover,
      );
    }
  }
}
