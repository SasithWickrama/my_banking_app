import 'dart:convert';

import 'package:free_flutter_ui_kits/model/general_response_key.dart';
import 'package:http/http.dart' as http;

class ApiServicesKey {
  static const String baseUrl = 'http://124.43.132.64:80/api/Application';

  Future<generalresponsekey> sendRequest(
      var requestbody, String function) async {
    Uri url = Uri.parse('${baseUrl}/${function}');
    generalresponsekey generalResponse;

    print(url);

    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    try {
      final response = await http.post(url, headers: header, body: requestbody);
      final data = json.decode(response.body);
      print("2");
      print(data);
      generalResponse = generalresponsekey.fromJson(data);
    } catch (e) {
      generalResponse = generalresponsekey(message: 'API Error: ${e.toString()}');
    }

    return generalResponse;
  }
}
