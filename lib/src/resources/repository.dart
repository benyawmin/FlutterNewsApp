import 'news_api_provider.dart';

class Repository {

  fetchLatestNews() async {
    return await NewsApiProvider().fetchLatestNews();
  }

  fetchSearchedNews(String searchParameter) async {
    return await NewsApiProvider().fetchSearchedNews(searchParameter);
  }
}