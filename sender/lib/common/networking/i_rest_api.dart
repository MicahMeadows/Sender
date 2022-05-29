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
