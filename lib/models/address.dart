class Address{
  late String _addressId;
  late String _customerId;
  late String _firstname;
  late String _lastname;
  late String _company;
  late String _address1;
  late String _address2;
  late String _city;
  late String _postcode;
  late String _countryId;
  late String _zoneId;
  late String _customField;

  String get addressId => _addressId;
  set addressId(String addressId) => _addressId = addressId;
  String get customerId => _customerId;
  set customerId(String customerId) => _customerId = customerId;
  String get firstname => _firstname;
  set firstname(String firstname) => _firstname = firstname;
  String get lastname => _lastname;
  set lastname(String lastname) => _lastname = lastname;
  String get company => _company;
  set company(String company) => _company = company;
  String get address1 => _address1;
  set address1(String address1) => _address1 = address1;
  String get address2 => _address2;
  set address2(String address2) => _address2 = address2;
  String get city => _city;
  set city(String city) => _city = city;
  String get postcode => _postcode;
  set postcode(String postcode) => _postcode = postcode;
  String get countryId => _countryId;
  set countryId(String countryId) => _countryId = countryId;
  String get zoneId => _zoneId;
  set zoneId(String zoneId) => _zoneId = zoneId;
  String get customField => _customField;
  set customField(String customField) => _customField = customField;

  Address.fromJson(Map<String, dynamic> json) {
    _addressId = json['address_id'].toString();
    _customerId = json['customer_id'].toString();
    _firstname = json['firstname'].toString();
    _lastname = json['lastname'].toString();
    _company = json['company'].toString();
    _address1 = json['address_1'].toString();
    _address2 = json['address_2'].toString();
    _city = json['city'].toString();
    _postcode = json['postcode'].toString();
    _countryId = json['country_id'].toString();
    _zoneId = json['zone_id'].toString();
    _customField = json['custom_field'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this._addressId;
    data['customer_id'] = this._customerId;
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    data['company'] = this._company;
    data['address_1'] = this._address1;
    data['address_2'] = this._address2;
    data['city'] = this._city;
    data['postcode'] = this._postcode;
    data['country_id'] = this._countryId;
    data['zone_id'] = this._zoneId;
    data['custom_field'] = this._customField;
    return data;
  }
}
