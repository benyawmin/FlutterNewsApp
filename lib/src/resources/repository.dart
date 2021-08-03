import 'news_api_provider.dart';

class Repository {

  fetchLatestNews() async {
    return await NewsApiProvider().fetchLatestNews();
  }
}