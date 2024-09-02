import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkcom/model/productmodel.dart';

class ProductsController extends GetxController {
  List products = <ProductModel>[].obs;
  final addedToCart = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void addToCart(ProductModel productModel) {
    addedToCart.add(productModel);
  }

  Map<String, int?> productQuantities = <String,int?>{}.obs;
  void countProductQuantities(List<ProductModel> products) {

    for (var product in addedToCart) {
      if (productQuantities.containsKey(product.product_id.toString())) {
        productQuantities[product.product_id.toString()] = productQuantities[product.product_id.toString()]! + 1;
      } else {
        productQuantities[product.product_id.toString()] = 1;
      }
    }
    if(productQuantities.isEmpty){
      debugPrint('no products in the cart!!');
    }else{
      debugPrint('cart items :');
      productQuantities.forEach((id, quantity) {
        debugPrint('Product ID: $id, Quantity: $quantity');
      });
    }
  }

}
