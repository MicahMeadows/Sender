import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sender/common/networking/api_exception.dart';

import 'i_rest_api.dart';

class HttpRestApi implements IRestApi {
  const HttpRestApi({required this.baseUrl});

  final String baseUrl;

  @override
  Future<dynamic> get(String path, {Map<String, String>? headers}) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(baseUrl + path),
        headers: headers,
      );
      if (responseJson == null) return null;
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', '');
    }
    return responseJson;
  }

  @override
  Future<dynamic> post(
    String path, {
    required Object body,
    Map<String, String>? headers,
  }) async {
    dynamic responseJson;

    // var finalHeaders = {
    //   'Content-Type': 'application/json',
    //   ...?headers,
    // };

    try {
      final response = await http.post(
        Uri.parse(baseUrl + path),
        // headers: finalHeaders,
        headers: headers,
        body: jsonEncode(body),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', '');
    }
    return responseJson;
  }

  @override
  Future<dynamic> put(
    String path, {
    required Object body,
    Map<String, String>? headers,
  }) async {
    dynamic responseJson;
    try {
      final response = await http.put(
        Uri.parse(baseUrl + path),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', '');
    }
    return responseJson;
  }

  @override
  Future<dynamic> delete(
    String path, {
    Object? body,
    Map<String, String>? headers,
  }) async {
    dynamic responseJson;
    try {
      final response = await http.delete(Uri.parse(baseUrl + path));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', '');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString(), '400');
      case 401:

      case 403:
        throw UnauthorizedException(response.body.toString(), '403');
      case 404:
        throw BadRequestException(
            response.body.toString(), HttpStatus.notFound.toString());
      case 500:

      default:
        throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}',
          '?',
        );
    }
  }
}
