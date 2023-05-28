class SectionModel {
  SectionModel({
      bool? status, 
      List<Sections>? sections, 
      num? total, 
      num? perPage, 
      num? currentPage, 
      num? lastPage,}){
    _status = status;
    _sections = sections;
    _total = total;
    _perPage = perPage;
    _currentPage = currentPage;
    _lastPage = lastPage;
}

  SectionModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['sections'] != null) {
      _sections = [];
      json['sections'].forEach((v) {
        _sections?.add(Sections.fromJson(v));
      });
    }
    _total = json['total'];
    _perPage = json['perPage'];
    _currentPage = json['currentPage'];
    _lastPage = json['lastPage'];
  }
  bool? _status;
  List<Sections>? _sections;
  num? _total;
  num? _perPage;
  num? _currentPage;
  num? _lastPage;
SectionModel copyWith({  bool? status,
  List<Sections>? sections,
  num? total,
  num? perPage,
  num? currentPage,
  num? lastPage,
}) => SectionModel(  status: status ?? _status,
  sections: sections ?? _sections,
  total: total ?? _total,
  perPage: perPage ?? _perPage,
  currentPage: currentPage ?? _currentPage,
  lastPage: lastPage ?? _lastPage,
);
  bool? get status => _status;
  List<Sections>? get sections => _sections;
  num? get total => _total;
  num? get perPage => _perPage;
  num? get currentPage => _currentPage;
  num? get lastPage => _lastPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_sections != null) {
      map['sections'] = _sections?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    map['perPage'] = _perPage;
    map['currentPage'] = _currentPage;
    map['lastPage'] = _lastPage;
    return map;
  }

}

class Sections {
  Sections({
      num? id, 
      String? name, 
      String? slug, 
      String? description, 
      dynamic image, 
      bool? status, 
      String? createdBy,}){
    _id = id;
    _name = name;
    _slug = slug;
    _description = description;
    _image = image;
    _status = status;
    _createdBy = createdBy;
}

  Sections.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _description = json['description'];
    _image = json['image'];
    _status = json['status'];
    _createdBy = json['created_by'];
  }
  num? _id;
  String? _name;
  String? _slug;
  String? _description;
  dynamic _image;
  bool? _status;
  String? _createdBy;
Sections copyWith({  num? id,
  String? name,
  String? slug,
  String? description,
  dynamic image,
  bool? status,
  String? createdBy,
}) => Sections(  id: id ?? _id,
  name: name ?? _name,
  slug: slug ?? _slug,
  description: description ?? _description,
  image: image ?? _image,
  status: status ?? _status,
  createdBy: createdBy ?? _createdBy,
);
  num? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  String? get description => _description;
  dynamic get image => _image;
  bool? get status => _status;
  String? get createdBy => _createdBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['description'] = _description;
    map['image'] = _image;
    map['status'] = _status;
    map['created_by'] = _createdBy;
    return map;
  }

}