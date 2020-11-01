import 'package:dio/dio.dart';
import 'package:movee/configuration/dio/dio_config.dart';
import 'package:movee/model/popular_model.dart';

class PopularRepository {
  Dio dio;
  PopularRepository() {
    dio = MyDio().dio;
  }

  Future<List<PopularModel>> getPopular() async {
    try {
      var response = await dio.get('movie/popular?page=1&region=ID');

      return (response.data['results'] as List).map((x) => PopularModel.fromJson(x)).toList();
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}
