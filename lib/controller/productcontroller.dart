import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkcom/model/productmodel.dart';

class ProductsController extends GetxController {
  // List products = <ProductModel>[].obs;
  final addedToCart = <ProductModel>[].obs;
  var cartz = 0.obs;

  final List<ProductModel> productss = [
    ProductModel(
      title: "Avacado",
      price: "\$599",
      shipping_type: "Free Shipping",
      availability: true,
      category: "Fruits",
      product_id: 01,
      image: "avacado.jpg",
      quantities: 0,
    ),
    ProductModel(
      title: "Wall Painting",
      price: "\$899",
      shipping_type: "Express Shipping",
      availability: true,
      category: "Art",
      product_id: 02,
      image: "city.jpg",
      quantities: 0,
    ),
    ProductModel(
      title: "Drone",
      price: "\$199",
      shipping_type: "Standard Shipping",
      availability: true,
      category: "Electronics",
      product_id: 03,
      image: "drone.jpg",
      quantities: 0,
    ),
    ProductModel(
      title: "Luggage",
      price: "\$129",
      shipping_type: "Free Shipping",
      availability: false,
      category: "Travel Accessories",
      product_id: 04,
      image: "luggage.jpg",
      quantities: 0,
    ),
    ProductModel(
      title: "Mandala Art 01",
      price: "\$299",
      shipping_type: "Standard Shipping",
      availability: true,
      category: "Art",
      product_id: 05,
      image: "mandala.jpg",
      quantities: 0,
    ),
    ProductModel(
      title: "Mandala Art 02",
      price: "\$499",
      shipping_type: "Express Shipping",
      availability: true,
      category: "Art",
      product_id: 06,
      image: "mandala01.jpg",
      quantities: 0,
    ),
    ProductModel(
      title: "Oversized Tshirt",
      price: "\$1200",
      shipping_type: "Free Shipping",
      availability: false,
      category: "Clothes",
      product_id: 07,
      image: "oversized.jpg",
      quantities: 0,
    ),
    ProductModel(
      title: "Handmade Painting",
      price: "\$1200",
      shipping_type: "Free Shipping",
      availability: true,
      category: "Art",
      product_id: 08,
      image: "portrait.jpg",
      quantities: 0,
    ),
  ].obs;

  void addToCart(ProductModel productModel) {
    debugPrint("incoming pId : ${productModel.product_id}");

    if(addedToCart.any((e)=>e.product_id==productModel.product_id)){
      int alreadyInCartProductIndex = addedToCart.indexOf(addedToCart.firstWhere((e)=> e.product_id == productModel.product_id));
      ProductModel alreadyInCartProduct = addedToCart[alreadyInCartProductIndex];
      debugPrint("Found pId : ${productModel.product_id} with Quantity : ${alreadyInCartProduct.quantities}  and is on index : ${alreadyInCartProductIndex}");
      addedToCart[alreadyInCartProductIndex].quantities = addedToCart[alreadyInCartProductIndex].quantities! + 1;
      // addedToCart[addedToCart.indexOf(productModel.product_id)].quantities=addedToCart[addedToCart.indexOf(productModel.product_id)].quantities??0 +1;
    }else{
      addedToCart.add(productModel);
      debugPrint("Added pId  :${productModel.product_id}");
    }
    update();
  }
}