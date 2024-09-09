import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hkcom/controller/productcontroller.dart';
import 'package:hkcom/routing/app_route_constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  /// ---------------------------------
  final productsController = Get.find<ProductsController>();
  final GetStorage storage = GetStorage();

  Map<String, int> quantityMap = {};

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Obx(() {
      // productsController.countProductQuantities(
      //     productsController.addedToCart);
      return Scaffold(
        backgroundColor: const Color(0xff131C25),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.goNamed(MyAppRouteConstants.homeRouteName);
              },
              icon: const Icon(
                Icons.chevron_left,
                color: Color(0xffBC1D58),
              )),
          backgroundColor: const Color(0xff223243),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: deviceWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      const Expanded(
                        flex: 4,
                        child: Text("H K C O M Cart",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Color(0xffD7D8C9))),
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
                                    onPressed: () {
                                      debugPrint('List Tapped!');
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
                                    child: const Icon(
                                      CupertinoIcons.list_bullet,
                                      color: Color(0xffBC1D58),
                                      size: 18,
                                    )),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.all(0),
                                      side: const BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                    ),
                                    child: const Icon(
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
                        child: productsController.addedToCart.isNotEmpty
                            ? GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3),
                                itemCount:
                                    productsController.addedToCart.length,
                                itemBuilder: (BuildContext context, int index) {
                                  debugPrint(
                                      'length ->> ${productsController.addedToCart[index].title} ${productsController.addedToCart.where((e) => e.product_id == productsController.addedToCart[index].product_id).length}');
                                  debugPrint(
                                      "printtttttt : ${productsController.addedToCart[index].product_id}");
                                  return Container(
                                    margin: const EdgeInsets.all(2),
                                    height: deviceHeight * 0.3,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xffD7D8C9)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: deviceWidth * 0.15,
                                              width: deviceWidth * 0.15,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: productsController
                                                            .addedToCart[index]
                                                            .image !=
                                                        null
                                                    ? _buildImage(
                                                        productsController
                                                            .addedToCart[index]
                                                            .image!)
                                                    : Image.asset(
                                                        'assets/headset.jpg',
                                                        fit: BoxFit.fitHeight,
                                                      ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: deviceWidth * 0.20,
                                                  top: 4),
                                              child: SizedBox(
                                                height: 30,
                                                width: 30,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      productsController
                                                          .addedToCart
                                                          .removeAt(index);
                                                    });
                                                    // saveIntoSp();
                                                  },
                                                  style: ButtonStyle(
                                                    padding:
                                                        WidgetStateProperty.all(
                                                            EdgeInsets.zero),
                                                    backgroundColor:
                                                        WidgetStateProperty.all<
                                                                Color>(
                                                            Color(0xffD7D8C9)),
                                                    shape: WidgetStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9.0),
                                                      ),
                                                    ),
                                                  ),
                                                  child: const Icon(
                                                    Icons
                                                        .delete_outline_rounded,
                                                    color: Color(0xffBC1D58),
                                                    size: 18,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 5),
                                            Text(
                                              '${productsController.addedToCart[index].title}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff223243)),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              "${productsController.addedToCart[index].price}",
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff223243)),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              "${productsController.addedToCart[index].category}",
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff223243)),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              // productsController
                                              //         .addedToCart[index]
                                              //         .availability! ?
                                              "quantity : ${productsController.addedToCart[index].quantities}",
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff223243)),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                })
                            : const Center(
                                child: Text(
                                  'No Product Found',
                                  style: TextStyle(color: Color(0xffD7D8C9)),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ],
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
