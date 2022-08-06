import 'package:sender/data/models/area/area.dart';
import 'package:sender/data/repository/area_repository/i_area_repository.dart';
import 'package:sender/data/sender_api/retrofit_sender_api.dart';

class RetrofitAreaRepository implements IAreaRepository {
  final RetrofitSenderApi _api;

  const RetrofitAreaRepository(this._api);

  @override
  Future<List<Area>> getAreas(String parentId) async {
    return _api.getClimbingAreas(parentId);
  }
}
