import 'dart:convert';

import 'package:gold_mine/gold_model.dart';
import 'package:http/http.dart';

class ApiCalls {
  static Future<dynamic> getMaterialPriceInfo() async {
    var data;
    try {
      Response response = await get(
        Uri.parse(
            'https://www.price.gloticket.org/api/material-price?perPage=5'),
      );
      data = await jsonDecode(response.body.toString());

      return data;
    } catch (e) {

      print(e.toString());
      return null;

    }
  }
}