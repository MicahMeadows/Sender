import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sender/common/networking/api_exception.dart';

class ApiBaseHelper {
  final String _baseUrl = 'http://10.0.2.2:8080/';
  // final String _baseUrl = 'https://5826-157-89-189-229.ngrok.io';

  Future<dynamic> get(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl + url));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection.');
    }
    return responseJson;
  }

  Future<dynamic> post(String url,
      {Object? body, Map<String, String>? headers}) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(_baseUrl + url),
        body: body,
        headers: headers ??
            {
              'Content-Type': 'application/json',
            },
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection. ');
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
      case 404:
        throw NotFoundException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
          'Error occured while Communicating with the server with StatusCode: ${response.statusCode}',
        );
    }
  }
}
