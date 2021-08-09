import 'dart:io';
import 'package:news/src/models/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsApiProvider {
  final baseUrl = 'api.currentsapi.services';

  fetchLatestNews() async {
    final uri = Uri.https('$baseUrl', '/v1/latest-news');
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader:
          'tUgFTJO_UFo_Xwo1xpmJ9qPbq7uuhTCMFT-Svqepr4hSVsbv',
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      return NewsModel.fromJson(items).news;
    } else if (response.statusCode == 401) {
      throw Exception('Error 401');
    } else if (response.statusCode == 429) {
      throw Exception('Error 429');
    } else {
      throw Exception('null');
    }
  }

  fetchSearchedNews(String searchParameter) async {
    final queryParameters = {
      'keywords': searchParameter,
    };
    final uri = Uri.https('$baseUrl', '/v1/search', queryParameters);
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader:
          'tUgFTJO_UFo_Xwo1xpmJ9qPbq7uuhTCMFT-Svqepr4hSVsbv',
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      return NewsModel.fromJson(items).news;
    } else if (response.statusCode == 401) {
      throw Exception('Error 401');
    } else if (response.statusCode == 429) {
      throw Exception('Error 429');
    } else {
      throw Exception('null');
    }
  }

  fetchByCategory(String searchParameter) async {
    final queryParameters = {
      'category': searchParameter,
    };
    final uri = Uri.https('$baseUrl', '/v1/search', queryParameters);
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader:
          'tUgFTJO_UFo_Xwo1xpmJ9qPbq7uuhTCMFT-Svqepr4hSVsbv',
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      return NewsModel.fromJson(items).news;
    } else if (response.statusCode == 401) {
      throw Exception('Error 401');
    } else if (response.statusCode == 429) {
      throw Exception('Error 429');
    } else {
      throw Exception('null');
    }
  }

  fetchByRegion(String searchParameter) async {
    final queryParameters = {
      'country': searchParameter,
    };
    final uri = Uri.https('$baseUrl', '/v1/search', queryParameters);
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader:
          'tUgFTJO_UFo_Xwo1xpmJ9qPbq7uuhTCMFT-Svqepr4hSVsbv',
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      return NewsModel.fromJson(items).news;
    } else if (response.statusCode == 401) {
      throw Exception('Error 401');
    } else if (response.statusCode == 429) {
      throw Exception('Error 429');
    } else {
      throw Exception('null');
    }
  }
}
