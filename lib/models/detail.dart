class Detail {
  late String _productId;
  late String _name;
  late String _description;
  late String _metaTitle;
  late String _metaDescription;
  late String _metaKeyword;
  late String _tag;
  late String _model;
  late String _sku;
  late String _upc;
  late String _ean;
  late String _jan;
  late String _isbn;
  late String _mpn;
  late String _location;
  late String _quantity;
  late String _stockStatus;
  late String _image;
  late String _manufacturerId;
  late String _manufacturer;
  late String _price;
  late String _special;
  late String _reward;
  late String _points;
  late String _taxClassId;
  late String _dateAvailable;
  late String _weight;
  late String _weightClassId;
  late String _length;
  late String _width;
  late String _height;
  late String _lengthClassId;
  late String _subtract;
  late String _rating;
  late String _reviews;
  late String _minimum;
  late String _sortOrder;
  late String _status;
  late String _dateAdded;
  late String _dateModified;
  late String _viewed;

  String get productId => _productId;
  set productId(String productId) => _productId = productId;
  String get name => _name;
  set name(String name) => _name = name;
  String get description => _description;
  set description(String description) => _description = description;
  String get metaTitle => _metaTitle;
  set metaTitle(String metaTitle) => _metaTitle = metaTitle;
  String get metaDescription => _metaDescription;
  set metaDescription(String metaDescription) =>
      _metaDescription = metaDescription;
  String get metaKeyword => _metaKeyword;
  set metaKeyword(String metaKeyword) => _metaKeyword = metaKeyword;
  String get tag => _tag;
  set tag(String tag) => _tag = tag;
  String get model => _model;
  set model(String model) => _model = model;
  String get sku => _sku;
  set sku(String sku) => _sku = sku;
  String get upc => _upc;
  set upc(String upc) => _upc = upc;
  String get ean => _ean;
  set ean(String ean) => _ean = ean;
  String get jan => _jan;
  set jan(String jan) => _jan = jan;
  String get isbn => _isbn;
  set isbn(String isbn) => _isbn = isbn;
  String get mpn => _mpn;
  set mpn(String mpn) => _mpn = mpn;
  String get location => _location;
  set location(String location) => _location = location;
  String get quantity => _quantity;
  set quantity(String quantity) => _quantity = quantity;
  String get stockStatus => _stockStatus;
  set stockStatus(String stockStatus) => _stockStatus = stockStatus;
  String get image => _image;
  set image(String image) => _image = image;
  String get manufacturerId => _manufacturerId;
  set manufacturerId(String manufacturerId) => _manufacturerId = manufacturerId;
  String get manufacturer => _manufacturer;
  set manufacturer(String manufacturer) => _manufacturer = manufacturer;
  String get price => _price;
  set price(String price) => _price = price;
  String get special => _special;
  set special(String special) => _special = special;
  String get reward => _reward;
  set reward(String reward) => _reward = reward;
  String get points => _points;
  set points(String points) => _points = points;
  String get taxClassId => _taxClassId;
  set taxClassId(String taxClassId) => _taxClassId = taxClassId;
  String get dateAvailable => _dateAvailable;
  set dateAvailable(String dateAvailable) => _dateAvailable = dateAvailable;
  String get weight => _weight;
  set weight(String weight) => _weight = weight;
  String get weightClassId => _weightClassId;
  set weightClassId(String weightClassId) => _weightClassId = weightClassId;
  String get length => _length;
  set length(String length) => _length = length;
  String get width => _width;
  set width(String width) => _width = width;
  String get height => _height;
  set height(String height) => _height = height;
  String get lengthClassId => _lengthClassId;
  set lengthClassId(String lengthClassId) => _lengthClassId = lengthClassId;
  String get subtract => _subtract;
  set subtract(String subtract) => _subtract = subtract;
  String get rating => _rating;
  set rating(String rating) => _rating = rating;
  String get reviews => _reviews;
  set reviews(String reviews) => _reviews = reviews;
  String get minimum => _minimum;
  set minimum(String minimum) => _minimum = minimum;
  String get sortOrder => _sortOrder;
  set sortOrder(String sortOrder) => _sortOrder = sortOrder;
  String get status => _status;
  set status(String status) => _status = status;
  String get dateAdded => _dateAdded;
  set dateAdded(String dateAdded) => _dateAdded = dateAdded;
  String get dateModified => _dateModified;
  set dateModified(String dateModified) => _dateModified = dateModified;
  String get viewed => _viewed;
  set viewed(String viewed) => _viewed = viewed;

  Detail.fromJson(Map<String, dynamic> json) {
    _productId = json['product_id'].toString();
    _name = json['name'].toString();
    _description = json['description'].toString();
    _metaTitle = json['meta_title'].toString();
    _metaDescription = json['meta_description'].toString();
    _metaKeyword = json['meta_keyword'].toString();
    _tag = json['tag'].toString();
    _model = json['model'].toString();
    _sku = json['sku'].toString();
    _upc = json['upc'].toString();
    _ean = json['ean'].toString();
    _jan = json['jan'].toString();
    _isbn = json['isbn'].toString();
    _mpn = json['mpn'].toString();
    _location = json['location'].toString();
    _quantity = json['quantity'].toString();
    _stockStatus = json['stock_status'].toString();
    _image = json['image'].toString();
    _manufacturerId = json['manufacturer_id'].toString();
    _manufacturer = json['manufacturer'].toString();
    _price = json['price'].toString();
    _special = json['special'].toString();
    _reward = json['reward'].toString();
    _points = json['points'].toString();
    _taxClassId = json['tax_class_id'].toString();
    _dateAvailable = json['date_available'].toString();
    _weight = json['weight'].toString();
    _weightClassId = json['weight_class_id'].toString();
    _length = json['length'].toString();
    _width = json['width'].toString();
    _height = json['height'].toString();
    _lengthClassId = json['length_class_id'].toString();
    _subtract = json['subtract'].toString();
    _rating = json['rating'].toString().toString();
    _reviews = json['reviews'].toString().toString();
    _minimum = json['minimum'].toString();
    _sortOrder = json['sort_order'].toString();
    _status = json['status'].toString();
    _dateAdded = json['date_added'].toString();
    _dateModified = json['date_modified'].toString();
    _viewed = json['viewed'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this._productId;
    data['name'] = this._name;
    data['description'] = this._description;
    data['meta_title'] = this._metaTitle;
    data['meta_description'] = this._metaDescription;
    data['meta_keyword'] = this._metaKeyword;
    data['tag'] = this._tag;
    data['model'] = this._model;
    data['sku'] = this._sku;
    data['upc'] = this._upc;
    data['ean'] = this._ean;
    data['jan'] = this._jan;
    data['isbn'] = this._isbn;
    data['mpn'] = this._mpn;
    data['location'] = this._location;
    data['quantity'] = this._quantity;
    data['stock_status'] = this._stockStatus;
    data['image'] = this._image;
    data['manufacturer_id'] = this._manufacturerId;
    data['manufacturer'] = this._manufacturer;
    data['price'] = this._price;
    data['special'] = this._special;
    data['reward'] = this._reward;
    data['points'] = this._points;
    data['tax_class_id'] = this._taxClassId;
    data['date_available'] = this._dateAvailable;
    data['weight'] = this._weight;
    data['weight_class_id'] = this._weightClassId;
    data['length'] = this._length;
    data['width'] = this._width;
    data['height'] = this._height;
    data['length_class_id'] = this._lengthClassId;
    data['subtract'] = this._subtract;
    data['rating'] = this._rating;
    data['reviews'] = this._reviews;
    data['minimum'] = this._minimum;
    data['sort_order'] = this._sortOrder;
    data['status'] = this._status;
    data['date_added'] = this._dateAdded;
    data['date_modified'] = this._dateModified;
    data['viewed'] = this._viewed;
    return data;
  }
}
