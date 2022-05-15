class Slide {
  late String _ocslideshowImageId;
  late String _ocslideshowId;
  late String _link;
  late String _type;
  late String _bannerStore;
  late String _image;
  late String _smallImage;

  String get ocslideshowImageId => _ocslideshowImageId;
  set ocslideshowImageId(String ocslideshowImageId) =>
      _ocslideshowImageId = ocslideshowImageId;
  String get ocslideshowId => _ocslideshowId;
  set ocslideshowId(String ocslideshowId) => _ocslideshowId = ocslideshowId;
  String get link => _link;
  set link(String link) => _link = link;
  String get type => _type;
  set type(String type) => _type = type;
  String get bannerStore => _bannerStore;
  set bannerStore(String bannerStore) => _bannerStore = bannerStore;
  String get image => _image;
  set image(String image) => _image = image;
  String get smallImage => _smallImage;
  set smallImage(String smallImage) => _smallImage = smallImage;

  Slide.fromJson(Map<String, dynamic> json) {
    _ocslideshowImageId = json['ocslideshow_image_id'].toString();
    _ocslideshowId = json['ocslideshow_id'].toString();
    _link = json['link'].toString();
    _type = json['type'].toString();
    _bannerStore = json['banner_store'].toString();
    _image = json['image'].toString();
    _smallImage = json['small_image'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ocslideshow_image_id'] = this._ocslideshowImageId;
    data['ocslideshow_id'] = this._ocslideshowId;
    data['link'] = this._link;
    data['type'] = this._type;
    data['banner_store'] = this._bannerStore;
    data['image'] = this._image;
    data['small_image'] = this._smallImage;
    return data;
  }
}
