class ClimbingRoute {
  final String name;
  final String grade;
  final String description;
  final String type;
  final String height;
  final String firstAscent;
  final double averageRating;
  final List<String> imageUrls;
  final List<String> area;

  const ClimbingRoute({
    required this.name,
    required this.grade,
    required this.description,
    required this.type,
    required this.height,
    required this.firstAscent,
    required this.averageRating,
    required this.imageUrls,
    required this.area,
  });
}
