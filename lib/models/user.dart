class User {
  String customerId = "";
  String customerGroupId= "";
  String storeId= "";
  String languageId= "";
  String firstname= "";
  String lastname= "";
  String email= "";
  String emailOld= "";
  String telephone= "";
  String fax= "";
  String password= "";
  String salt= "";
  String cart= "";
  String wishlist= "";
  String newsletter= "";
  String addressId= "";
  String customField= "";
  String ip= "";
  String status= "";
  String safe= "";
  String token= "";
  String code= "";
  String dateAdded= "";

  User();

  User.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'].toString();
    customerGroupId = json['customer_group_id'].toString();
    storeId = json['store_id'].toString();
    languageId = json['language_id'].toString();
    firstname = json['firstname'].toString();
    lastname = json['lastname'].toString();
    email = json['email'].toString();
    emailOld = json['email_old'].toString();
    telephone = json['telephone'].toString();
    fax = json['fax'].toString();
    password = json['password'].toString();
    salt = json['salt'].toString();
    cart = json['cart'].toString();
    wishlist = json['wishlist'].toString();
    newsletter = json['newsletter'].toString();
    addressId = json['address_id'].toString();
    customField = json['custom_field'].toString();
    ip = json['ip'].toString();
    status = json['status'].toString();
    safe = json['safe'].toString();
    token = json['token'].toString();
    code = json['code'].toString();
    dateAdded = json['date_added'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customerId;
    data['customer_group_id'] = customerGroupId;
    data['store_id'] = storeId;
    data['language_id'] = languageId;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['email_old'] = emailOld;
    data['telephone'] = telephone;
    data['fax'] = fax;
    data['password'] = password;
    data['salt'] = salt;
    data['cart'] = cart;
    data['wishlist'] = wishlist;
    data['newsletter'] = newsletter;
    data['address_id'] = addressId;
    data['custom_field'] = customField;
    data['ip'] = ip;
    data['status'] = status;
    data['safe'] = safe;
    data['token'] = token;
    data['code'] = code;
    data['date_added'] = dateAdded;
    return data;
  }
}
