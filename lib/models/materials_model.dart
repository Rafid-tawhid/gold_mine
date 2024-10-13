class MaterialsModel {
  MaterialsModel({
      this.id, 
      this.sectionsId, 
      this.sectionName, 
      this.subSectionsId, 
      this.subSectionName, 
      this.weightTypesId, 
      this.weightTypeName, 
      this.price, 
      this.quantity, 
      this.quantityType, 
      this.lastUpdatedDate, 
      this.status, 
      this.createdBy,});

  MaterialsModel.fromJson(dynamic json) {
    id = json['id'];
    sectionsId = json['sections_id'];
    sectionName = json['section_name'];
    subSectionsId = json['sub_sections_id'];
    subSectionName = json['sub_section_name'];
    weightTypesId = json['weight_types_id'];
    weightTypeName = json['weight_type_name'];
    price = json['price'];
    quantity = json['quantity'];
    quantityType = json['quantity_type'];
    lastUpdatedDate = json['last_updated_date'];
    status = json['status'];
    createdBy = json['created_by'];
  }
  num? id;
  num? sectionsId;
  String? sectionName;
  num? subSectionsId;
  String? subSectionName;
  num? weightTypesId;
  String? weightTypeName;
  num? price;
  num? quantity;
  String? quantityType;
  dynamic lastUpdatedDate;
  bool? status;
  String? createdBy;
MaterialsModel copyWith({  num? id,
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
}) => MaterialsModel(  id: id ?? this.id,
  sectionsId: sectionsId ?? this.sectionsId,
  sectionName: sectionName ?? this.sectionName,
  subSectionsId: subSectionsId ?? this.subSectionsId,
  subSectionName: subSectionName ?? this.subSectionName,
  weightTypesId: weightTypesId ?? this.weightTypesId,
  weightTypeName: weightTypeName ?? this.weightTypeName,
  price: price ?? this.price,
  quantity: quantity ?? this.quantity,
  quantityType: quantityType ?? this.quantityType,
  lastUpdatedDate: lastUpdatedDate ?? this.lastUpdatedDate,
  status: status ?? this.status,
  createdBy: createdBy ?? this.createdBy,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sections_id'] = sectionsId;
    map['section_name'] = sectionName;
    map['sub_sections_id'] = subSectionsId;
    map['sub_section_name'] = subSectionName;
    map['weight_types_id'] = weightTypesId;
    map['weight_type_name'] = weightTypeName;
    map['price'] = price;
    map['quantity'] = quantity;
    map['quantity_type'] = quantityType;
    map['last_updated_date'] = lastUpdatedDate;
    map['status'] = status;
    map['created_by'] = createdBy;
    return map;
  }

}