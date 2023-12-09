class SipBannerModel {
  List<String>? _images;
  String? _title;
  String? _header;
  String? _description;
  String? _actionTitle;

  SipBannerModel(
      {List<String>? images,
      String? title,
      String? header,
      String? description,
      String? actionTitle}) {
    if (images != null) {
      _images = images;
    }
    if (title != null) {
      _title = title;
    }
    if (header != null) {
      _header = header;
    }
    if (description != null) {
      _description = description;
    }
    if (actionTitle != null) {
      _actionTitle = actionTitle;
    }
  }

  List<String>? get images => _images;
  set images(List<String>? images) => _images = images;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get header => _header;
  set header(String? header) => _header = header;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get actionTitle => _actionTitle;
  set actionTitle(String? actionTitle) => _actionTitle = actionTitle;

  SipBannerModel.fromJson(Map<String, dynamic> json) {
    _images = json['images'].cast<String>();
    _title = json['title'];
    _header = json['header'];
    _description = json['description'];
    _actionTitle = json['action_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['images'] = _images;
    data['title'] = _title;
    data['header'] = _header;
    data['description'] = _description;
    data['action_title'] = _actionTitle;
    return data;
  }
}
