class CaptureKeyStrokesRequest {
  final String startTime;
  final String endTime;
  final String startDate;
  final String endDate;
  final String screenName;
  final bool isFinalGoal;
  final String buttonName;
  final int sequence;
  final String property1;
  final String property2;

  CaptureKeyStrokesRequest({
    required this.startTime,
    required this.endTime,
    required this.startDate,
    required this.endDate,
    required this.screenName,
    required this.isFinalGoal,
    required this.buttonName,
    required this.sequence,
    required this.property1,
    required this.property2,
  });

  Map<String, dynamic> toJson() {
    return {
      'StartTime': startTime,
      'EndTime': endTime,
      'StartDate': startDate,
      'EndDate': endDate,
      'ScreenName': screenName,
      'IsFinalGoal': isFinalGoal,
      'ButtonName': buttonName,
      'Sequence': sequence,
      'Property1': property1,
      'Property2': property2,
    };
  }
}
