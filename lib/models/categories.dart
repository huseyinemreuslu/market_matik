class Categories {
  late String _categoryId;
  late String _languageId;
  late String _name;
  late String _description;
  late String _metaTitle;
  late String _metaDescription;
  late String _metaKeyword;
  late String _seoKeyword;
  late String _seoH1;
  late String _seoH2;
  late String _seoH3;
  late String _image;
  late String _parentId;
  late String _top;
  late String _column;
  late String _sortOrder;
  late String _status;
  late String _dateAdded;
  late String _dateModified;
  late String _thumbnailImage;
  late String _homethumbImage;
  late String _featured;

  String get categoryId => _categoryId;
  set categoryId(String categoryId) => _categoryId = categoryId;
  String get languageId => _languageId;
  set languageId(String languageId) => _languageId = languageId;
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
  String get seoKeyword => _seoKeyword;
  set seoKeyword(String seoKeyword) => _seoKeyword = seoKeyword;
  String get seoH1 => _seoH1;
  set seoH1(String seoH1) => _seoH1 = seoH1;
  String get seoH2 => _seoH2;
  set seoH2(String seoH2) => _seoH2 = seoH2;
  String get seoH3 => _seoH3;
  set seoH3(String seoH3) => _seoH3 = seoH3;
  String get image => _image;
  set image(String image) => _image = image;
  String get parentId => _parentId;
  set parentId(String parentId) => _parentId = parentId;
  String get top => _top;
  set top(String top) => _top = top;
  String get column => _column;
  set column(String column) => _column = column;
  String get sortOrder => _sortOrder;
  set sortOrder(String sortOrder) => _sortOrder = sortOrder;
  String get status => _status;
  set status(String status) => _status = status;
  String get dateAdded => _dateAdded;
  set dateAdded(String dateAdded) => _dateAdded = dateAdded;
  String get dateModified => _dateModified;
  set dateModified(String dateModified) => _dateModified = dateModified;
  String get thumbnailImage => _thumbnailImage;
  set thumbnailImage(String thumbnailImage) => _thumbnailImage = thumbnailImage;
  String get homethumbImage => _homethumbImage;
  set homethumbImage(String homethumbImage) => _homethumbImage = homethumbImage;
  String get featured => _featured;
  set featured(String featured) => _featured = featured;

  Categories.fromJson(Map<String, dynamic> json) {
    _categoryId = json['category_id'].toString();
    _languageId = json['language_id'].toString();
    _name = json['name'].toString();
    _description = json['description'].toString();
    _metaTitle = json['meta_title'].toString();
    _metaDescription = json['meta_description'].toString();
    _metaKeyword = json['meta_keyword'].toString();
    _seoKeyword = json['seo_keyword'].toString();
    _seoH1 = json['seo_h1'].toString();
    _seoH2 = json['seo_h2'].toString();
    _seoH3 = json['seo_h3'].toString();
    _image = json['image'].toString();
    _parentId = json['parent_id'].toString();
    _top = json['top'].toString();
    _column = json['column'].toString();
    _sortOrder = json['sort_order'].toString();
    _status = json['status'].toString();
    _dateAdded = json['date_added'].toString();
    _dateModified = json['date_modified'].toString();
    _thumbnailImage = json['thumbnail_image'].toString();
    _homethumbImage =
    json['homethumb_image'] == null ? "" : json['homethumb_image'];
    _featured = json['featured'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this._categoryId;
    data['language_id'] = this._languageId;
    data['name'] = this._name;
    data['description'] = this._description;
    data['meta_title'] = this._metaTitle;
    data['meta_description'] = this._metaDescription;
    data['meta_keyword'] = this._metaKeyword;
    data['seo_keyword'] = this._seoKeyword;
    data['seo_h1'] = this._seoH1;
    data['seo_h2'] = this._seoH2;
    data['seo_h3'] = this._seoH3;
    data['image'] = this._image;
    data['parent_id'] = this._parentId;
    data['top'] = this._top;
    data['column'] = this._column;
    data['sort_order'] = this._sortOrder;
    data['status'] = this._status;
    data['date_added'] = this._dateAdded;
    data['date_modified'] = this._dateModified;
    data['thumbnail_image'] = this._thumbnailImage;
    data['homethumb_image'] = this._homethumbImage;
    data['featured'] = this._featured;
    return data;
  }
}
