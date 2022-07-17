// import 'package:sender/data/models/climbing_route/climbing_route.dart';
// import 'package:http/http.dart' as http;
// import 'package:html/dom.dart' as dom;
// import 'package:sender/data/models/climbing_route_detail/climbing_route_detail.dart';

// Future<ClimbingRoute> getRouteDetails(String id) async {
//   final _pageUrl = Uri.parse('https://mountainproject.com/route/$id?print=1');
//   final response = await http.get(_pageUrl);
//   dom.Document html = dom.Document.html(response.body);

//   final name =
//       html.querySelector('#route-page > div.row.pt-2 > div > h2')?.text;

//   final gradeTypeHeight =
//       html.querySelector('#route-page > div.row.pt-2 > div > div.mb-1')?.text;

//   final splitGradeTypeHeight = gradeTypeHeight?.split(',');

//   final grade = splitGradeTypeHeight?[0].trim();
//   final type = splitGradeTypeHeight?[1].trim();
//   final height = splitGradeTypeHeight?[2].trim().split(' ')[0];

//   final ratingRaw = html.querySelector('.scoreStars')?.text;

//   final rating = ratingRaw?.trim().split(' ')[1].trim();

//   final firstAscentRaw = html
//       .querySelector(
//           '#route-page > div.row.pt-2 > div > div.mb-1 > br:nth-child(2)')
//       ?.text
//       .trim();

//   final firstAscent = firstAscentRaw?.trim().substring(4).trim();

//   final areasRaw = html
//       .querySelector(
//           '#route-page > div.row.pt-2 > div > div.mb-1 > br:nth-child(3)')
//       ?.text
//       .trim();

//   List<String> areasTexts = areasRaw?.split('>') ?? [];
//   areasTexts = areasTexts.map((e) => e.trim()).toList();

//   final detailPageDiv = html.querySelector('.col-xs-12');

//   final detailSectionTitles = detailPageDiv?.querySelectorAll('mt-1') ?? [];
//   final detailSectionContents =
//       detailPageDiv?.querySelectorAll('fr-view') ?? [];

//   List<ClimbingRouteDetail> routeDetailSections = [];

//   for (int i = 0;
//       i < (detailSectionTitles.length) && i < detailSectionContents.length;
//       i++) {
//     routeDetailSections.add(
//       ClimbingRouteDetail(
//         title: detailSectionTitles[i].text,
//         content: detailSectionContents[i].text,
//       ),
//     );
//   }

//   final allPhotosDiv = html.querySelector('#all-photos');

//   final photosElements = allPhotosDiv?.querySelectorAll('.row > div > img');

//   // var photoUrls =
//   //     photosElements?.map((element) => element.attributes['data-src']).toList();

//   List<String> photoUrls = [];
//   if (photosElements != null) {
//     for (var photo in photosElements) {
//       final photoUrl = photo.attributes['data-src'];
//       if (photoUrl != null) {
//         photoUrls.add(photoUrl);
//       }
//     }
//   }

//   return ClimbingRoute(
//     id: id,
//     grade: grade,
//     area: areasRaw,
//     name: name ?? 'Unavailable',
//     rating: rating == null ? null : double.tryParse(rating),
//     type: type,
//     pitches: 1,
//     length: height == null ? null : int.tryParse(height),
//     longitude: null,
//     latitude: null,
//     firstAscent: firstAscent,
//     imageUrls: photoUrls,
//     areas: areasTexts,
//     details: routeDetailSections,
//   );
// }
