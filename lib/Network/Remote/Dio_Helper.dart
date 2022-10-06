import 'package:dio/dio.dart';
//path:v2/top-headlines
//query{sources=google-news-sa,apiKey=d248d1e5cf064481a7df26e323a08e53}
class DioHelper {
  static late Dio dio;

  static initDio() {
    dio = Dio(
      BaseOptions(
      baseUrl:"https://newsapi.org/",

receiveDataWhenStatusError: true));
  }

  static Future<Response> getApiData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio.get(url, queryParameters: query);
  }
}
