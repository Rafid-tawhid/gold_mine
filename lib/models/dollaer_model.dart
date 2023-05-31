class DollarInfoModel {
  bool? status;
  List<Countries>? countries;
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;

  DollarInfoModel(
      {this.status,
        this.countries,
        this.total,
        this.perPage,
        this.currentPage,
        this.lastPage});

  DollarInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(new Countries.fromJson(v));
      });
    }
    total = json['total'];
    perPage = json['perPage'];
    currentPage = json['currentPage'];
    lastPage = json['lastPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['perPage'] = this.perPage;
    data['currentPage'] = this.currentPage;
    data['lastPage'] = this.lastPage;
    return data;
  }
}

class Countries {
  int? id;
  Null? name;
  String? phone;
  String? code;
  String? countryimg;
  String? country;
  String? currency;
  String? capital;
  String? currencyCode;
  String? continent;
  String? continentCode;
  String? alpha3;
  String? buyrate;
  String? sellrate;
  double? rate;
  String? dollarRate;
  bool? active;

  Countries(
      {this.id,
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
        this.active});

  Countries.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['code'] = this.code;
    data['countryimg'] = this.countryimg;
    data['country'] = this.country;
    data['currency'] = this.currency;
    data['capital'] = this.capital;
    data['currency_code'] = this.currencyCode;
    data['continent'] = this.continent;
    data['continent_code'] = this.continentCode;
    data['alpha_3'] = this.alpha3;
    data['buyrate'] = this.buyrate;
    data['sellrate'] = this.sellrate;
    data['rate'] = this.rate;
    data['dollar_rate'] = this.dollarRate;
    data['active'] = this.active;
    return data;
  }
}
