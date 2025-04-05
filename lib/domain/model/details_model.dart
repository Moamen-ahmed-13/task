class DetailsModel {
  final String day;
  final String title;
  final String morning;
  final String afternoon;
  final String evening;
  final String imagePath;
  bool isExpanded;

  DetailsModel({required this.day, required this.title, required this.morning, required this.afternoon, required this.evening, required this.imagePath, this.isExpanded = false});
}