class City {
  late String _zoneId;
  late String _countryId;
  late String _name;
  late String _code;
  late String _status;

  String get zoneId => _zoneId;
  set zoneId(String zoneId) => _zoneId = zoneId;
  String get countryId => _countryId;
  set countryId(String countryId) => _countryId = countryId;
  String get name => _name;
  set name(String name) => _name = name;
  String get code => _code;
  set code(String code) => _code = code;
  String get status => _status;
  set status(String status) => _status = status;

  City.fromJson(Map<String, dynamic> json) {
    _zoneId = json['zone_id'].toString();
    _countryId = json['country_id'].toString();
    _name = json['name'].toString();
    _code = json['code'].toString();
    _status = json['status'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zone_id'] = this._zoneId;
    data['country_id'] = this._countryId;
    data['name'] = this._name;
    data['code'] = this._code;
    data['status'] = this._status;
    return data;
  }
}
