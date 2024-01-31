import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoonflix/models/webtoon_model.dart';

class ApiService {
  //state 가 없는 클래스는 static으로 만든다.
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];

    final url = Uri.parse('$baseUrl/$today');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);

      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }

      //print(response.body);
      return webtoonInstances;
    }
    throw Error();
  }
}
