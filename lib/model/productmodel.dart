
class ProductModel {
  String? title;
  String? price;
  String? shipping_type;
  bool? availability;
  String? category;
  int? product_id;
  String? image;

  ProductModel({
    required this.title,
    required this.price,
    required this.shipping_type,
    required this.availability,
    required this.category,
    required this.product_id,
    this.image,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    shipping_type = json['shipping_type'];
    availability = json['availability'];
    category = json['category'];
    product_id = json['product_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['price'] = this.price;
    data['shipping_type'] = this.shipping_type;
    data['availability'] = this.availability as bool;
    data['category'] = this.category;
    data['product_id'] = this.product_id as int;
    data['image'] = this.image as int;
    return data;
  }
}