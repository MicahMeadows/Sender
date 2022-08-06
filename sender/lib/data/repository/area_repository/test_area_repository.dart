import 'package:sender/data/models/area/area.dart';
import 'package:sender/data/repository/area_repository/i_area_repository.dart';

class TestAreaRepository implements IAreaRepository {
  @override
  Future<List<Area>> getAreas(String parentId) {
    if (parentId == "1") {
      return Future.value(const [
        Area(id: "1.1", name: "Area 1.1"),
        Area(id: "1.2", name: "Area 1.2"),
        Area(id: "1.3", name: "Area 1.3"),
      ]);
    }
    if (parentId == "2") {
      return Future.value(const [
        Area(id: "2.1", name: "Area 2.1"),
        Area(id: "2.2", name: "Area 2.2"),
        Area(id: "2.3", name: "Area 2.3"),
      ]);
    }
    if (parentId == "3") {
      return Future.value(const [
        Area(id: "3.1", name: "Area 3.1"),
        Area(id: "3.2", name: "Area 3.2"),
        Area(id: "3.3", name: "Area 3.3"),
      ]);
    }
    return Future.value(const [
      Area(id: "1", name: "Area 1"),
      Area(id: "2", name: "Area 2"),
      Area(id: "3", name: "Area 3"),
      Area(id: "1.1", name: "Area 1.1"),
      Area(id: "1.2", name: "Area 1.2"),
      Area(id: "1.3", name: "Area 1.3"),
      Area(id: "1.1", name: "Area 1.1"),
      Area(id: "1.2", name: "Area 1.2"),
      Area(id: "1.3", name: "Area 1.3"),
      Area(id: "1.1", name: "Area 1.1"),
      Area(id: "1.2", name: "Area 1.2"),
      Area(id: "1.3", name: "Area 1.3"),
      Area(id: "1.1", name: "Area 1.1"),
      Area(id: "1.2", name: "Area 1.2"),
      Area(id: "1.3", name: "Area 1.3"),
      Area(id: "1.1", name: "Area 1.1"),
      Area(id: "1.2", name: "Area 1.2"),
      Area(id: "1.3", name: "Area 1.3"),
      Area(id: "1.1", name: "Area 1.1"),
      Area(id: "1.2", name: "Area 1.2"),
      Area(id: "1.3", name: "Area 1.3"),
      Area(id: "1.1", name: "Area 1.1"),
      Area(id: "1.2", name: "Area 1.2"),
      Area(id: "1.3", name: "Area 1.3"),
    ]);
  }
}
