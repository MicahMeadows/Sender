import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sender/common/networking/api_exception.dart';

class ApiBaseHelper {
  final String _baseUrl = 'http://10.0.2.2:8080/';

  Future<dynamic> get(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl + url));
      print('response: ${response.body}');
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection.');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
          'Error occured while Communicating with the server with StatusCode: ${response.statusCode}',
        );
    }
  }
}
