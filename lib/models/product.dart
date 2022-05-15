class Product {
  late String name;
  late String productId;
  late String image;
  late String model;
  late String viewed;
  late String quantity;
  late bool isWished;
  late String price;
  late String specialPrice;
  late String discountPrice;
  late String discountQuantity;
  int stolenQuantity = 0;
  Product();
  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString();
    productId = json['product_id'].toString();
    image = json['image'].toString();
    model = json['model'].toString();
    viewed = json['viewed'].toString();
    quantity = json['quantity'].toString();
    isWished = false;
    price = json['price'].toString();
    specialPrice = json['special_price'].toString();
    discountPrice = json['discount_price'].toString();
    discountQuantity = json['discount_quantity'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['product_id'] = productId;
    data['image'] = image;
    data['model'] = model;
    data['viewed'] = viewed;
    data['quantity'] = quantity;
    data['price'] = price;
    data['special_price'] = specialPrice;
    data['discount_price'] = discountPrice;
    data['discount_quantity'] = discountQuantity;
    return data;
  }

}
