class Flags {
  int id;
  String minute;
  String second;
  String mills;
  int previousMills;
  int previousSecond;
  int previousMinute;
  int currentMills;
  int currentSecond;
  int currentMinute;

  Flags({
    required this.id,
    required this.minute,
    required this.second,
    required this.mills,
    required this.previousSecond,
    required this.previousMills,
    required this.previousMinute,
    required this.currentMills,
    required this.currentSecond,
    required this.currentMinute,
  });

  factory Flags.fromMap(Map<String, dynamic> data) {
    return Flags(
      id: data['id'],
      mills: data['mills'],
      minute: data['minute'],
      second: data['second'],
      previousMills: data['previousMills'],
      previousSecond: data['previousSecond'],
      previousMinute: data['previousMinute'],
      currentMills: data['currentMills'],
      currentMinute: data['currentMinute'],
      currentSecond: data['currentSecond'],
    );
  }
}
