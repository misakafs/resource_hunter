import 'package:dio/dio.dart';
import 'package:resource_hunter/src/utils/utils.dart';

///
class Http {
  static final Dio _dio = _init();

  static Dio _init() {
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if (response.statusCode! < 200 || response.statusCode! >= 300) {
          handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              response: response,
              type: DioExceptionType.badResponse,
            ),
            true,
          );
        } else {
          handler.next(response);
        }
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));

    return dio;
  }

  ///
  static Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    int retry = 3,
  }) async {
    final options = Options(
      headers: headers,
    );
    try {
      final response = await _dio.get(path,
          queryParameters: queryParameters, options: options);
      return Utils.convertToMap(response.data);
    } catch (e) {
      if (retry > 0) {
        return get(path,
            queryParameters: queryParameters,
            headers: headers,
            retry: retry - 1);
      }
      rethrow;
    }
  }

  ///
  static Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? body,
    Map<String, dynamic>? headers,
    int retry = 3,
  }) async {
    final options = Options(
      headers: headers,
    );
    try {
      final response = await _dio.post(path,
          queryParameters: queryParameters, data: body, options: options);
      return Utils.convertToMap(response.data);
    } catch (e) {
      if (retry > 0) {
        return post(path,
            queryParameters: queryParameters,
            body: body,
            headers: headers,
            retry: retry - 1);
      }
      rethrow;
    }
  }
}
