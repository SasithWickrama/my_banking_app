import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCaller {
  // Base URL of the API
  static const String baseUrl = 'http://124.43.132.64:80/api/Application';

  Future<String> initRequest() async {
    // Define the API endpoint URL
    String url = '$baseUrl/InitRequest';

    // Prepare the request headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    // Prepare the request body
    Map<String, String> requestBody = {
      "OrganizationName": "HNB"
    };

    // Send the POST request
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(requestBody),
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse and return the response body
        Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData['message'];
      } else {
        // Request failed, throw an error or handle it accordingly
        throw Exception('Failed to make API call: ${response.statusCode}');
      }
    } catch (e) {
      // Request failed, throw an error or handle it accordingly
      throw Exception('Failed to make API call: $e');
    }
  }

  Future<String> captureKeyStrokes({
    required String startTime,
    required String endTime,
    required String startDate,
    required String endDate,
    required String screenName,
    required bool isFinalGoal,
    required String buttonName,
    required int sequence,
    String property1 = "",
    String property2 = "",
  }) async {
    // Define the API endpoint URL
    String url = '$baseUrl/CaptureKeyStorokes';

    // Prepare the request headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    // Prepare the request body
    Map<String, dynamic> requestBody = {
      "StartTime": startTime,
      "EndTime": endTime,
      "StartDate": startDate,
      "EndDate": endDate,
      "ScreenName": screenName,
      "IsFinalGoal": isFinalGoal,
      "ButtonName": buttonName,
      "Sequence": sequence,
      "Property1": property1,
      "Property2": property2,
    };

    // Send the POST request
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(requestBody),
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse and return the response body
        Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData['message'];
      } else {
        // Request failed, throw an error or handle it accordingly
        throw Exception('Failed to make API call: ${response.statusCode}');
      }
    } catch (e) {
      // Request failed, throw an error or handle it accordingly
      throw Exception('Failed to make API call: $e');
    }
  }
}
