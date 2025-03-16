class ActivityModel {
  final String type;
  final String icon;
  final String description;
  final int points;
  final String dateTime;

  ActivityModel({
    required this.type,
    required this.icon,
    required this.description,
    required this.points,
    required this.dateTime,
  });

  // Factory constructor to create an ActivityModel from a Map
  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      type: json['type'],
      icon: json['icon'],
      description: json['description'],
      points: json['points'],
      dateTime: json['dateTime'],
    );
  }
}
