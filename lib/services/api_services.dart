import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/general_response.dart';

class ApiServices {
  static const String baseUrl = 'http://124.43.132.64:80/api/Application';

  Future<GenaralResponse> sendRequest(var requestbody, String function) async {
    Uri url = Uri.parse('${baseUrl}/${function}');
    GenaralResponse generalResponse;

    print(url);

    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    try {
      final response = await http.post(url, headers: header, body: requestbody);
      final data = json.decode(response.body);
      print("2");
      print(data);
      generalResponse = GenaralResponse.fromJson(data);
    } catch (e) {
      generalResponse = GenaralResponse(message: 'API Error: ${e.toString()}');
    }

    return generalResponse;
  }
}
