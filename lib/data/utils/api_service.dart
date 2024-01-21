import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'api_path.dart';

class ApiService {
  static const String jsonType = 'application/json';


  static Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiPaths.base,
        receiveDataWhenStatusError: true,
        validateStatus: (status) => true,
      )
  );

  /// Get api
  static Future<Response<T>> getApi<T>(String path, {Map<String, dynamic>? params}) async {
    try {
      final Response<T> response = await dio.get(
        path,
        queryParameters: params,
        options: Options(
          validateStatus: (int? status) {
            if (status == 401 || status == 403) return false;
            return true;
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      debugPrint(e.toString());
      // implement further handling such as handling token expiration in case of using token
      throw Exception(e.message);
    }
  }
}
