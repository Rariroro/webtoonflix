import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoonflix/models/webtoon_detail_model.dart';
import 'package:webtoonflix/models/webtoon_model.dart';
import 'package:webtoonflix/models/webtoon_episode_model.dart';

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

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final reponse = await http.get(url);
    if (reponse.statusCode == 200) {
      final webtoon = jsonDecode(reponse.body);

      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodeInstances = [];

    final url = Uri.parse("$baseUrl/$id/episodes");
    final reponse = await http.get(url);

    if (reponse.statusCode == 200) {
      final episodes = jsonDecode(reponse.body);

      for (var episode in episodes) {
        episodeInstances.add(WebtoonEpisodeModel.fromjson(episode));
      }
      return episodeInstances;
    }
    throw Error();
  }
}
