import 'package:dio/dio.dart';
import 'package:rickandmorty/constants/strings.dart';

class CharactersApi {
  late Dio dio;

  CharactersApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 5),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      List<dynamic> charactersList = response.data['results'];

      return charactersList;
    } catch (e) {
      ('error ${e.toString()}');

      return [];
    }
  }
}
