import 'http_rest_api.dart';

class HeaderAuthenticatedApi extends HttpRestApi {
  Future<String>? Function() getAuthToken;

  HeaderAuthenticatedApi({
    required String baseUrl,
    required this.getAuthToken,
  }) : super(baseUrl: baseUrl);

  Future<Map<String, String>> getAuthenticationHeader() async {
    var authToken = await getAuthToken();
    if (authToken == null) {
      throw Exception('No auth token found.');
    }
    return {'authtoken': authToken};
  }

  @override
  Future<dynamic> get(String path, {Map<String, String>? headers}) async {
    return super.get(
      path,
      headers: await getAuthenticationHeader(),
    );
  }

  @override
  Future<dynamic> delete(
    String path, {
    Object? body,
    Map<String, String>? headers,
  }) async {
    return super.delete(
      path,
      body: body,
      headers: await getAuthenticationHeader(),
    );
  }

  @override
  Future<dynamic> post(
    String path, {
    required Object body,
    Map<String, String>? headers,
  }) async {
    return super.post(
      path,
      body: body,
      headers: await getAuthenticationHeader(),
    );
  }

  @override
  Future<dynamic> put(
    String path, {
    required Object body,
    Map<String, String>? headers,
  }) async {
    return super.put(
      path,
      body: body,
      headers: await getAuthenticationHeader(),
    );
  }
}
