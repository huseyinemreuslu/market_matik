import 'product.dart';

class Wishlist {
  final product = Product();
  Wishlist.fromJson(Map<String, dynamic> json) {
    product.name = json['name'].toString();
    product.productId = json['product_id'].toString();
    product.image = json['image'].toString();
    product.model = json['model'].toString();
    product.viewed = json['viewed'].toString();
    product.quantity = json['quantity'].toString();
    product.isWished = true;
    product.price = json['price'].toString();
    product.specialPrice = json['special_price'].toString();
    product.discountPrice = json['discount_price'].toString();
    product.discountQuantity = json['discount_quantity'].toString();
  }
}
