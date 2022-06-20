import 'package:sender/data/models/climbing_route/climbing_route.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

Future<ClimbingRoute> getRouteDetails(String id) async {
  final _pageUrl = Uri.parse('https://mountainproject.com/route/$id');
  final response = await http.get(_pageUrl);
  dom.Document html = dom.Document.html(response.body);

  final name = html
      .querySelector(
          '#route-page > div > div.col-md-9.float-md-right.mb-1 > h1')
      ?.innerHtml;

  final grade = html
      .querySelector(
          '#route-page > div > div.col-md-9.float-md-right.mb-1 > h2 > span.rateYDS')
      ?.text;

  return ClimbingRoute(
    id: id,
    grade: grade ?? 'Unknown',
    area: null,
    name: name ?? 'Unknown',
    rating: 0,
    type: 'Sport',
    pitches: 1,
    length: 20,
    longitude: 20.2,
    latitude: 40.4,
    mountainProjectUrl:
        'https://www.mountainproject.com/route/117909365/grandma-josephine',
    firstAscent: 'duder',
    imageUrls: [
      'https://cdn2.apstatic.com/photos/climb/119660752_medium_1601610931.jpg',
      'https://cdn2.apstatic.com/photos/climb/119660752_medium_1601610931.jpg'
    ],
    areas: [],
    details: [],
  );
}
