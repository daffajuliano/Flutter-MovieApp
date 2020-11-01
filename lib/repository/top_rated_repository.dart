import 'package:dio/dio.dart';
import 'package:movee/configuration/dio/dio_config.dart';
import 'package:movee/model/top_rated_model.dart';

class TopRatedRepository {
  Dio dio;
  TopRatedRepository() {
    dio = MyDio().dio;
  }

  Future<List<TopRatedModel>> getTopRated() async {
    try {
      var response = await dio.get('movie/top_rated?page=1&region=ID');

      return (response.data['results'] as List).map((x) => TopRatedModel.fromJson(x)).toList();
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}
