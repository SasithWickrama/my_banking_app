import 'dart:convert';

import 'package:free_flutter_ui_kits/services/api_services.dart';
import 'package:free_flutter_ui_kits/services/api_services_key.dart';

import 'model/general_response.dart';
import 'model/general_response_key.dart';

class ApiCall {
  int _sequence = 0; // Initialize sequence counter
  Future<void> buttonClick(String value1) async {
    await getInitialData(value1).then((value) async {
      print("1");
      print(value.message);
    });
  }

  Future<GenaralResponse> getInitialData(String value) async {
    var requestBody = jsonEncode(<String, String>{
      'OrganizationName': value,
    });
    print(requestBody);
    return await ApiServices().sendRequest(requestBody, 'InitRequest');
  }

  Future<void> buttonClickcap({
    required DateTime startTime,
    required DateTime endTime,
    required DateTime startDate,
    required DateTime endDate,
    required String screenName,
    required bool isFinalGoal,
    required String buttonName,
    required String property1,
    required String property2,
    required String sequence,
  }) async {
    try {
      // Increment sequence
      _sequence++;

      // Constructing the request body
      var requestBody = jsonEncode({
        "StartTime": startTime.toIso8601String().substring(11, 19),
        "EndTime": endTime.toIso8601String().substring(11, 19),
        "StartDate": startDate.toIso8601String().substring(0, 10),
        "EndDate": endDate.toIso8601String().substring(0, 10),
        "ScreenName": screenName,
        "IsFinalGoal": isFinalGoal,
        "ButtonName": buttonName,
        "Sequence": _sequence,
        "Property1": property1,
        "Property2": property2
      });
      print(jsonEncode({
        "StartTime": startTime.toIso8601String().substring(11, 19),
        "EndTime": endTime.toIso8601String().substring(11, 19),
        "StartDate": startDate.toIso8601String().substring(0, 10),
        "EndDate": endDate.toIso8601String().substring(0, 10),
        "ScreenName": screenName,
        "IsFinalGoal": isFinalGoal,
        "ButtonName": buttonName,
        "Sequence": _sequence,
        "Property1": property1,
        "Property2": property2
      }));

      // Calling the getInitialData method
      var response = await getInitialDatakey(requestBody);
      print("10");
      print(response.message);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<generalresponsekey> getInitialDatakey(String requestBody) async {
    // Calling the sendRequest method from ApiServices class
    return await ApiServicesKey()
        .sendRequest(requestBody, 'CaptureKeyStorokes');
  }
}

