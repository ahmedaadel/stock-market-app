import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static initDio() {
    dio = Dio(BaseOptions(baseUrl: '', receiveDataWhenStatusError: true));
  }

  static Future<Response> getApiData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio.get(url, queryParameters: query);
  }
}
