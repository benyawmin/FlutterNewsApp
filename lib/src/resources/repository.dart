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
    // NewsModel item = [] as NewsModel;
    // var source;

    // for (source in sources) {
    //   item = await source.fetchItem(id);
    //   if (item != null) {
    //     break;
    //   }
    // }

    // for (var cache in caches) {
    //   if (cache != source) {
    //     cache.addItem(item);
    //   }
    // }

    // return item;
    return await NewsApiProvider().fetchLatestNews();
  }

  fetchAllFromDb() async {
    return await newsDbProvider.fetchAllItems();
  }

  fetchSearchedNews(String searchParameter) async {
    return await NewsApiProvider().fetchSearchedNews(searchParameter);
  }

  resetDb() {
    newsDbProvider.clear();
  }

  addToDb(item) {
    newsDbProvider.addItem(item);
  }
}
