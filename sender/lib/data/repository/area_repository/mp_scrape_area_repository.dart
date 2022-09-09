import 'package:sender/data/models/area/area.dart';
import 'package:sender/data/repository/area_repository/i_area_repository.dart';
// import 'package:web_scraper/web_scraper.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';

class MPScrapeAreaRepository implements IAreaRepository {
  static const String _baseUrl =
      'https://www.mountainproject.com/ajax/public/area-picker-list';

  @override
  Future<List<Area>> getAreas(String parentId) async {
    var client = Client();
    final response = await client.get(Uri.parse('$_baseUrl/$parentId'));
    final document = parse(response.body);
    final divs = document.querySelectorAll('div');
    final areas = divs.map((div) {
      final child = div.children.first;
      final tagName = child.localName;
      final id =
          tagName == 'strong' ? parentId : child.attributes["data-area-id"]!;
      final name = child.innerHtml.trim();
      return Area(id: id, name: name);
    }).toList();
    return areas;
  }
}
