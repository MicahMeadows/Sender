import 'dart:convert';

import 'package:sender/data/repository/queue_route_repository/i_queue_route_repository.dart';

import '../../models/climbing_route/climbing_route.dart';

class TestingQueueRouteRepository implements IQueueRouteRepository {
  @override
  Future<List<ClimbingRoute>> getClimbingRoutes(List<String> routeIds) async {
    return Future.delayed(const Duration(milliseconds: 1700), () {
      String jsonString = '''[
    {
        "name": "Different Strokes ",
        "grade": "5.11c",
        "type": "Sport",
        "rating": 3,
        "height": 50,
        "firstAscent": "Terry Kindred - 2001",
        "description": "Climb the enjoyable face making use of side pulls and pinches the whole way up. Awesome route.",
        "protection": "Six bolts, bolted anchors.",
        "location": "Starts 30' right of Smack Dab, left of a chimney.",
        "areas": [
            {
                "id": "105868674",
                "name": "Kentucky"
            },
            {
                "id": "105841134",
                "name": "Red River Gorge"
            },
            {
                "id": "106585368",
                "name": "Pendergrass Murray Recreational Preserve Pmrp"
            },
            {
                "id": "106124262",
                "name": "The Gallery"
            }
        ],
        "imageUrls": [
            "https://cdn2.apstatic.com/photos/climb/119791512_medium_1603427278.jpg",
            "https://cdn2.apstatic.com/photos/climb/116166209_medium_1544139626.jpg",
            "https://cdn2.apstatic.com/photos/climb/106860997_medium_1494146441.jpg",
            "https://cdn2.apstatic.com/photos/climb/111146270_medium_1494341296.jpg",
            "https://cdn2.apstatic.com/photos/climb/106860992_medium_1494146441.jpg"
        ],
        "id": "106702950"
    },
    {
        "name": "Fugaku ",
        "grade": "5.12d",
        "type": "Sport",
        "rating": 2.8,
        "height": 65,
        "firstAscent": "Ken Saitoh 1/26/20",
        "description": "Right of Starry Night is this similar, but harder climb. Climb out the juggy roof similar to Starry Night, but you'll have to work a little harder through the bouldery finish to get to the chains. Be aware of loose rock as with all new routes. ",
        "protection": "6 Bolts",
        "location": "20 feet right of starry night. Also goes out the massive roof",
        "areas": [
            {
                "id": "105868674",
                "name": "Kentucky"
            },
            {
                "id": "105841134",
                "name": "Red River Gorge"
            },
            {
                "id": "106585368",
                "name": "Pendergrass Murray Recreational Preserve Pmrp"
            },
            {
                "id": "106124262",
                "name": "The Gallery"
            }
        ],
        "imageUrls": [
            "https://cdn2.apstatic.com/photos/climb/119034251_medium_1592097414.jpg",
            "https://cdn2.apstatic.com/photos/climb/119034229_medium_1592097294.jpg"
        ],
        "id": "118297380"
    },
    {
        "name": "Different Strokes ",
        "grade": "5.11c",
        "type": "Sport",
        "rating": 3,
        "height": 50,
        "firstAscent": "Terry Kindred - 2001",
        "description": "Climb the enjoyable face making use of side pulls and pinches the whole way up. Awesome route.",
        "protection": "Six bolts, bolted anchors.",
        "location": "Starts 30' right of Smack Dab, left of a chimney.",
        "areas": [
            {
                "id": "105868674",
                "name": "Kentucky"
            },
            {
                "id": "105841134",
                "name": "Red River Gorge"
            },
            {
                "id": "106585368",
                "name": "Pendergrass Murray Recreational Preserve Pmrp"
            },
            {
                "id": "106124262",
                "name": "The Gallery"
            }
        ],
        "imageUrls": [
            "https://cdn2.apstatic.com/photos/climb/119791512_medium_1603427278.jpg",
            "https://cdn2.apstatic.com/photos/climb/116166209_medium_1544139626.jpg",
            "https://cdn2.apstatic.com/photos/climb/106860997_medium_1494146441.jpg",
            "https://cdn2.apstatic.com/photos/climb/111146270_medium_1494341296.jpg",
            "https://cdn2.apstatic.com/photos/climb/106860992_medium_1494146441.jpg"
        ],
        "id": "106702950"
    },
    {
        "name": "Fugaku ",
        "grade": "5.12d",
        "type": "Sport",
        "rating": 2.8,
        "height": 65,
        "firstAscent": "Ken Saitoh 1/26/20",
        "description": "Right of Starry Night is this similar, but harder climb. Climb out the juggy roof similar to Starry Night, but you'll have to work a little harder through the bouldery finish to get to the chains. Be aware of loose rock as with all new routes. ",
        "protection": "6 Bolts",
        "location": "20 feet right of starry night. Also goes out the massive roof",
        "areas": [
            {
                "id": "105868674",
                "name": "Kentucky"
            },
            {
                "id": "105841134",
                "name": "Red River Gorge"
            },
            {
                "id": "106585368",
                "name": "Pendergrass Murray Recreational Preserve Pmrp"
            },
            {
                "id": "106124262",
                "name": "The Gallery"
            }
        ],
        "imageUrls": [
            "https://cdn2.apstatic.com/photos/climb/119034251_medium_1592097414.jpg",
            "https://cdn2.apstatic.com/photos/climb/119034229_medium_1592097294.jpg"
        ],
        "id": "118297380"
    },
    {
        "name": "Different Strokes ",
        "grade": "5.11c",
        "type": "Sport",
        "rating": 3,
        "height": 50,
        "firstAscent": "Terry Kindred - 2001",
        "description": "Climb the enjoyable face making use of side pulls and pinches the whole way up. Awesome route.",
        "protection": "Six bolts, bolted anchors.",
        "location": "Starts 30' right of Smack Dab, left of a chimney.",
        "areas": [
            {
                "id": "105868674",
                "name": "Kentucky"
            },
            {
                "id": "105841134",
                "name": "Red River Gorge"
            },
            {
                "id": "106585368",
                "name": "Pendergrass Murray Recreational Preserve Pmrp"
            },
            {
                "id": "106124262",
                "name": "The Gallery"
            }
        ],
        "imageUrls": [
            "https://cdn2.apstatic.com/photos/climb/119791512_medium_1603427278.jpg",
            "https://cdn2.apstatic.com/photos/climb/116166209_medium_1544139626.jpg",
            "https://cdn2.apstatic.com/photos/climb/106860997_medium_1494146441.jpg",
            "https://cdn2.apstatic.com/photos/climb/111146270_medium_1494341296.jpg",
            "https://cdn2.apstatic.com/photos/climb/106860992_medium_1494146441.jpg"
        ],
        "id": "106702950"
    },
    {
        "name": "Fugaku ",
        "grade": "5.12d",
        "type": "Sport",
        "rating": 2.8,
        "height": 65,
        "firstAscent": "Ken Saitoh 1/26/20",
        "description": "Right of Starry Night is this similar, but harder climb. Climb out the juggy roof similar to Starry Night, but you'll have to work a little harder through the bouldery finish to get to the chains. Be aware of loose rock as with all new routes. ",
        "protection": "6 Bolts",
        "location": "20 feet right of starry night. Also goes out the massive roof",
        "areas": [
            {
                "id": "105868674",
                "name": "Kentucky"
            },
            {
                "id": "105841134",
                "name": "Red River Gorge"
            },
            {
                "id": "106585368",
                "name": "Pendergrass Murray Recreational Preserve Pmrp"
            },
            {
                "id": "106124262",
                "name": "The Gallery"
            }
        ],
        "imageUrls": [
            "https://cdn2.apstatic.com/photos/climb/119034251_medium_1592097414.jpg",
            "https://cdn2.apstatic.com/photos/climb/119034229_medium_1592097294.jpg"
        ],
        "id": "118297380"
    }
]''';
      var json = jsonDecode(jsonString);

      List<ClimbingRoute> routes = [];
      for (int i = 0; i < json.length; i++) {
        routes.add(ClimbingRoute.fromJson(json[i]));
      }
      return routes;
    });
  }
}
