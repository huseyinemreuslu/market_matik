class Option{
  late String productOptionValueId;
  late String productId;
  late String optionValueId;
  late String name;
  late String image;
  late String quantity;
  late String subtract;
  late String price;
  late String pricePrefix;
  late String weight;
  late String weightPrefix;

  Option.fromJson(Map<String, dynamic> json) {
    productOptionValueId = json['product_option_value_id'].toString();
    optionValueId = json['option_value_id'].toString();
    name = json['name'].toString();
    image = json['image'].toString();
    quantity = json['quantity'].toString();
    subtract = json['subtract'].toString();
    price = json['price'].toString();
    pricePrefix = json['price_prefix'].toString();
    weight = json['weight'].toString();
    weightPrefix = json['weight_prefix'].toString();
    productId = json['product_id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_option_value_id'] = productOptionValueId;
    data['option_value_id'] = optionValueId;
    data['name'] = name;
    data['image'] = image;
    data['quantity'] = quantity;
    data['subtract'] = subtract;
    data['price'] = price;
    data['product_id'] = productId;
    data['price_prefix'] = pricePrefix;
    data['weight'] = weight;
    data['weight_prefix'] = weightPrefix;
    return data;
  }
}
