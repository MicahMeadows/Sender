import 'package:sender/common/networking/api_base_helper.dart';
import 'package:sender/data/models/climbing_route.dart';
import 'package:sender/data/repository/queue_route_repository/i_queue_route_repository.dart';

class ApiQueueRouteRepository extends IQueueRouteRepository {
  final _api = ApiBaseHelper();

  @override
  Future<List<ClimbingRoute>> getClimbingRoutes() {
    var response = _api.get('routes/details/118297380');

    print(response);

    return Future.value([]);
  }
}
