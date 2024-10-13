class DollaerModel {
  DollaerModel({
      this.id, 
      this.name, 
      this.phone, 
      this.code, 
      this.countryimg, 
      this.country, 
      this.currency, 
      this.capital, 
      this.currencyCode, 
      this.continent, 
      this.continentCode, 
      this.alpha3, 
      this.buyrate, 
      this.sellrate, 
      this.rate, 
      this.dollarRate, 
      this.active,});

  DollaerModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    code = json['code'];
    countryimg = json['countryimg'];
    country = json['country'];
    currency = json['currency'];
    capital = json['capital'];
    currencyCode = json['currency_code'];
    continent = json['continent'];
    continentCode = json['continent_code'];
    alpha3 = json['alpha_3'];
    buyrate = json['buyrate'];
    sellrate = json['sellrate'];
    rate = json['rate'];
    dollarRate = json['dollar_rate'];
    active = json['active'];
  }
  num? id;
  dynamic name;
  num? phone;
  String? code;
  String? countryimg;
  String? country;
  String? currency;
  String? capital;
  String? currencyCode;
  String? continent;
  String? continentCode;
  String? alpha3;
  num? buyrate;
  num? sellrate;
  num? rate;
  String? dollarRate;
  bool? active;
DollaerModel copyWith({  num? id,
  dynamic name,
  num? phone,
  String? code,
  String? countryimg,
  String? country,
  String? currency,
  String? capital,
  String? currencyCode,
  String? continent,
  String? continentCode,
  String? alpha3,
  num? buyrate,
  num? sellrate,
  num? rate,
  String? dollarRate,
  bool? active,
}) => DollaerModel(  id: id ?? this.id,
  name: name ?? this.name,
  phone: phone ?? this.phone,
  code: code ?? this.code,
  countryimg: countryimg ?? this.countryimg,
  country: country ?? this.country,
  currency: currency ?? this.currency,
  capital: capital ?? this.capital,
  currencyCode: currencyCode ?? this.currencyCode,
  continent: continent ?? this.continent,
  continentCode: continentCode ?? this.continentCode,
  alpha3: alpha3 ?? this.alpha3,
  buyrate: buyrate ?? this.buyrate,
  sellrate: sellrate ?? this.sellrate,
  rate: rate ?? this.rate,
  dollarRate: dollarRate ?? this.dollarRate,
  active: active ?? this.active,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['code'] = code;
    map['countryimg'] = countryimg;
    map['country'] = country;
    map['currency'] = currency;
    map['capital'] = capital;
    map['currency_code'] = currencyCode;
    map['continent'] = continent;
    map['continent_code'] = continentCode;
    map['alpha_3'] = alpha3;
    map['buyrate'] = buyrate;
    map['sellrate'] = sellrate;
    map['rate'] = rate;
    map['dollar_rate'] = dollarRate;
    map['active'] = active;
    return map;
  }

}