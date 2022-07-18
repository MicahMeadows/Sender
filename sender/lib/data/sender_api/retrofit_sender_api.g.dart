// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofit_sender_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RetrofitSenderApi implements RetrofitSenderApi {
  _RetrofitSenderApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://1695-2603-9001-7301-7731-813f-e0d1-82c4-3d11.ngrok.io';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<RoutePreferences> getUserPreferences() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RoutePreferences>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/preferences',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RoutePreferences.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RoutePreferences> updateUserPreferences(newPreferences) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(newPreferences.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RoutePreferences>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/preferences',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RoutePreferences.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ClimbingRoute> getRouteDetails(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ClimbingRoute>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/routes/${id}/details',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ClimbingRoute.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RouteTick> setRouteTick(tick) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(tick.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RouteTick>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/tick',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RouteTick.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> removeRouteTick(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, '/user/tick/${id}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<List<RouteTick>> getRouteTicks() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<RouteTick>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/tick',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => RouteTick.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<ClimbingRoute>> getQueueRoutes(
      {settings = const {"ignore": []},
      includePageData = 'true',
      needImages = 'true',
      numResults}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'includePageData': includePageData,
      r'needImages': needImages,
      r'numResults': numResults
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(settings);
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ClimbingRoute>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/routes/queue',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ClimbingRoute.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
