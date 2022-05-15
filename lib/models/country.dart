class Country {
  late String _countryId;
  late String _name;
  late String _isoCode2;
  late String _isoCode3;
  late String _addressFormat;
  late String _postcodeRequired;
  late String _status;

  String get countryId => _countryId;
  set countryId(String countryId) => _countryId = countryId;
  String get name => _name;
  set name(String name) => _name = name;
  String get isoCode2 => _isoCode2;
  set isoCode2(String isoCode2) => _isoCode2 = isoCode2;
  String get isoCode3 => _isoCode3;
  set isoCode3(String isoCode3) => _isoCode3 = isoCode3;
  String get addressFormat => _addressFormat;
  set addressFormat(String addressFormat) => _addressFormat = addressFormat;
  String get postcodeRequired => _postcodeRequired;
  set postcodeRequired(String postcodeRequired) =>
      _postcodeRequired = postcodeRequired;
  String get status => _status;
  set status(String status) => _status = status;

  Country.fromJson(Map<String, dynamic> json) {
    _countryId = json['country_id'].toString();
    _name = json['name'].toString();
    _isoCode2 = json['iso_code_2'].toString();
    _isoCode3 = json['iso_code_3'].toString();
    _addressFormat = json['address_format'].toString();
    _postcodeRequired = json['postcode_required'].toString();
    _status = json['status'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_id'] = this._countryId;
    data['name'] = this._name;
    data['iso_code_2'] = this._isoCode2;
    data['iso_code_3'] = this._isoCode3;
    data['address_format'] = this._addressFormat;
    data['postcode_required'] = this._postcodeRequired;
    data['status'] = this._status;
    return data;
  }
}
