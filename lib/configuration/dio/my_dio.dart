import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

import 'dio_connectivity_request_retrier.dart';
import 'dio_retry_interceptor.dart';

class MyDio {
  final String authorization =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkOTI4NTg2Yjg1NTdmNDQ5OTE1ZWYxMDlkMTQ3YWNjNCIsInN1YiI6IjVmOTNkZmE3ZDExZTBlMDA1MDhlM2Q0NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CqzYq4rmT64OlwyLR8Bpu6qOv2sr4WgLw9D3zOlLZNo";

  Dio get dio => _dio();

  Dio _dio() {
    Map<String, String> _headers = {"Accept": "application/json", "Authorization": authorization};

    final options = BaseOptions(
        baseUrl: "https://api.themoviedb.org/3/", contentType: "application/json", headers: _headers);

    var dio = Dio(options);

    // add retry interceptor
    dio.interceptors.add(RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(dio: dio, connectivity: Connectivity())));

    return dio;
  }
}
