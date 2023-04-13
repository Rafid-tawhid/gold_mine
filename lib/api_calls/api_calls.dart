import 'dart:convert';

import 'package:gold_mine/models/gold_model.dart';
import 'package:gold_mine/widgets/my_dialoge.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiCalls {

  static String baseUrl='https://goldprice.absolutezerobd.com/';

  static Future<Map<String, dynamic>> getTokenAndLogin(String email,String password) async {
      Response response = await http.post(
        Uri.parse('${baseUrl}api/login'),
          body: {
            "email": "$email",
            "password": "$password",
          }
      );
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        return {
          'status': 'success',
          'message': 'Login successful',
          'data': responseBody,
        };
      } else if (response.statusCode == 401) {
        return {
          'status': 'error',
          'message': 'Invalid credentials',
        };
      }
      else if (response.statusCode == 404) {
        return {
          'status': 'error',
          'message': 'Url not found',
        };
      }else {
        // Handle other status codes appropriately
        return {
          'status': 'error',
          'message': 'An error occurred',
        };
      }

  }


  static Future<Map<String, dynamic>> getMaterialInfo() async {
    Response response = await http.get(
        Uri.parse('${baseUrl}api/material-price?perPage=3'),
    );
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return {
        'status': 'success',
        'data': responseBody,
      };
    } else if (response.statusCode == 401) {
      return {
        'status': 'error',
        'message': 'Invalid credentials',
      };
    }
    else if (response.statusCode == 404) {
      return {
        'status': 'error',
        'message': 'Url not found',
      };
    }else {
      // Handle other status codes appropriately
      return {
        'status': 'error',
        'message': 'An error occurred',
      };
    }

  }
}