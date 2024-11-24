// ignore: camel_case_types
class generalresponsekey {
  //final int result;
  var data;
  final String message;

  //GenaralResponse({ this.data = null, this.message = ''});
  generalresponsekey({ this.message = ''});

  factory generalresponsekey.fromJson(Map<String, dynamic> responsejson) {
    final message = responsejson['message'] as String;
    //final data    = responsejson['data'] ?? "";

    //return GenaralResponse(message: message, data: data);
    return generalresponsekey(message: message);
  }
}
