import 'package:dio/dio.dart';
import 'package:movee/configuration/dio/dio_config.dart';
import 'package:movee/model/upcoming_model.dart';

class UpcomingRepository {
  Dio dio;
  UpcomingRepository() {
    dio = MyDio().dio;
  }

  Future<List<UpcomingModel>> getUpcoming() async {
    try {
      var response = await dio.get('movie/upcoming?page=1');

      return (response.data['results'] as List).map((x) => UpcomingModel.fromJson(x)).toList();
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}
