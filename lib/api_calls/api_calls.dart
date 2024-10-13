import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../helper_functions/set_user_info.dart';

class ApiCalls {

  static String baseUrl='https://goldprice.absolutezerobd.com/';

  static Future<Map<String, dynamic>> getTokenAndLogin(String email,String password) async {
      Response response = await http.post(
        Uri.parse('${baseUrl}api/login'),
          body: {
            "email": email,
            "password": password,
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

  static Future<Map<String, dynamic>> getMaterialInfo(String idNo) async {
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}api/sections-by-material-price/$idNo'),
        // Uncomment and add Authorization if needed
        // headers: {
        //   'Authorization': 'Bearer ${UserInfo.getToken()}',
        // },
      );

      // Checking for a successful response
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        return {
          'status': 'success',
          'data': responseBody,
        };
      } else {
        // Handling unexpected status codes
        return {
          'status': 'error',
          'message': 'Error: ${response.statusCode}. Please try again later.',
        };
      }
    } catch (e) {
      // Catch any exceptions such as network issues or JSON parsing errors
      if (e is SocketException) {
        return {
          'status': 'error',
          'message': 'No Internet connection. Please check your network.',
        };
      } else if (e is FormatException) {
        return {
          'status': 'error',
          'message': 'Invalid response format. Unable to parse the data.',
        };
      } else {
        // Generic error message for any other exception
        return {
          'status': 'error',
          'message': 'Something went wrong. Please try again later.',
        };
      }
    }
  }


  static Future<dynamic> getSection() async{
    Response response = await http.get(
      Uri.parse('${baseUrl}api/sections'),
      headers: {
        'Authorization': 'Bearer ${UserInfo.getToket()}',
      },
    );
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      print('Raw response ${responseBody.toString()}');
      return {
        'response': 'success',
        'data': responseBody,
      };
    }else {
      // Handle other status codes appropriately
      return {
        'response': 'error',
        'message': 'Server problem',
      };
    }
  }

  static Future<Map<String, dynamic>> getDollarInfo() async {
    //pageNo='3';

    Response response = await http.get(
      Uri.parse('${baseUrl}api/all-country-data'),
      // headers: {
      //   'Authorization': 'Bearer ${UserInfo.getToket()}',
      // },
    );
    final responses = json.decode(response.body);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return {
        'status': 'success',
        'data': responseBody,
      };
    }else {
      // Handle other status codes appropriately
      return {
        'status': 'error',
        'message': 'Server problem',
      };
    }

  }
}