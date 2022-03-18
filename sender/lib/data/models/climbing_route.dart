import 'package:sender/data/models/area.dart';

class ClimbingRoute {
  final String name;
  final String grade;
  final String type;
  final double rating;
  final int height;
  final String firstAscent;
  final String description;
  final String protection;
  final String location;
  final List<Area> areas;
  final List<String> imageUrls;
  final int routeId;

  const ClimbingRoute({
    required this.name,
    required this.grade,
    required this.type,
    required this.rating,
    required this.height,
    required this.firstAscent,
    required this.description,
    required this.protection,
    required this.location,
    required this.areas,
    required this.imageUrls,
    required this.routeId,
  });
}
