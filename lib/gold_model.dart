class GoldModel {
  GoldModel({
      bool? status, 
      List<MaterialPrice>? materialPrice, 
      num? total, 
      num? perPage, 
      num? currentPage, 
      num? lastPage,}){
    _status = status;
    _materialPrice = materialPrice;
    _total = total;
    _perPage = perPage;
    _currentPage = currentPage;
    _lastPage = lastPage;
}

  GoldModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['materialPrice'] != null) {
      _materialPrice = [];
      json['materialPrice'].forEach((v) {
        _materialPrice?.add(MaterialPrice.fromJson(v));
      });
    }
    _total = json['total'];
    _perPage = json['perPage'];
    _currentPage = json['currentPage'];
    _lastPage = json['lastPage'];
  }
  bool? _status;
  List<MaterialPrice>? _materialPrice;
  num? _total;
  num? _perPage;
  num? _currentPage;
  num? _lastPage;
GoldModel copyWith({  bool? status,
  List<MaterialPrice>? materialPrice,
  num? total,
  num? perPage,
  num? currentPage,
  num? lastPage,
}) => GoldModel(  status: status ?? _status,
  materialPrice: materialPrice ?? _materialPrice,
  total: total ?? _total,
  perPage: perPage ?? _perPage,
  currentPage: currentPage ?? _currentPage,
  lastPage: lastPage ?? _lastPage,
);
  bool? get status => _status;
  List<MaterialPrice>? get materialPrice => _materialPrice;
  num? get total => _total;
  num? get perPage => _perPage;
  num? get currentPage => _currentPage;
  num? get lastPage => _lastPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_materialPrice != null) {
      map['materialPrice'] = _materialPrice?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    map['perPage'] = _perPage;
    map['currentPage'] = _currentPage;
    map['lastPage'] = _lastPage;
    return map;
  }

}

class MaterialPrice {
  MaterialPrice({
      num? id, 
      num? sectionsId, 
      String? sectionName, 
      num? subSectionsId, 
      String? subSectionName, 
      num? weightTypesId, 
      String? weightTypeName, 
      num? price, 
      num? quantity, 
      String? quantityType, 
      dynamic lastUpdatedDate, 
      bool? status, 
      String? createdBy,}){
    _id = id;
    _sectionsId = sectionsId;
    _sectionName = sectionName;
    _subSectionsId = subSectionsId;
    _subSectionName = subSectionName;
    _weightTypesId = weightTypesId;
    _weightTypeName = weightTypeName;
    _price = price;
    _quantity = quantity;
    _quantityType = quantityType;
    _lastUpdatedDate = lastUpdatedDate;
    _status = status;
    _createdBy = createdBy;
}

  MaterialPrice.fromJson(dynamic json) {
    _id = json['id'];
    _sectionsId = json['sections_id'];
    _sectionName = json['section_name'];
    _subSectionsId = json['sub_sections_id'];
    _subSectionName = json['sub_section_name'];
    _weightTypesId = json['weight_types_id'];
    _weightTypeName = json['weight_type_name'];
    _price = json['price'];
    _quantity = json['quantity'];
    _quantityType = json['quantity_type'];
    _lastUpdatedDate = json['last_updated_date'];
    _status = json['status'];
    _createdBy = json['created_by'];
  }
  num? _id;
  num? _sectionsId;
  String? _sectionName;
  num? _subSectionsId;
  String? _subSectionName;
  num? _weightTypesId;
  String? _weightTypeName;
  num? _price;
  num? _quantity;
  String? _quantityType;
  dynamic _lastUpdatedDate;
  bool? _status;
  String? _createdBy;
MaterialPrice copyWith({  num? id,
  num? sectionsId,
  String? sectionName,
  num? subSectionsId,
  String? subSectionName,
  num? weightTypesId,
  String? weightTypeName,
  num? price,
  num? quantity,
  String? quantityType,
  dynamic lastUpdatedDate,
  bool? status,
  String? createdBy,
}) => MaterialPrice(  id: id ?? _id,
  sectionsId: sectionsId ?? _sectionsId,
  sectionName: sectionName ?? _sectionName,
  subSectionsId: subSectionsId ?? _subSectionsId,
  subSectionName: subSectionName ?? _subSectionName,
  weightTypesId: weightTypesId ?? _weightTypesId,
  weightTypeName: weightTypeName ?? _weightTypeName,
  price: price ?? _price,
  quantity: quantity ?? _quantity,
  quantityType: quantityType ?? _quantityType,
  lastUpdatedDate: lastUpdatedDate ?? _lastUpdatedDate,
  status: status ?? _status,
  createdBy: createdBy ?? _createdBy,
);
  num? get id => _id;
  num? get sectionsId => _sectionsId;
  String? get sectionName => _sectionName;
  num? get subSectionsId => _subSectionsId;
  String? get subSectionName => _subSectionName;
  num? get weightTypesId => _weightTypesId;
  String? get weightTypeName => _weightTypeName;
  num? get price => _price;
  num? get quantity => _quantity;
  String? get quantityType => _quantityType;
  dynamic get lastUpdatedDate => _lastUpdatedDate;
  bool? get status => _status;
  String? get createdBy => _createdBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sections_id'] = _sectionsId;
    map['section_name'] = _sectionName;
    map['sub_sections_id'] = _subSectionsId;
    map['sub_section_name'] = _subSectionName;
    map['weight_types_id'] = _weightTypesId;
    map['weight_type_name'] = _weightTypeName;
    map['price'] = _price;
    map['quantity'] = _quantity;
    map['quantity_type'] = _quantityType;
    map['last_updated_date'] = _lastUpdatedDate;
    map['status'] = _status;
    map['created_by'] = _createdBy;
    return map;
  }

}