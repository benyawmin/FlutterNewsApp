import 'package:news/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class LatestNewsBloc {
  final _repository = Repository();

  final newsFetcher = PublishSubject();
  final catBuilder = PublishSubject();
  final filteredbyCat = PublishSubject();

  get newsStream => newsFetcher.stream;
  get catsStream => catBuilder.stream;
  get filteredbyCatStream => filteredbyCat.stream;

  fetchLatestNews() async {
    var latestNews = await _repository.fetchLatestNews();
    newsFetcher.sink.add(latestNews);
  }

  fetchLatestNewsByCategory(category) async {
    var latestNewsByCat = await _repository.fetchLatestNews();
    // var converted = await latestNewsByCat.where((news) {
    //   print(news.category);
    //   print(category);
    // }).toList();
    // print(converted);
    // var converted = [];
    // for (var news in latestNewsByCat) {
    //   for (var cat in news.category) {
    //     if (cat == category)
    //       // converted.add(news);
          filteredbyCat.sink.add(latestNewsByCat);
    //   }
    // }
    // print(converted);
    // // filteredbyCat.sink.add(converted);
    // print('FETCH LATES NEWS BY CATEGORRRRRRRRRRRRRRRRYYYYYYYYYYYYYY');
    // print(latestNewsByCat);
    // print(category);
  }

  // _catFilter() {

  // }

  buildCats(category) {
    catBuilder.sink.add(category);
  }

  dispose() {
    newsFetcher.close();
    catBuilder.close();
    filteredbyCat.close();
  }
}
