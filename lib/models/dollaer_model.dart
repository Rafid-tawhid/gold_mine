class DollaerModel {
  DollaerModel({
      bool? status, 
      List<Country>? country,}){
    _status = status;
    _country = country;
}

  DollaerModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['country'] != null) {
      _country = [];
      json['country'].forEach((v) {
        _country?.add(Country.fromJson(v));
      });
    }
  }
  bool? _status;
  List<Country>? _country;
DollaerModel copyWith({  bool? status,
  List<Country>? country,
}) => DollaerModel(  status: status ?? _status,
  country: country ?? _country,
);
  bool? get status => _status;
  List<Country>? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_country != null) {
      map['country'] = _country?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Country {
  Country({
      num? id, 
      dynamic name, 
      String? phone, 
      String? code, 
      String? countryimg, 
      String? country, 
      String? currency, 
      String? capital, 
      String? currencyCode, 
      String? continent, 
      String? continentCode, 
      String? alpha3, 
      String? buyrate, 
      String? sellrate, 
      num? rate, 
      String? dollarRate, 
      bool? active,}){
    _id = id;
    _name = name;
    _phone = phone;
    _code = code;
    _countryimg = countryimg;
    _country = country;
    _currency = currency;
    _capital = capital;
    _currencyCode = currencyCode;
    _continent = continent;
    _continentCode = continentCode;
    _alpha3 = alpha3;
    _buyrate = buyrate;
    _sellrate = sellrate;
    _rate = rate;
    _dollarRate = dollarRate;
    _active = active;
}

  Country.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _code = json['code'];
    _countryimg = json['countryimg'];
    _country = json['country'];
    _currency = json['currency'];
    _capital = json['capital'];
    _currencyCode = json['currency_code'];
    _continent = json['continent'];
    _continentCode = json['continent_code'];
    _alpha3 = json['alpha_3'];
    _buyrate = json['buyrate'];
    _sellrate = json['sellrate'];
    _rate = json['rate'];
    _dollarRate = json['dollar_rate'];
    _active = json['active'];
  }
  num? _id;
  dynamic _name;
  String? _phone;
  String? _code;
  String? _countryimg;
  String? _country;
  String? _currency;
  String? _capital;
  String? _currencyCode;
  String? _continent;
  String? _continentCode;
  String? _alpha3;
  String? _buyrate;
  String? _sellrate;
  num? _rate;
  String? _dollarRate;
  bool? _active;
Country copyWith({  num? id,
  dynamic name,
  String? phone,
  String? code,
  String? countryimg,
  String? country,
  String? currency,
  String? capital,
  String? currencyCode,
  String? continent,
  String? continentCode,
  String? alpha3,
  String? buyrate,
  String? sellrate,
  num? rate,
  String? dollarRate,
  bool? active,
}) => Country(  id: id ?? _id,
  name: name ?? _name,
  phone: phone ?? _phone,
  code: code ?? _code,
  countryimg: countryimg ?? _countryimg,
  country: country ?? _country,
  currency: currency ?? _currency,
  capital: capital ?? _capital,
  currencyCode: currencyCode ?? _currencyCode,
  continent: continent ?? _continent,
  continentCode: continentCode ?? _continentCode,
  alpha3: alpha3 ?? _alpha3,
  buyrate: buyrate ?? _buyrate,
  sellrate: sellrate ?? _sellrate,
  rate: rate ?? _rate,
  dollarRate: dollarRate ?? _dollarRate,
  active: active ?? _active,
);
  num? get id => _id;
  dynamic get name => _name;
  String? get phone => _phone;
  String? get code => _code;
  String? get countryimg => _countryimg;
  String? get country => _country;
  String? get currency => _currency;
  String? get capital => _capital;
  String? get currencyCode => _currencyCode;
  String? get continent => _continent;
  String? get continentCode => _continentCode;
  String? get alpha3 => _alpha3;
  String? get buyrate => _buyrate;
  String? get sellrate => _sellrate;
  num? get rate => _rate;
  String? get dollarRate => _dollarRate;
  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['code'] = _code;
    map['countryimg'] = _countryimg;
    map['country'] = _country;
    map['currency'] = _currency;
    map['capital'] = _capital;
    map['currency_code'] = _currencyCode;
    map['continent'] = _continent;
    map['continent_code'] = _continentCode;
    map['alpha_3'] = _alpha3;
    map['buyrate'] = _buyrate;
    map['sellrate'] = _sellrate;
    map['rate'] = _rate;
    map['dollar_rate'] = _dollarRate;
    map['active'] = _active;
    return map;
  }

}