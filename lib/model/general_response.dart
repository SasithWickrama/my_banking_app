class GenaralResponse {
  //final int result;
  var token;
  final String message;

  GenaralResponse({ this.token = null, this.message = ''});
  //GenaralResponse({ this.message = ''});

  factory GenaralResponse.fromJson(Map<String, dynamic> responsejson) {
    final message = responsejson['message'] as String;
    final data    = responsejson['token'] ?? "";

    return GenaralResponse(message: message, token: data);
    //return GenaralResponse(message: message);
  }
}
