import '../../models/area/area.dart';

abstract class IAreaRepository {
  Future<List<Area>> getAreas(String parentId);
}
