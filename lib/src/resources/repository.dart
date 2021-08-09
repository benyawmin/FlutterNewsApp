import 'package:news/src/resources/news_db_provider.dart';
import 'news_api_provider.dart';

class Repository {
  List sources = [
    newsDbProvider,
    NewsApiProvider(),
  ];
  List caches = [
    newsDbProvider,
  ];

  fetchLatestNews() async {
    return await NewsApiProvider().fetchLatestNews();
  }

  fetchAllFromDb() async {
    return await newsDbProvider.fetchAllItems();
  }

  fetchSearchedNews(String searchParameter) async {
    return await NewsApiProvider().fetchSearchedNews(searchParameter);
  }

  fetchByCategory(String searchParameter) async {
    return await NewsApiProvider().fetchByCategory(searchParameter);
  }

  fetchByRegion(String region) async {
    return await NewsApiProvider().fetchByRegion(region);
  }

  resetDb() {
    newsDbProvider.clear();
  }

  addToDb(item) {
    newsDbProvider.addItem(item);
  }
}
