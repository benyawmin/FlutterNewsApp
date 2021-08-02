import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LatestNewsBloc {
  final _latestNews = PublishSubject();

  get latestNewsAdd => _latestNews.sink.add;
  get latestNewsStream => _latestNews.stream;

  final baseUrl =
      'https://api.currentsapi.services/v1/latest-news? -H accept: application/json' +
          'language=us&' +
          'apiKey=tUgFTJO_UFo_Xwo1xpmJ9qPbq7uuhTCMFT-Svqepr4hSVsbv';
  fetchLatestNews() async {
    final response = await http.get(
      Uri.parse('$baseUrl'),
    );
    if (response.statusCode == 200) {
      // print(response.body);
      final items = json.decode(response.body);
      print(items["news"].length);
      print("----------------------------------------------------------");
      print(items);
      print("----------------------------------------------------------");
      print(items["news"]);
      print("----------------------------------------------------------");
      print('Successful 200');
      final fItem = items["news"];
      print(fItem);

      return fItem;
    } else if (response.statusCode == 401) {
      throw Exception('Error 401');
    } else if (response.statusCode == 429) {
      throw Exception('Error 429');
    }
  }

  fetchCategory() async {
    final response = await http.get(Uri.parse(
        'https://api.currentsapi.services/v1/available/categories? -H "accept: application/json"' +
            'apiKey=tUgFTJO_UFo_Xwo1xpmJ9qPbq7uuhTCMFT-Svqepr4hSVsbv'));

    if (response.statusCode == 200) {
      final categories = json.decode(response.body);
      print(categories['categories']);
      return categories['categories'];
    } else {
      print(
          'AN ERROOOOOOOOOOOOOOOOOOOOOOOOOOOOOR BYYYYYYYYYYYYYYYYY BENNNNNNNNNNNNNNYAAAAAAAAAAMMMMMMIIIIIIN');
    }
  }

  fetchFullDetailRss(url) async {
        final response = await http.get(Uri.parse(
        '$url -H "accept: application/json"'));

    if (response.statusCode == 200) {
      final detail = json.decode(response.body);
      return detail;
    } else {
      print(
          'AN ERROOOOOOOOOOOOOOOOOOOOOOOOOOOOOR BYYYYYYYYYYYYYYYYY BENNNNNNNNNNNNNNYAAAAAAAAAAMMMMMMIIIIIIN');
    }
  }
}
