class MaterialsModel {
  MaterialsModel({
      bool? status, 
      List<MaterialPrice>? materialPrice,}){
    _status = status;
    _materialPrice = materialPrice;
}

  MaterialsModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['materialPrice'] != null) {
      _materialPrice = [];
      json['materialPrice'].forEach((v) {
        _materialPrice?.add(MaterialPrice.fromJson(v));
      });
    }
  }
  bool? _status;
  List<MaterialPrice>? _materialPrice;
MaterialsModel copyWith({  bool? status,
  List<MaterialPrice>? materialPrice,
}) => MaterialsModel(  status: status ?? _status,
  materialPrice: materialPrice ?? _materialPrice,
);
  bool? get status => _status;
  List<MaterialPrice>? get materialPrice => _materialPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_materialPrice != null) {
      map['materialPrice'] = _materialPrice?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class MaterialPrice {
  MaterialPrice({
      num? id, 
      String? sectionsId, 
      String? sectionName, 
      String? subSectionsId, 
      String? subSectionName, 
      String? weightTypesId, 
      String? weightTypeName, 
      String? price, 
      String? quantity, 
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
  String? _sectionsId;
  String? _sectionName;
  String? _subSectionsId;
  String? _subSectionName;
  String? _weightTypesId;
  String? _weightTypeName;
  String? _price;
  String? _quantity;
  String? _quantityType;
  dynamic _lastUpdatedDate;
  bool? _status;
  String? _createdBy;
MaterialPrice copyWith({  num? id,
  String? sectionsId,
  String? sectionName,
  String? subSectionsId,
  String? subSectionName,
  String? weightTypesId,
  String? weightTypeName,
  String? price,
  String? quantity,
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
  String? get sectionsId => _sectionsId;
  String? get sectionName => _sectionName;
  String? get subSectionsId => _subSectionsId;
  String? get subSectionName => _subSectionName;
  String? get weightTypesId => _weightTypesId;
  String? get weightTypeName => _weightTypeName;
  String? get price => _price;
  String? get quantity => _quantity;
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