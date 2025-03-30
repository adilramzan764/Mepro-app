class SurveyModel {
  final String title;
  final String? subtitle;
  final int points;
  final int minutes;
  final String imagePath;

  SurveyModel({
    required this.title,
    this.subtitle,
    required this.points,
    required this.minutes,
    required this.imagePath,
  });
}