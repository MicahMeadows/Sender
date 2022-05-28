import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sender/common/networking/api_exception.dart';

abstract class IRestApi {
  Future<dynamic> get(
    String path, {
    Map<String, String>? headers,
  });
  Future<dynamic> post(
    String path, {
    required Object body,
    Map<String, String>? headers,
  });
  Future<dynamic> put(
    String path, {
    required Object body,
    Map<String, String>? headers,
  });
  Future<dynamic> delete(
    String path, {
    Object? body,
    Map<String, String>? headers,
  });
}

class HeaderAuthenticatedApi extends HttpRestApi {
  HeaderAuthenticatedApi({required String baseUrl}) : super(baseUrl: baseUrl);

  Map<String, String> get _authenticationHeader => {
        'authtoken':
            'eyJhbGciOiJSUzI1NiIsImtpZCI6IjZmOGUxY2IxNTY0MTQ2M2M2ZGYwZjMzMzk0YjAzYzkyZmNjODg5YWMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vc2VuZGVyLTc2MjU2IiwiYXVkIjoic2VuZGVyLTc2MjU2IiwiYXV0aF90aW1lIjoxNjUzNzczNzgxLCJ1c2VyX2lkIjoiaklKSXFJN2tURVp2Umd5cDl6Z1Exc0o1YU9sMSIsInN1YiI6ImpJSklxSTdrVEVadlJneXA5emdRMXNKNWFPbDEiLCJpYXQiOjE2NTM3NzM3ODEsImV4cCI6MTY1Mzc3NzM4MSwiZW1haWwiOiJtaWNhaG0yMTNAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbIm1pY2FobTIxM0BnbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.lD8wSq8NGvaPzR77S2faVFSsf5qE0NJFlLACGSK2NntWU-36XPbxpMlYSu__sEAqkdI5KPyyRZAqXOARJXoW3nNlfop8ac9eTnfQE9YFpxjKAiGwLnoN2VqCc-wvTYV67I-vwMdEbc0ebEGtDaFx8rnAolotETw6J3mIqnk0FTO7qIOROqpl_DrZ3R9t201C6lhA4ZjFuOh3rbfFM92ssQAj4m1DzTSIMOEWXmU1pL4iTQ-HVe7_bxtdVyzRWXt3CO6Iwg2UXh1xFqB0hc8dLVLQMiZt8CxTU3L3fyOqcVyJcsRMuyPBGrLP3CetGk7By4aJNSoFbWDbb99D-czWjQ',
      };

  @override
  Future<dynamic> get(String path, {Map<String, String>? headers}) {
    return super.get(path, headers: _authenticationHeader);
  }

  @override
  Future<dynamic> delete(
    String path, {
    Object? body,
    Map<String, String>? headers,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> post(
    String path, {
    required Object body,
    Map<String, String>? headers,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> put(
    String path, {
    required Object body,
    Map<String, String>? headers,
  }) {
    throw UnimplementedError();
  }
}

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
    try {
      final response = await http.post(
        Uri.parse(baseUrl + path),
        headers: {
          ...?headers,
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
